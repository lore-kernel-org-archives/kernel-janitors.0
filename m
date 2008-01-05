From: Leonardo Potenza <lpotenza@inwind.it>
Date: Sat, 05 Jan 2008 13:49:01 +0000
Subject: Re: [PATCH] drivers/video/aty/radeon_base.c: compilation warning fix
Message-Id: <200801051449.02064.lpotenza@inwind.it>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200801021901.44226.lpotenza@inwind.it>
In-Reply-To: <200801021901.44226.lpotenza@inwind.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thursday 03 January 2008 21:24:07 Benjamin Herrenschmidt wrote:
> 
> On Thu, 2008-01-03 at 18:12 +0100, Leonardo Potenza wrote:
> > I thought that at least the user should be aware that something went
> > wrong in the driver initialization and that not all the features 
> > will be available at run-time. 
> > That's why I tried to add a specific warning message.
> > 
> > Anyway, I didn't intend to waste so much of your time with my patch
> > submission.
> 
> The warning is annoying... see if you can find the shortest way in term
> of code bloat to get rid of it...
> 
> Cheers,
> Ben.
> 

Maybe something like:

	if (rinfo->mon1_EDID)
		WARN_ON(sysfs_create_bin_file(&rinfo->pdev->dev.kobj, &edid1_attr));

could suppress the compilation warning while keeping the generation of a warning 
message in case of error.

I wonder if this solution could be acceptable for you.

It doesn't sound too bloat to me, but maybe you were thinking about something 
completely different...

Leonardo
