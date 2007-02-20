From: "Milind Choudhary" <milindchoudhary@gmail.com>
Date: Tue, 20 Feb 2007 20:30:45 +0000
Subject: Re: [KJ] BIT macro cleanup
Message-Id: <3b44d3fb0702201218g799de5a3p2855108ad19de511@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <45CADD09.70809@bfs.de>
In-Reply-To: <45CADD09.70809@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2/21/07, Richard Knutsson <ricknu-0@student.ltu.se> wrote:
> Milind Choudhary wrote:
> > ./drivers/net/s2io.h:17:
> > #define BIT(loc)                (0x8000000000000000ULL >> (loc))
> What about just delete that definition and fix those who uses it to"our"
> BIT? (since it is always 64 bits it should be BIT(63 - x), right?)
sure . would look into that

> BTW, how is BIT() supposed to be defined? Is it:
> #define BIT(x)  (1ULL << (x))
initially i started of with the same
but it broke for users of linux/input.h..overflow!

just keying in my understanding about the same CMIIW
in <linux/input.h> there are some macros like
#define NBITS(x) (((x)/BITS_PER_LONG)+1)
#define BIT(x)  (1UL<<((x)%BITS_PER_LONG))
#define LONG(x) ((x)/BITS_PER_LONG)

These macros are used to get the bitmasks in an array,
when the number of bits exceeds BITS_PER_LONG.

NBITS macro tells us number of elements required in the array
say i have 78 different keys & BITS_PER_LONG is 32 then
I need 3 elements in the array to have unique bitmask for each key.

e.g.
unsigned long keybit[NBITS(KEY_MAX)];
keybit[LONG(BTN_TOUCH)] = BIT(BTN_TOUCH);

 LONG indexes in the array & BIT gives a 32/64 bit mask.

so i've now changed BIT to something like

#define BIT(nr) (1UL<<((nr)%BITS_PER_LONG))

Milind Arun Choudhary
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
