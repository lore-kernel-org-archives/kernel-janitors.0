From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 09 Jan 2007 14:46:20 +0000
Subject: Re: [KJ] powers of 2, and the boundary case of zero
Message-Id: <Pine.LNX.4.64.0701090943540.6079@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 9 Jan 2007, Jaco Kroon wrote:

> Darren Jenkins wrote:

> > As for names, I would go for something like
> >
> > #define IS_POWER_OF_2(x) ((x & (x - 1)) = 0)
>
> hmm, doesn't this once more give the problem min/max has where arguments
> gets evaluated twice?  Or even in this case, what about something like
> IS_POWER_OF_2(x - 1) ... ?
>
> For the complex parameters just put the xs in ()s, something like:
>
> #define IS_POWER_OF_2(x) (((x) & ((x) - 1)) = 0)
>
> Or do I have my order of priority on my operations totally screwed up?
>
> As for the evaluating x twice, min and max has a complex hack which can
> easily be duplicated:
>
> #define IS_POWER_OF_2(x)  ({ typeof (x) __tmp = (x); \
> 	((__tmp & (__tmp - 1)) = 0) })

that's why i mentioned inline functions earlier.  obviously, these
macros would have to be carefully designed to avoid the well-known
macro side effects, if you choose to use macros.

rday

p.s.  that's not really a "complex hack," just a well-known gcc
extension.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
