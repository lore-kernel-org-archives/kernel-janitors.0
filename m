From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 28 Jun 2015 11:30:13 +0000
Subject: Re: [PATCH] block-rsxx: Deletion of an unnecessary check before the function call "vfree"
Message-Id: <558FDAC5.8020902@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <547CB26E.6060500@users.sourceforge.net>
In-Reply-To: <547CB26E.6060500@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joshua Morris <josh.h.morris@us.ibm.com>, Philip Kelleher <pjk1939@linux.vnet.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 1 Dec 2014 19:19:25 +0100
> 
> The vfree() function performs also input parameter validation.
> Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/block/rsxx/dma.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/block/rsxx/dma.c b/drivers/block/rsxx/dma.c
> index cf8cd29..0181387 100644
> --- a/drivers/block/rsxx/dma.c
> +++ b/drivers/block/rsxx/dma.c
> @@ -960,8 +960,7 @@ failed_dma_setup:
>  			ctrl->done_wq = NULL;
>  		}
>  
> -		if (ctrl->trackers)
> -			vfree(ctrl->trackers);
> +		vfree(ctrl->trackers);
>  
>  		if (ctrl->status.buf)
>  			pci_free_consistent(card->dev, STATUS_BUFFER_SIZE8,
> 

Would you like to integrate this update suggestion
into another source code repository?

Regards,
Markus
