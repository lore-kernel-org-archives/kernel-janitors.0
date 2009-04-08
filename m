From: Bert Wesarg <bert.wesarg@googlemail.com>
Date: Wed, 08 Apr 2009 11:43:33 +0000
Subject: Re: [PATCH 22/56] message/fusion: Remove void casts
Message-Id: <36ca99e90904080443m2c50be7dp588dab68e89dadc7@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-15-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-16-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-17-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-18-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-19-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-20-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-21-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-22-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-23-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-23-git-send-email-jwjstone@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jack Stone <jwjstone@fastmail.fm>
Cc: linux-kernel@vger.kernel.org, jeff@garzik.org, kernel-janitors@vger.kernel.org

On Wed, Apr 8, 2009 at 13:21, Jack Stone <jwjstone@fastmail.fm> wrote:
> Remove uneeded void casts
>
> Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
> ---
>  drivers/message/fusion/mptbase.c |    6 +++---
>  drivers/message/fusion/mptctl.c  |    4 ++--
>  drivers/message/fusion/mptfc.c   |    4 ++--
>  3 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/message/fusion/mptctl.c b/drivers/message/fusion/mptctl.c
> index c638171..fbcd791 100644
> --- a/drivers/message/fusion/mptctl.c
> +++ b/drivers/message/fusion/mptctl.c
> @@ -2667,7 +2667,7 @@ mptctl_hp_targetinfo(unsigned long arg)
>                /* Issue the second config page request */
>                cfg.action = MPI_CONFIG_ACTION_PAGE_READ_CURRENT;
>                data_sz = (int) cfg.cfghdr.hdr->PageLength * 4;
> -               pg3_alloc = (SCSIDevicePage3_t *) pci_alloc_consistent(
> +               pg3_alloc = pci_alloc_consistent(
>                                                        ioc->pcidev, data_sz, &page_dma);
Dito. (Sorry for being lazy in typing from this point up).

>                if (pg3_alloc) {
>                        cfg.physAddr = page_dma;
> diff --git a/drivers/message/fusion/mptfc.c b/drivers/message/fusion/mptfc.c
> index c3c24fd..d22acfd 100644
> --- a/drivers/message/fusion/mptfc.c
> +++ b/drivers/message/fusion/mptfc.c
> @@ -766,7 +766,7 @@ mptfc_GetFcPortPage0(MPT_ADAPTER *ioc, int portnum)
>
>        data_sz = hdr.PageLength * 4;
>        rc = -ENOMEM;
> -       ppage0_alloc = (FCPortPage0_t *) pci_alloc_consistent(ioc->pcidev, data_sz, &page0_dma);
> +       ppage0_alloc = pci_alloc_consistent(ioc->pcidev, data_sz, &page0_dma);
>        if (ppage0_alloc) {
>
>  try_again:
> @@ -907,7 +907,7 @@ start_over:
>                if (data_sz < sizeof(FCPortPage1_t))
>                        data_sz = sizeof(FCPortPage1_t);
>
> -               page1_alloc = (FCPortPage1_t *) pci_alloc_consistent(ioc->pcidev,
> +               page1_alloc = pci_alloc_consistent(ioc->pcidev,
>                                                data_sz,
>                                                &page1_dma);
Please check.

>                if (!page1_alloc)

Bert
