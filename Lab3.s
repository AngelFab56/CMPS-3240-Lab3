.text

.extern printf


#       Want to add a + b into a temp register (temp = a + b)
#       a will then equal to b (a = b)
#       b will equal to temp (b = temp)

.global main
main:
        /*      Initialize variables    */

        mov x19, 0x0                    /*      Value to print                  */
        mov x20, #2                     /*      Have register x20 be i=2        */
        mov x21, #0                     /*      Have register x21 be A=0        */
        mov x22, #1                     /*      Have register x22 be B=1        */
        mov x23, #11                    /*      Have register x23 be n=12       */


        /*      Start of code   */

_looptop: cmp x20, x23
        bgt _exit

        ldr x0, =string1                /*      Have register x0 be printf      */
        mov x1, x22
        bl printf

        # x24 is temp

        adds x24, x21, x22              /*      temp = a + b            */
        mov x21, x22                    /*      a = b                   */
        mov x22, x24                    /*      b = temp                */

_a1:

        adds x20, x20, #1               /*      i = i + 1       */
        #cmp x20, x23                   /*      Check if i incremented to 10    */
        b _looptop              /*      Branch not equal to     */

_exit:

        mov x8, #93
        mov x0, #0
        svc #0


/*      Static Variable Section         */

.data
string1:
        .ascii "%d\n"
