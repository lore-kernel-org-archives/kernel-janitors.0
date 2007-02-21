From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Wed, 21 Feb 2007 11:59:54 +0000
Subject: Re: [KJ] BIT macro cleanup
Message-Id: <45DC343A.9000204@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <45CADD09.70809@bfs.de>
In-Reply-To: <45CADD09.70809@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Milind Choudhary wrote:
> There are 3 BIT macros which aren't really upto their name
>
> ./drivers/i2c/busses/i2c-pxa.c:71:
> #define BIT(m, s, u)    { .mask = m, .set = s, .unset = u }
>   
BIT seems like a strange name for it. But the least intrusive would be 
something like SETBIT, I think.
> ./drivers/serial/amba-pl011.c:265:	
> #define BIT(uartbit, tiocmbit)          \
>   
Since they are only defined within the function, what about get rid of them?
The first one (on 265) seems just straightforward:

-#define BIT(uartbit, tiocmbit)		\
-	if (status & uartbit)		\
-		result |= tiocmbit
-
-	BIT(UART01x_FR_DCD, TIOCM_CAR);
-	BIT(UART01x_FR_DSR, TIOCM_DSR);
-	BIT(UART01x_FR_CTS, TIOCM_CTS);
-	BIT(UART011_FR_RI, TIOCM_RNG);
-#undef BIT
+	result |= (UART01x_FR_DCD & TIOCM_CAR) ? TIOCM_CAR :;
+	result |= (UART01x_FR_DSR & TIOCM_DSR) ? TIOCM_DSR :;
+	result |= (UART01x_FR_CTS & TIOCM_CTS) ? TIOCM_CTS :;
+	result |= (UART011_FR_RI  & TIOCM_RNG) ? TIOCM_RNG :;
+

but the next is trickier (on 280):
#define BIT(tiocmbit, uartbit)		\
	if (mctrl & tiocmbit)		\
		cr |= uartbit;		\
	else				\
		cr &= ~uartbit
so maybe just call them both LOCAL_SETBIT or so...

Just my 2c
Richard Knutsson


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
