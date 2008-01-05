From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Date: Sat, 05 Jan 2008 20:53:30 +0000
Subject: Re: [PATCH] drivers/video/aty/radeon_base.c: compilation warning
Message-Id: <1199566410.7291.60.camel@pasglop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200801021901.44226.lpotenza@inwind.it>
In-Reply-To: <200801021901.44226.lpotenza@inwind.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


> 	if (rinfo->mon1_EDID)
> 		WARN_ON(sysfs_create_bin_file(&rinfo->pdev->dev.kobj, &edid1_attr));
> 
> could suppress the compilation warning while keeping the generation of a warning 
> message in case of error.
> 
> I wonder if this solution could be acceptable for you.
> 
> It doesn't sound too bloat to me, but maybe you were thinking about something 
> completely different...

That would be allright I suppose.

Ben.


