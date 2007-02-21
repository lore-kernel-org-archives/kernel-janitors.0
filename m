From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Wed, 21 Feb 2007 16:07:38 +0000
Subject: Re: [KJ] BIT macro cleanup
Message-Id: <45DC6E4A.5090903@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <45CADD09.70809@bfs.de>
In-Reply-To: <45CADD09.70809@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Milind Choudhary wrote:
> there are some setbit & resetbit macros scattered here n there
> e.g.
> ./drivers/net/irda/Via-ircc.h
>
> #define SetBit(val,bit)  val=3D (unsigned char ) (val | (0x1 << bit))
> // Sets bit to 1
> #define ResetBit(val,bit) val=3D (unsigned char ) (val & ~(0x1 << bit))
> // Sets bit to 0
>
> if we move these somewhere near BIT
>
> #define SETBIT(data,mask)    (data |=3D mask)
> #define RESETBIT(data,mask)    (data &=3D ~mask)
Sounds good! But I think H=E5kon got a point, both on RESET -> CLEAR and=20
that mask can be more then one bit.
>
> usually the mask would be generated with BIT
>
> we can use the new ones to get rid of above code
> by using "cr" as data &  "uartbit" as mask
>
> what say
Mmm, so what about this?
(This I actually compile-tested ;) (after removing <asm/sizes.h> and=20
defining SZ_4K))

	(mctrl & TIOCM_RTS)  ?
		SETBITS(cr, UART011_CR_DTR)  : CLRBITS(cr, UART011_CR_DTR);
	(mctrl & TIOCM_DTR)  ?
		SETBITS(cr, UART011_CR_DTR)  : CLRBITS(cr, UART011_CR_DTR);
	(mctrl & TIOCM_OUT1) ?
		SETBITS(cr, UART011_CR_OUT1) : CLRBITS(cr, UART011_CR_OUT1);
	(mctrl & TIOCM_OUT2) ?
		SETBITS(cr, UART011_CR_OUT2) : CLRBITS(cr, UART011_CR_OUT2);
	(mctrl & TIOCM_LOOP) ?
		SETBITS(cr, UART011_CR_LBE)  : CLRBITS(cr, UART011_CR_LBE);


(I just set them to SETBITS and CLRBITS 'cause I think it looks alright)

Richard Knutsson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
