From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 07 Jun 2013 20:55:09 +0000
Subject: Re: puzzling code in nvme_configure_admin_queue()
Message-Id: <20130607161218.GU23987@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130607114503.GA7768@debian>
In-Reply-To: <20130607114503.GA7768@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Jun 07, 2013 at 01:44:24PM +0000, Wilcox, Matthew R wrote:
> Hi Dan,
> 
> We have to program the device with the page size so it knows where the page boundaries are.
> I could put all this on one logical line like this:
> 
> dev->ctrl_config = NVME_CC_ENABLE | NVME_CC_CSS_NVM |
>                            ((PAGE_SHIFT - 12) << NVME_CC_MPS_SHIFT |
>                            NVME_CC_ARB_RR | NVME_CC_SHN_NONE |
>                            NVME_CC_IOSQES | NVME_CC_IOCQES;
> 
> in order to shut up the warning, but is that really more readable?

It wouldn't shut up the complaint either...

No worries.

regards,
dan carpenter
