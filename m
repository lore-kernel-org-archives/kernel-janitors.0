From: Julia Lawall <julia.lawall@lip6.fr>
Date: Wed, 13 Sep 2017 10:01:33 +0000
Subject: Re: DR Checker and KINT static checkers
Message-Id: <alpine.DEB.2.20.1709131156450.13908@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170913095202.a6zsi3xeryzhmxrl@mwanda>
In-Reply-To: <20170913095202.a6zsi3xeryzhmxrl@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



On Wed, 13 Sep 2017, Dan Carpenter wrote:

> LWN.net recently had an article about Dr Checker.  It's a promising new
> static analysis tool.  The LWN article is for subscribers only until
> tomorrow, but anyone can read the PDF or install the code.  It would be
> really interesting if someone could run Dr Checker on a mainline kernel
> tree and post the results.
> https://lwn.net/Articles/733056/
> https://www.usenix.org/system/files/conference/usenixsecurity17/sec17-machiry.pdf
> https://github.com/ucsb-seclab/dr_checker/

I'm always puzzled by statements like:

Some 5,000 warnings were generated, of which nearly 4,000 were verified as
correct by the team. Of those, 158 were actual bugs that were reported
upstream and fixed.

If they took the time to validate 5000 bugs, couldn't they have sent more
patches, or at least made the results public in some way so that other
people could fix them?  Maybe the others are "duplicated, but correct"...

I'm a bit short on time at the moment, but if an outreachy applicant wants
to put together a precise description of how to install and run the tool,
I have plenty of computing power available :)

julia


>
> The other tool that's quite interesting is KINT which looks for integer
> overflows.  It's a bit of a pain because you have to annotate some
> kernel functions to make it work.  The PDF and source code are here:
>
> http://css.csail.mit.edu/kint/
>
> regards,
> dan carpenter
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
