.model large
.stack 100h
.data
string db "                     Welcome to Sudoko Solver game ","$"
names db "                     Made by Rafay,Mutal and Saad","$"
puzzlen db "Puzzle: ","$"
spacess db "      ","$"
subline db "||","$"              ;for subgrid
slines db "|","$"             ;for sides
bline db "      --------||--------","$"               ;for upper and lower boder
wadispace db "      --------||--------","$"            ;for grid seperation
chotispace db " ","$"
print db "                          Fill the empty shells  ","$"
invalid db "Invalid input try again ","$"
counter db 0
lose db "                       You have lost the game :(","$"
solv db "Solved puzzle: ","$"
w db "                    Congratulations you solved the puzzle (:","$"
life db "                        A player would have 3 chances ","$"
puzzle db ?,4,5 dup(?),4,2 dup(?),2 dup(2,3),?,?
.code
Main proc
mov ax,@data
mov ds,ax
lea dx,string 
mov ah,09h
int 21h

call Newline
call Newline
lea dx,names
mov ah,09h
int 21h
call Newline
call Newline
call Newline
lea dx,puzzlen
mov ah,09h
int 21h
call Newline
call Borderline
call Newline
call Display
call Newline
call Borderline   
call Newline
call Newline
lea dx,life 
mov ah,09h
int 21h
call Newline
call Input
call Newline
call Newline
lea dx,solv
mov ah,09h
int 21h
call Newline
call Newline
call Display

mov ah,4ch
int 21h

Main Endp



Display Proc
mov si,offset puzzle
mov cx,4
call Spaces

l1:

cmp cx,2
Je dprint
call sideline
call Sspace
jmp normal
dprint:
call Subgrid
call Sspace
jmp normal
normal:
mov ax,[si]
add ax,48
mov dx,ax
mov ah,02h
int 21h
add si,1
call Sspace
loop l1
call sideline
mov dx,10
mov ah,02h
int 21h
call Borderline
call Newline
mov cx,4
call Spaces
l2:

cmp cx,2
Je dprints
call sideline
call Sspace
jmp normals
dprints:                    
call Subgrid
call Sspace
jmp normals
normals:
mov ax,[si]
add ax,48
mov dx,ax
mov ah,02h
int 21h
add si,1
call Sspace
loop l2
call sideline
mov dx,10
mov ah,02h
int 21h
call Grid
call Newline
call Grid
call Newline
mov cx,4
call Spaces
l3:

cmp cx,2
Je dprintss
call sideline
call Sspace
jmp normalss
dprintss:                    
call Subgrid
call Sspace
jmp normalss
normalss:
mov ax,[si]
add ax,48
mov dx,ax
mov ah,02h
int 21h
add si,1
call Sspace
loop l3
call sideline
mov dx,10
mov ah,02h
int 21h
call Borderline
call Newline
mov cx,4
call Spaces
l4:

cmp cx,2
Je dprintsss
call sideline
call Sspace
jmp normalsss
dprintsss:                    
call Subgrid
call Sspace
jmp normalsss
normalsss:
mov ax,[si]
add ax,48
mov dx,ax
mov ah,02h
int 21h
add si,1
call Sspace
loop l4
call sideline
ret 
Display Endp

Input Proc


call Newline
lea dx,print
mov ah,09h
int 21h
call Newline
call Newline
got:
mov di,offset puzzle
mov cx,1
fvalue:
mov ah,01h
int 21h
sub al,48
cmp al,[di+1]
Je inv
cmp al,[di+2]
Je inv
cmp al,[di+3]
Je inv
cmp al,[di+4]
je inv
cmp al,[di+5]
je inv
cmp al,[di+8]
je inv
cmp al,[di+12]
je inv
cmp al,1
jl inv
cmp al,4
jg inv
mov [di],al
jmp n
inv:
inc counter
cmp counter,3
je lost
call Newline
lea dx,invalid
mov ah,09h
int 21h
call Newline
jmp got
lost:
call Newline
lea dx,lose
mov ah,09h
int 21h
n:

inc di
loop fvalue
inc di


call Sspace
call Sspace



