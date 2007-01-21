From: Tobias Klauser <tklauser@distanz.ch>
Date: Sun, 21 Jan 2007 10:36:56 +0000
Subject: Re: [KJ] standardizing on boolean variables?
Message-Id: <20070121103656.GU31196@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701210324380.13751@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701210324380.13751@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2007-01-21 at 09:36:33 +0100, Robert P. J. Day <rpjday@mindspring.com> wrote:
>   how hard would it be to define a standard for a simple true/false
> boolean variable for the kernel?  gcc has had support for the C99
> "_Bool" type for years, and additionally defines, in
> include/linux/types.h:
> 
>   typedef _Bool                   bool;
> 
> so there's no reason to not use "bool" anywhere you need an actual
> boolean, is there?
> 
>   however, it seems everyone wants to define their own macros for
> the actual values "true" and "false":
> 
>   $ grep -r "define TRUE" .
>   $ grep -r "define FALSE" .
> 
> yeesh.  would there be a problem adding those two defines to
> "types.h", then deleting all those additional macro definitions?
> 
>   one might also get rid of redundant typedefs like:
> 
>   $ grep -r "typedef.*bool" .
> 
> where people insist on re-inventing their own booleans types.

There was an effort by Andrew Morton [1] to clean this up some time ago.
AFAIR the patch wasn't accepted but I don't remember the exact reason.

[1] http://marc2.theaimsgroup.com/?l=linux-kernel&m4250357613993&w=2

Cheers,
Tobias
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
