From: "Milind Choudhary" <milindchoudhary@gmail.com>
Date: Wed, 21 Feb 2007 14:02:29 +0000
Subject: Re: [KJ] BIT macro cleanup
Message-Id: <3b44d3fb0702210550t60874e88k4d0acf1ee021a441@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <45CADD09.70809@bfs.de>
In-Reply-To: <45CADD09.70809@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2/21/07, Richard Knutsson <ricknu-0@student.ltu.se> wrote:
> Milind Choudhary wrote:
> > ./drivers/serial/amba-pl011.c:265:
> but the next is trickier (on 280):
> #define BIT(tiocmbit, uartbit)          \
>         if (mctrl & tiocmbit)           \
>                 cr |= uartbit;          \
>         else                            \
>                 cr &= ~uartbit
> so maybe just call them both LOCAL_SETBIT or so...
>
here its either setting or resetting the bits in "cr" taking "uartbit"
as a mask.

there are some setbit & resetbit macros scattered here n there
e.g.
./drivers/net/irda/Via-ircc.h

#define SetBit(val,bit)  val= (unsigned char ) (val | (0x1 << bit))
// Sets bit to 1
#define ResetBit(val,bit) val= (unsigned char ) (val & ~(0x1 << bit))
// Sets bit to 0

if we move these somewhere near BIT

#define SETBIT(data,mask)    (data |= mask)
#define RESETBIT(data,mask)    (data &= ~mask)

usually the mask would be generated with BIT

we can use the new ones to get rid of above code
by using "cr" as data &  "uartbit" as mask

what say
-- 
Milind Arun Choudhary
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
