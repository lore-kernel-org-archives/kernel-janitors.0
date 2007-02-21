From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Wed, 21 Feb 2007 09:39:32 +0000
Subject: Re: [KJ] BIT macro cleanup
Message-Id: <45DC1354.2080706@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <45CADD09.70809@bfs.de>
In-Reply-To: <45CADD09.70809@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Milind Choudhary wrote:
> Richard Knutsson wrote:
>
>> I tested with:
>> long a = 1UL << 32;
>> and GCC (4.1) said:
>> test.c:28: warning: left shift count >= width of type
> with a 32 bit long
> the bits in 1UL would be [in binary]
> 00000000000000000000000000000001
>
> if I do 1UL << 31,I'd get
>
> 10000000000000000000000000000000
>
> but with 1UL <<32 the poor "1" would fall down & die
>
>           00000000000000000000000000000000
>         1
>        1
>       1
>      1
>     1
>   ~ ~
>  ~ * ~ [inspired by the ASCII art..just trying my hand at it :)]
>   ~ ~
> ----------------
> /|\       /|\
>
Nice :)
>> And what about an LLBIT() for long long?
>> Am not sure what the %BITS_PER_LONG adds other then hiding bugs.
> yes agree.
> but we need it for users of <linux/input.h>
> how abt providing them a separate one
>
> #define BITWRAP(nr) (1UL<<((nr)%BITS_PER_LONG))
Would it be ugly to just do:
BIT(nr % BITS_PER_LONG);
I mean, it clearly shows then what they want + what about if someone 
would like to wrap on a byte? With this, it is just:
BIT(nr % BITS_PER_BYTE);

> & for others
> #define BIT(nr) (1UL<<(nr))
> #define LLBIT(nr) (1ULL<<(nr))
Looks good
>
> so that gcc only will guide them whether to use  BIT or LLBIT
> depending  upon size of long  & the "nr" value .
How do you mean, gcc "will guide them"?

Richard Knutsson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
