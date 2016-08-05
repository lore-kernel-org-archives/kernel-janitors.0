From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 05 Aug 2016 20:28:16 +0000
Subject: Re: [patch] powerpc/fsl_rio: fix a missing error code
Message-Id: <20160805202815.GB4186@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160804053525.GM775@mwanda>
 <20160804131600.bd2f72d2a0a6d8deec0af79b@linux-foundation.org>
In-Reply-To: <20160804131600.bd2f72d2a0a6d8deec0af79b@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Alexandre Bounine <alexandre.bounine@idt.com>, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org

On Thu, Aug 04, 2016 at 01:16:00PM -0700, Andrew Morton wrote:
> On Thu, 4 Aug 2016 08:35:25 +0300 Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> > We should set the error code here.  Otherwise static checkers complain.
> > 
> 
> hm.
> 
> > --- a/arch/powerpc/sysdev/fsl_rio.c
> > +++ b/arch/powerpc/sysdev/fsl_rio.c
> > @@ -491,6 +491,7 @@ int fsl_rio_setup(struct platform_device *dev)
> >  	rmu_node = of_parse_phandle(dev->dev.of_node, "fsl,srio-rmu-handle", 0);
> >  	if (!rmu_node) {
> >  		dev_err(&dev->dev, "No valid fsl,srio-rmu-handle property\n");
> > +		rc = -ENOENT;
> >  		goto err_rmu;
> >  	}
> >  	rc = of_address_to_resource(rmu_node, 0, &rmu_regs);
> 
> afaict the function will return 0 in this case, which is a flat out
> bug.  But why do static checkers complain?  The code will return a
> suitably initialized value?
> 
> IOW, please always quote the checker/compiler output when fixing a bug!

Coccinelle has a check for missing error codes and I'm working on one
for Smatch as well.

regards,
dan carpenter