mov cx,1
tvalue:
jmp g
gots:
g:
mov ah,01h
int 21h
sub al,48
cmp al,[di-1]
Je invs
cmp al,[di-2]
Je invs
cmp al,[di+1]
Je invs
cmp al,[di+4]
je invs
cmp al,[di+5]
je invs
cmp al,[di+8]
je invs
cmp al,[di+12]
je invs
cmp al,1
jl invs
cmp al,4
jg invs
mov [di],al
jmp ns
invs:
inc counter
cmp counter,3
je losts
call Newline
lea dx,invalid
mov ah,09h
int 21h
call Newline
jmp gots
losts:
call Newline
lea dx,lose
mov ah,09h
int 21h
ns:

inc di
loop tvalue

call Sspace 
call Sspace


mov cx,1
fovalue:
jmp gi
gotss:
gi:
mov ah,01h
int 21h
sub al,48
cmp al,[di-1]
Je invss
cmp al,[di-2]
Je invss
cmp al,[di+1]
Je invss
cmp al,[di+4]
je invss
cmp al,[di+5]
je invss
cmp al,[di+8]
je invss
cmp al,[di+12]
je invss
cmp al,1
jl invss
cmp al,4
jg invss
mov [di],al
jmp nss
invss:
inc counter
cmp counter,3
je lostss
call Newline
lea dx,invalid
mov ah,09h
int 21h
call Newline
jmp gotss
lostss:
call Newline
lea dx,lose
mov ah,09h
int 21h
nss:

inc di
loop fovalue

call Newline


mov cx,1
fifvalue:
jmp gii
gotsss:
gii:
mov ah,01h
int 21h
sub al,48
cmp al,[di-3]
Je invsss
cmp al,[di-4]
Je invsss
cmp al,[di+1]
Je invsss
cmp al,[di+2]
je invsss
cmp al,[di+3]
je invsss
cmp al,[di+4]
je invsss
cmp al,[di+8]
je invsss
cmp al,1
jl invsss
cmp al,4
jg invsss
mov [di],al
jmp nsss
invsss:
inc counter
cmp counter,3
je lostsss
call Newline
lea dx,invalid
mov ah,09h
int 21h
call Newline
jmp gotsss
lostsss:
call Newline
lea dx,lose
mov ah,09h
int 21h
nsss:

inc di
loop fifvalue

call Sspace
call Sspace

mov cx,1
sixvalue:
jmp giii
gotssss:
giii:
mov ah,01h
int 21h
sub al,48
cmp al,[di-1]
Je invssss
cmp al,[di-4]
Je invssss
cmp al,[di-5]
Je invssss
cmp al,[di+1]
je invssss
cmp al,[di+1]
je invssss
cmp al,[di+4]
je invssss
cmp al,[di+8]
je invssss
cmp al,1
jl invssss
cmp al,4
jg invssss
mov [di],al
jmp nssss
invssss:
inc counter
cmp counter,3
je lostssss
call Newline
lea dx,invalid
mov ah,09h
int 21h
call Newline
jmp gotssss
lostssss:
call Newline
lea dx,lose
mov ah,09h
int 21h
nssss:

inc di
loop sixvalue


call Sspace
call Sspace


mov cx,1
sevvalue:
jmp giiii
gotsssss:
giiii:
mov ah,01h
int 21h
sub al,48
cmp al,[di-1]
Je invsssss
cmp al,[di-2]
Je invsssss
cmp al,[di-3]
Je invsssss
cmp al,[di-4]
je invsssss
cmp al,[di+1]
je invsssss
cmp al,[di+4]
je invsssss
cmp al,[di+8]
je invsssss
cmp al,1
jl invsssss
cmp al,4
jg invsssss
mov [di],al
jmp nsssss
invsssss:
inc counter
cmp counter,3
je lostsssss
call Newline
lea dx,invalid
mov ah,09h
int 21h
call Newline
jmp gotsssss
lostsssss:
call Newline
lea dx,lose
mov ah,09h
int 21h
nsssss:

inc di
loop sevvalue

inc di
call Newline

