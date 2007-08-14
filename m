From: vignesh babu <vignesh.babu@wipro.com>
Date: Tue, 14 Aug 2007 10:17:59 +0000
Subject: [KJ] Re: rounddown_pow_of_2 inclusion into log2.h
Message-Id: <1187085959.3874.23.camel@merlin.linuxcoe.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

13 that i can identify as of now :)

On Tue, 2007-08-14 at 05:48 -0400, Robert P. J. Day wrote:
> On Tue, 14 Aug 2007, vignesh babu wrote:
> 
> >
> > rday,
> >
> >   Any plans on including what Andrew Morton suggested in the near
> > future? Think you have had enough time to convince yourself ;)
> 
>   if there's value in it, the following seems to work fine in terms of
> rounding down to the nearest power of two.
> 
> static inline unsigned long
> rounddown_pow_of_two(unsigned long n)
> {
> 	return (n = 1) ? 0 : (1UL << ilog2(n));
> }
> 
>   args that are already a power of two will be unchanged, 1 will
> clearly return 0, but an arg of zero should also be caught since
> that's undefined -- perhaps it should also return zero?
> 
>   in any event, that routine seems to work fine.  are there enough
> places in the source tree to make this cleanup worth it?
> 
> rday
-- 
Vignesh Babu BM 
_____________________________________________________________ 
"Why is it that every time I'm with you, makes me believe in magic?"

_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
