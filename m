From: Ron Gage <ron@rongage.org>
Date: Fri, 13 Feb 2004 21:20:27 +0000
Subject: Re: [Kernel-janitors] [PATCH] - 2.6.2 - security.h - compiler cleanups
Message-Id: <200402131620.27952.ron@rongage.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200402122141.59608.ron@rongage.org>
In-Reply-To: <200402122141.59608.ron@rongage.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Friday 13 February 2004 03:42 pm, Greg KH wrote:
> On Thu, Feb 12, 2004 at 09:41:59PM -0500, Ron Gage wrote:
> > Well, it's probably useless, but I like clean compiles.
> >
> > This "large" patch eliminates a bunch of "parameter defined but not used"
> > warnings in the kernel.  The problems surround the stub functions in
> > security.h that haven't been coded yet.
>
> What compiler version are you using that you see these "warnings"?  I
> don't see them here using 3.3.2.
I am using gcc 3.2.2 here.


Per the instructions from the janitors to-do list....

- Signedness issues. We have _lots_ of these.
  Adding a -W to the kernel build line shows them. We have lots of code paths
  that are not executed because comparisons <0 on an unsigned int always
  evaluates to true.

Doing this also exposes a LOT of unused parameter/unused variable warnings - a 
LOT in this case means that "make 2>../errors" generated a 5.8 meg file.  I 
though it would appropriate to clean up ALL warnings, not just the signedness 
problems.

>
> And I really don't think that any kernel developer will accept these
> patches, I know I sure will not.
>

Well, I guess I shouldn't have presumed to fix all the warnings.  My bad... 
Sorry about that...



-- 
Ron Gage - LPIC1, MCP, A+, Net+
Pontiac, Michigan

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
