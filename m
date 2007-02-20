From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Tue, 20 Feb 2007 19:33:12 +0000
Subject: Re: [KJ] BIT macro cleanup
Message-Id: <45DB4CF8.5060409@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <45CADD09.70809@bfs.de>
In-Reply-To: <45CADD09.70809@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Milind Choudhary wrote:
> ./drivers/net/s2io.h:17:
> #define BIT(loc)                (0x8000000000000000ULL >> (loc))
>   
[snip]
> third one is close to our BIT...but defines the bit position in reverse order
> thought of moving it to bitops.h with name BITREV..
> wouldn't it be mistaken for bit reversal?
> suggest a name plz.
>   
What about just delete that definition and fix those who uses it to"our" 
BIT? (since it is always 64 bits it should be BIT(63 - x), right?)

Richard Knutsson

PS
BTW, how is BIT() supposed to be defined? Is it:

#define BIT(x)	(1ULL << (x))


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
