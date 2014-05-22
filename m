From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 May 2014 20:44:54 +0000
Subject: Re: [PATCH] ARM: imx: introduce function imx_free_mx3_camera
Message-Id: <20140522204453.GN15585@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400781080-6117-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1400781080-6117-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Thu, May 22, 2014 at 07:51:19PM +0200, Emil Goode wrote:
> We forgot to free pdev->dev.dma_mask on error after
> having called the imx_alloc_mx3_camera function.
> This patch introduces the imx_free_mx3_camera function
> that adds the missing kfree call and is practical for
> future usage with imx_alloc_mx3_camera().
> 
> Signed-off-by: Emil Goode <emilgoode@gmail.com>

Fantastic.  Thanks for this.  :)

regards,
dan carpenter

