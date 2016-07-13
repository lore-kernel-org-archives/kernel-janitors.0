From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Jul 2016 19:33:30 +0000
Subject: Re: [patch] nvme-rdma: fix an error code
Message-Id: <20160713193330.GW32247@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160713100320.GC29468@mwanda>
 <57866AE4.9040407@fb.com>
In-Reply-To: <57866AE4.9040407@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jul 13, 2016 at 09:23:00AM -0700, Jens Axboe wrote:
> On 07/13/2016 03:03 AM, Dan Carpenter wrote:
> >We accidentally return success when an error code was intended.
> >
> >Fixes: 711023071960 ('nvme-rdma: add a NVMe over Fabrics RDMA host driver')
> >Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> This is already fixed, what branch are you looking at?
> 

Thanks.

Linux-next, but I wait a day before sending them out so I can review
them the next day.  So yesterday's linux-next, I guess.

regards,
dan carpenter

