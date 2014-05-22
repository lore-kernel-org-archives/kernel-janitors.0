From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 May 2014 13:50:16 +0000
Subject: Re: [PATCH] ARM: imx: add missing kfree call in error paths
Message-Id: <20140522135016.GK15585@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400764482-20147-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1400764482-20147-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Thu, May 22, 2014 at 03:14:42PM +0200, Emil Goode wrote:
> We forgot to free pdev->dev.dma_mask as it is not freed
> by platform_device_put().
> 

Every function which calls imx31_alloc_mx3_camera() is buggy.  That
means that, at best, it is a 2 on Rusty's API rating.
http://sweng.the-davies.net/Home/rustys-api-design-manifesto

The correct fix is to introduce an imx31_free_mx3_camera() otherwise we
will just keep introducing these bugs.

regards,
dan carpenter

