From: Vinod Koul <vkoul@kernel.org>
Date: Thu, 13 Feb 2020 15:19:39 +0000
Subject: Re: [PATCH] dmaengine: idxd: Fix error handling in idxd_wq_cdev_dev_setup()
Message-Id: <20200213150739.GP2618@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200205123248.hmtog7qa2eiqaagh@kili.mountain>
In-Reply-To: <20200205123248.hmtog7qa2eiqaagh@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dave Jiang <dave.jiang@intel.com>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org

On 05-02-20, 15:32, Dan Carpenter wrote:
> We can't call kfree(dev) after calling device_register(dev).  The "dev"
> pointer has to be freed using put_device().

Applied, thanks

-- 
~Vinod
