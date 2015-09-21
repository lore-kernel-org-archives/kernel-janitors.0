From: Tejun Heo <htejun@gmail.com>
Date: Mon, 21 Sep 2015 17:40:34 +0000
Subject: Re: [patch] devres: fix a for loop bounds check
Message-Id: <20150921174034.GA13263@mtj.duckdns.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150916171000.GD3243@mtj.duckdns.org>
 <20150921162151.GA5648@mwanda>
In-Reply-To: <20150921162151.GA5648@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Cristian Stoica <cristian.stoica@freescale.com>, Dan Williams <dan.j.williams@intel.com>, Abhilash Kesavan <a.kesavan@samsung.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Sep 21, 2015 at 07:21:51PM +0300, Dan Carpenter wrote:
> The iomap[] array has PCIM_IOMAP_MAX (6) elements and not
> DEVICE_COUNT_RESOURCE (16).  This bug was found using a static checker.
> It may be that the "if (!(mask & (1 << i)))" check means we never
> actually go past the end of the array in real life.
> 
> Fixes: ec04b075843d ('iomap: implement pcim_iounmap_regions()')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun
