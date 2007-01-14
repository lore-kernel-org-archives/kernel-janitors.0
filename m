From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 14 Jan 2007 09:38:14 +0000
Subject: Re: [KJ] Plunge
Message-Id: <Pine.LNX.4.64.0701140435320.12476@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4f8a82c571b69fade74ef67bbb654219@acm.org>
In-Reply-To: <4f8a82c571b69fade74ef67bbb654219@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 12 Jan 2007, Jesper Juhl wrote:

> On 12/01/07, Matthew Whitehead <whiteheadm@acm.org> wrote:
> > Okay, I'm ready to take the plunge and request a beginner's
> > kernel-janitors assignment.  Anyone got something I can do for the
> > community?
> >
>
> Take a look at the TODO ( http://kernelnewbies.org/KernelJanitors/Todo ).
> Pick some task that you think you can handle.
> Create a patch and send it in for review.

just for the entertainment value, it's worth grepping the entire
source tree for the word "deprecated" to see how much of that can
actually be removed.

and, yes, i understand that "deprecated" doesn't mean "removable,"
only "discouraged."  however, at some point, something that's been
"deprecated" for a sufficient period of time should finally be
deleted, no?

rday

p.s.  and, remember, boys and girls, it's spelled "deprecated," not
"depreciated."  :-)
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
