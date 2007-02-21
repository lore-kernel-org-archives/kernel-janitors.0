From: "Milind Choudhary" <milindchoudhary@gmail.com>
Date: Wed, 21 Feb 2007 13:26:59 +0000
Subject: Re: [KJ] BIT macro cleanup
Message-Id: <3b44d3fb0702210514j348e9411k206ccea7ef9c93e@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <45CADD09.70809@bfs.de>
In-Reply-To: <45CADD09.70809@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2/21/07, Richard Knutsson <ricknu-0@student.ltu.se> wrote:

> > ./drivers/serial/amba-pl011.c:265:

> Since they are only defined within the function, what about get rid of them?
> The first one (on 265) seems just straightforward:

the macro plays with status

unsigned int status = readw(uap->port.membase + UART01x_FR);
you seem to have missed that

> -#define BIT(uartbit, tiocmbit)         \
> -       if (status & uartbit)           \
> -               result |= tiocmbit
> -
> -       BIT(UART01x_FR_DCD, TIOCM_CAR);
> -       BIT(UART01x_FR_DSR, TIOCM_DSR);
> -       BIT(UART01x_FR_CTS, TIOCM_CTS);
> -       BIT(UART011_FR_RI, TIOCM_RNG);
> -#undef BIT
> +       result |= (UART01x_FR_DCD & TIOCM_CAR) ? TIOCM_CAR :;
> +       result |= (UART01x_FR_DSR & TIOCM_DSR) ? TIOCM_DSR :;
> +       result |= (UART01x_FR_CTS & TIOCM_CTS) ? TIOCM_CTS :;
> +       result |= (UART011_FR_RI  & TIOCM_RNG) ? TIOCM_RNG :;
> +
2 things
1. its (status & uartbit) and not (uartbit & tiocmbit)
2. can't keep the false holder blank ..need to put a zero
otherwise gcc will yell at you
error: parse error before ';' token

 +       result |= (status & UART01x_FR_DCD ) ? TIOCM_CAR :0;
 +       result |= (status & UART01x_FR_DSR ) ? TIOCM_DSR :0;
 +       result |= (status & UART01x_FR_CTS ) ? TIOCM_CTS :0;
 +       result |= (status & UART011_FR_RI )    ? TIOCM_RNG :0;

-- 
Milind Arun Choudhary
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
