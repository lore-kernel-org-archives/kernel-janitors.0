From: Jon Mason <jdmason@kudzu.us>
Date: Thu, 13 Jun 2019 13:25:53 +0000
Subject: Re: [PATCH] ntb_hw_switchtec: potential shift wrapping bug in switchtec_ntb_init_sndev()
Message-Id: <20190613132553.GC1572@kudzu.us>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190325091726.GD16023@kadam>
 <e2bc8cf0-8e3e-9335-e21b-4a9697e9c0ef@deltatee.com>
In-Reply-To: <e2bc8cf0-8e3e-9335-e21b-4a9697e9c0ef@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Logan Gunthorpe <logang@deltatee.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Kurt Schwemmer <kurt.schwemmer@microsemi.com>, Kelvin Cao <kelvin.cao@microsemi.com>, Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, linux-pci@vger.kernel.org, linux-ntb@googlegroups.com, kernel-janitors@vger.kernel.org

On Mon, Mar 25, 2019 at 09:49:31AM -0600, Logan Gunthorpe wrote:
> Thanks!
> 
> On 2019-03-25 3:17 a.m., Dan Carpenter wrote:
> > This code triggers a Smatch warning:
> > 
> >     drivers/ntb/hw/mscc/ntb_hw_switchtec.c:884 switchtec_ntb_init_sndev()
> >     warn: should '(1 << sndev->peer_partition)' be a 64 bit type?
> > 
> > The "part_map" and "tpart_vec" variables are u64 type so this seems like
> > a valid warning.
> > 
> > Fixes: 3df54c870f52 ("ntb_hw_switchtec: Allow using Switchtec NTB in multi-partition setups")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Reviewed-by: Logan Gunthorpe <logang@deltatee.com>

Sorry for the delay.  The patch is now in the ntb branch.  We've
missed window for 5.2, but it will be in the 5.3 pull request.

Thanks,
Jon

> 
> -- 
> You received this message because you are subscribed to the Google Groups "linux-ntb" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-ntb+unsubscribe@googlegroups.com.
> To post to this group, send email to linux-ntb@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/linux-ntb/e2bc8cf0-8e3e-9335-e21b-4a9697e9c0ef%40deltatee.com.
> For more options, visit https://groups.google.com/d/optout.
