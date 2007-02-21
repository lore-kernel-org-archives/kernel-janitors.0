From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Wed, 21 Feb 2007 05:56:42 +0000
Subject: Re: [KJ] BIT macro cleanup
Message-Id: <45DBDF1A.9060803@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <45CADD09.70809@bfs.de>
In-Reply-To: <45CADD09.70809@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Milind Choudhary wrote:
> On 2/21/07, Richard Knutsson <ricknu-0@student.ltu.se> wrote:
>> BTW, how is BIT() supposed to be defined? Is it:
>> #define BIT(x)  (1ULL << (x))
> initially i started of with the same
> but it broke for users of linux/input.h..overflow!
Ouch. I did some random tests with other BIT() were I changed it from UL 
to ULL and they all compiled without problem.
> so i've now changed BIT to something like
>
> #define BIT(nr) (1UL<<((nr)%BITS_PER_LONG))
Am not sure what the %BITS_PER_LONG adds other then hiding bugs. I 
tested with:
long a = 1UL << 32;
and GCC (4.1) said:
test.c:28: warning: left shift count >= width of type

And what about an LLBIT() for long long?

Richard Knutsson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
