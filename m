From: "Paul Bonser" <misterpib@gmail.com>
Date: Wed, 10 Jan 2007 23:01:58 +0000
Subject: Re: [KJ] powers of 2, and the boundary case of zero
Message-Id: <e6101e100701101501y799d30cbscbbd704eaff6977b@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 1/10/07, Darren Jenkins <darrenrjenkins@gmail.com> wrote:
> On 1/11/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
>
> >  i'm still
> > interested if there's a single (bitwise?) operation to do the rounding
> > up or down without involving a loop, which would be cool, but i don't
> > know if that's possible.  anyone?
>
> I don't think it is possible.

Here's a constant-time version:


static inline unsigned long round_up_to_power_of_2(unsigned long i)
{
        // if it's already a power of 2, return
        if (!(i & (i-1))) return i;

        int shift_by = 0;

        #if BITS_PER_LONG = 64
        if (i & 0xffffffff00000000) {
                shift_by += 32;
                i >>= 32;
        }
        #endif

        if (i & 0xffff0000) {
                shift_by += 16;
                i >>= 16;
        }
        if (i & 0xff00) {
                shift_by += 8;
                i >>= 8;
        }
        if (i & 0xf0) {
                shift_by += 4;
                i >>= 4;
        }
        if (i & 0xc) {
                shift_by += 2;
                i >>= 2;
        }
        if (i & 0x2)
                shift_by += 2;
        else
                shift_by += 1;

        return 1 << shift_by;
}

you could avoid doing shifts altogether if you wanted to do the binary
search using a (very large) series of nested if's. That would trim it
down to just 6 if statements (with a bitwise and each) per call, no
shifting needed.
I have another hour and a half at "work", I'll see if I can do it in that time.

-- 
Paul Bonser
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