mov cx,1
nenvalue:
jmp giiiii
gotssssss:
giiiii:
mov ah,01h
int 21h
sub al,48
cmp al,[di-8]
Je invssssss
cmp al,[di-4]
Je invssssss
cmp al,[di+1]
Je invssssss
cmp al,[di+2]
je invssssss
cmp al,[di+3]
je invssssss
cmp al,[di+4]
je invssssss
cmp al,[di+5]
je invssssss
cmp al,1
jl invssssss
cmp al,4
jg invssssss
mov [di],al
jmp nssssss
invssssss:
inc counter
cmp counter,3
je lostssssss
call Newline
lea dx,invalid
mov ah,09h
int 21h
call Newline
jmp gotssssss
lostssssss:
call Newline
lea dx,lose
mov ah,09h
int 21h
nssssss:

inc di
loop nenvalue

call Sspace
call Sspace





mov cx,1
tenvalue:
jmp giiiiii
gotsssssss:
giiiiii:
mov ah,01h
int 21h
sub al,48
cmp al,[di-1]
Je invsssssss
cmp al,[di-4]
Je invsssssss
cmp al,[di-8]
Je invsssssss
cmp al,[di+1]
je invsssssss
cmp al,[di+2]
je invsssssss
cmp al,[di+3]
je invsssssss
cmp al,[di+4]
je invsssssss
cmp al,1
jl invsssssss
cmp al,4
jg invsssssss
mov [di],al
jmp nsssssss
invsssssss:
inc counter
cmp counter,3
je lostsssssss
call Newline
lea dx,invalid
mov ah,09h
int 21h
call Newline
jmp gotsssssss
lostsssssss:
call Newline
lea dx,lose
mov ah,09h
int 21h
nsssssss:

inc di
loop tenvalue


call Newline

mov cx,4
increl:
inc di
loop increl





mov cx,1
fiftvalue:
jmp giiiiiii
gotssssssss:
giiiiiii:
mov ah,01h
int 21h
sub al,48
cmp al,[di-1]
Je invssssssss
cmp al,[di-2]
Je invssssssss
cmp al,[di-3]
Je invssssssss
cmp al,[di-4]
je invssssssss
cmp al,[di-8]
je invssssssss
cmp al,[di-12]
je invssssssss
cmp al,[di+1]
je invssssssss
cmp al,1
jl invssssssss
cmp al,4
jg invssssssss
mov [di],al
jmp nssssssss
invssssssss:
inc counter
cmp counter,3
je lostssssssss
call Newline
lea dx,invalid
mov ah,09h
int 21h
call Newline
jmp gotssssssss
lostssssssss:
call Newline
lea dx,lose
mov ah,09h
int 21h
nssssssss:

inc di
loop fiftvalue


call Sspace
call Sspace

mov cx,1
sixtvalue:
jmp giiiiiiii
gotsssssssss:
giiiiiiii:
mov ah,01h
int 21h
sub al,48
cmp al,[di-4]
Je invsssssssss
cmp al,[di-8]
Je invsssssssss
cmp al,[di-12]
Je invsssssssss
cmp al,[di-1]
je invsssssssss
cmp al,[di-2]
je invsssssssss
cmp al,[di-3]
je invsssssssss
cmp al,[di-4]
je invsssssssss
cmp al,1
jl invsssssssss
cmp al,4
jg invsssssssss
mov [di],al
jmp nsssssssss
invsssssssss:
inc counter
cmp counter,3
je lostsssssssss
call Newline
lea dx,invalid
mov ah,09h
int 21h
call Newline
jmp gotsssssssss
lostsssssssss:
call Newline
lea dx,lose
mov ah,09h
int 21h
nsssssssss:
call Newline
jmp win
win:
call Newline
lea dx,w
mov ah,09h
int 21h

loop sixtvalue

ret
Input endp

Newline Proc
mov dx,10
mov ah,02h
int 21h
ret 
Newline Endp

Spaces Proc
lea dx,spacess
mov ah,09h
int 21h
ret
Spaces Endp

Borderline Proc
lea dx,bline
mov ah,09h
int 21h
ret
Borderline endp


sideline Proc
lea dx,slines
mov ah,09h
int 21h
ret 
sideline endp

Subgrid Proc
lea dx,subline
mov ah,09h
int 21h
ret
Subgrid endp


Sspace Proc
lea dx,chotispace 
mov ah,09h
int 21h
ret
Sspace endp

Grid Proc
lea dx,wadispace
mov ah,09h
int 21h
ret
Grid endp


end
