From: Logan Gunthorpe <logang@deltatee.com>
Date: Mon, 25 Mar 2019 15:49:31 +0000
Subject: Re: [PATCH] ntb_hw_switchtec: potential shift wrapping bug in switchtec_ntb_init_sndev()
Message-Id: <e2bc8cf0-8e3e-9335-e21b-4a9697e9c0ef@deltatee.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190325091726.GD16023@kadam>
In-Reply-To: <20190325091726.GD16023@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Kurt Schwemmer <kurt.schwemmer@microsemi.com>, Kelvin Cao <kelvin.cao@microsemi.com>
Cc: Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, linux-pci@vger.kernel.org, linux-ntb@googlegroups.com, kernel-janitors@vger.kernel.org

Thanks!

On 2019-03-25 3:17 a.m., Dan Carpenter wrote:
> This code triggers a Smatch warning:
> 
>     drivers/ntb/hw/mscc/ntb_hw_switchtec.c:884 switchtec_ntb_init_sndev()
>     warn: should '(1 << sndev->peer_partition)' be a 64 bit type?
> 
> The "part_map" and "tpart_vec" variables are u64 type so this seems like
> a valid warning.
> 
> Fixes: 3df54c870f52 ("ntb_hw_switchtec: Allow using Switchtec NTB in multi-partition setups")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
