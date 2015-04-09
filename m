From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 09 Apr 2015 12:36:33 +0000
Subject: Re: [PATCH 2/2] ide: replace GFP_ATOMIC by GFP_KERNEL
Message-Id: <20150409123633.GN10964@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1428579988-10167-1-git-send-email-lambert.quentin@gmail.com>
 <1428579988-10167-3-git-send-email-lambert.quentin@gmail.com>
In-Reply-To: <1428579988-10167-3-git-send-email-lambert.quentin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Quentin Lambert <lambert.quentin@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Apr 09, 2015 at 01:46:28PM +0200, Quentin Lambert wrote:
> Both pmac_ide_init_dma and ide_dma_sgiioc4 are stored in the init_dma field of
> an ide_port_info structure. This field seems to only be called from contexts
> where sleep is allowed. Therefore, this patch replaces uses of GFP_ATOMIC by
> GFP_KERNEL.
> 
> Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>

Oh.  They're not GFP_ATOMIC.

Fold these two patches together into one patch and resend.

regards,
dan carpenter

