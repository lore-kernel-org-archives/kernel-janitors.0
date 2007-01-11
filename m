From: "Darren Jenkins" <darrenrjenkins@gmail.com>
Date: Thu, 11 Jan 2007 02:06:01 +0000
Subject: Re: [KJ] powers of 2, and the boundary case of zero
Message-Id: <82faac5b0701101806s426b46c5p30c782b647ae91a7@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 1/11/07, Paul Bonser <misterpib@gmail.com> wrote:
> Here's a constant-time version:
>
>
> static inline unsigned long round_up_to_power_of_2(unsigned long i)
> {
>         // if it's already a power of 2, return
>         if (!(i & (i-1))) return i;
>
>         int shift_by = 0;
>
>         #if BITS_PER_LONG = 64
>         if (i & 0xffffffff00000000) {
>                 shift_by += 32;
>                 i >>= 32;
>         }
>         #endif
>
>         if (i & 0xffff0000) {
>                 shift_by += 16;
>                 i >>= 16;
>         }
>         if (i & 0xff00) {
>                 shift_by += 8;
>                 i >>= 8;
>         }
>         if (i & 0xf0) {
>                 shift_by += 4;
>                 i >>= 4;
>         }
>         if (i & 0xc) {
>                 shift_by += 2;
>                 i >>= 2;
>         }
>         if (i & 0x2)
>                 shift_by += 2;
>         else
>                 shift_by += 1;
>
>         return 1 << shift_by;
> }
>
> you could avoid doing shifts altogether if you wanted to do the binary
> search using a (very large) series of nested if's. That would trim it
> down to just 6 if statements (with a bitwise and each) per call, no
> shifting needed.

Clever idea, but is this to big to inline ?

also was thinking we should add

static inline unsigned long round_down_to_power_of_2(unsigned long i)
{

+     i &= ~(i>>1);
    while (i & (i - 1))
        i &= (i - 1);

    return i;
}

which follows from my eirlier idea.


Darren J.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
