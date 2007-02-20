From: "Milind Choudhary" <milindchoudhary@gmail.com>
Date: Tue, 20 Feb 2007 18:28:54 +0000
Subject: Re: [KJ] BIT macro cleanup
Message-Id: <3b44d3fb0702201016i49d36e72ke8f95476dc0e7e7f@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <45CADD09.70809@bfs.de>
In-Reply-To: <45CADD09.70809@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There are 3 BIT macros which aren't really upto their name

./drivers/i2c/busses/i2c-pxa.c:71:
#define BIT(m, s, u)    { .mask = m, .set = s, .unset = u }

./drivers/serial/amba-pl011.c:265:
#define BIT(uartbit, tiocmbit)          \

./drivers/net/s2io.h:17:
#define BIT(loc)                (0x8000000000000000ULL >> (loc))

they will now clash with the new BIT macro in bitops.h
for the time being i just did #undef BIT

looking for some meaningful names.

third one is close to our BIT...but defines the bit position in reverse order
thought of moving it to bitops.h with name BITREV..
wouldn't it be mistaken for bit reversal?
suggest a name plz.

Milind Arun Choudhary
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
