From: Bert Wesarg <bert.wesarg@googlemail.com>
Date: Wed, 08 Apr 2009 12:09:06 +0000
Subject: Re: [PATCH 50/56] drivers/staging: Remove void casts
Message-Id: <36ca99e90904080509q5c8a62e8t7a41302a0b2ac383@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-43-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-44-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-45-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-46-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-47-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-48-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-49-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-50-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-51-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-51-git-send-email-jwjstone@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jack Stone <jwjstone@fastmail.fm>
Cc: linux-kernel@vger.kernel.org, jeff@garzik.org, kernel-janitors@vger.kernel.org

On Wed, Apr 8, 2009 at 13:22, Jack Stone <jwjstone@fastmail.fm> wrote:
> Remove uneeded void casts
>
> Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
> ---
>  drivers/staging/altpciechdma/altpciechdma.c |    4 ++--
>  drivers/staging/epl/EplApiLinuxKernel.c     |    8 ++------
>  drivers/staging/et131x/et1310_rx.c          |    2 +-
>  drivers/staging/rtl8187se/r8180_core.c      |   10 +++++-----
>  drivers/staging/slicoss/slicoss.c           |    3 +--
>  5 files changed, 11 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/staging/et131x/et1310_rx.c b/drivers/staging/et131x/et1310_rx.c
> index 8dc559a..4b1ace6 100644
> --- a/drivers/staging/et131x/et1310_rx.c
> +++ b/drivers/staging/et131x/et1310_rx.c
> @@ -610,7 +610,7 @@ int et131x_init_recv(struct et131x_adapter *adapter)
>
>        /* Setup each RFD */
>        for (RfdCount = 0; RfdCount < rx_ring->NumRfd; RfdCount++) {
> -               pMpRfd = (MP_RFD *) kmem_cache_alloc(rx_ring->RecvLookaside,
> +               pMpRfd = kmem_cache_alloc(rx_ring->RecvLookaside,
>                                                     GFP_ATOMIC | GFP_DMA);
Probably realign this the the opening parentheses, like before.

>
>                if (!pMpRfd) {
> diff --git a/drivers/staging/rtl8187se/r8180_core.c b/drivers/staging/rtl8187se/r8180_core.c
> index 6ecd12d..6223371 100644
> --- a/drivers/staging/rtl8187se/r8180_core.c
> +++ b/drivers/staging/rtl8187se/r8180_core.c
> @@ -1727,7 +1727,7 @@ short alloc_tx_desc_ring(struct net_device *dev, int bufsize, int count,
>                DMESGE ("TX buffer allocation too large");
>                return 0;
>        }
> -       desc = (u32*)pci_alloc_consistent(pdev,
> +       desc = pci_alloc_consistent(pdev,
>                                          sizeof(u32)*8*count+256, &dma_desc);
Please check.

>        if(desc=NULL) return -1;
>        if(dma_desc & 0xff){
> @@ -1975,7 +1975,7 @@ short alloc_rx_desc_ring(struct net_device *dev, u16 bufsize, int count)
>                return -1;
>        }
>
> -       desc = (u32*)pci_alloc_consistent(pdev,sizeof(u32)*rx_desc_size*count+256,
> +       desc = pci_alloc_consistent(pdev,sizeof(u32)*rx_desc_size*count+256,
>                                          &dma_desc);
Probably realign argument.

>
>        if(dma_desc & 0xff){

Bert
