From: Jack Stone <jwjstone@fastmail.fm>
Date: Thu, 09 Apr 2009 10:36:27 +0000
Subject: Re: [PATCH 53/56] usb: Remove void casts
Message-Id: <49DDCFAB.2030508@fastmail.fm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-46-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-47-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-48-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-49-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-50-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-51-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-52-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-53-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-54-git-send-email-jwjstone@fastmail.fm> <36ca99e90904080511r5f02717h6fbf7bc63b7ffcf9@mail.gmail.com> <49DCADF1.6030003@fastmail.fm>
In-Reply-To: <49DCADF1.6030003@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bert Wesarg <bert.wesarg@googlemail.com>
Cc: linux-kernel@vger.kernel.org, jeff@garzik.org, kernel-janitors@vger.kernel.org, gregkh@suse.de

[Added maintainer CC]
Jack Stone wrote:
> Fixed patch
>
> Thanks,
>
> Jack
>
> --
>
> usb: Remove void casts
>
> From: Jack Stone <jwjstone@fastmail.fm>
>
> Remove uneeded void casts
>
> Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
> ---
>
>  drivers/usb/host/ehci-dbg.c |    2 +-
>  drivers/usb/host/ehci-mem.c |    3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/usb/host/ehci-dbg.c b/drivers/usb/host/ehci-dbg.c
> index 7f4ace7..abfc31f 100644
> --- a/drivers/usb/host/ehci-dbg.c
> +++ b/drivers/usb/host/ehci-dbg.c
> @@ -832,7 +832,7 @@ static int fill_buffer(struct debug_buffer *buf)
>      int ret = 0;
>  
>      if (!buf->output_buf)
> -        buf->output_buf = (char *)vmalloc(buf->alloc_size);
> +        buf->output_buf = vmalloc(buf->alloc_size);
>  
>      if (!buf->output_buf) {
>          ret = -ENOMEM;
> diff --git a/drivers/usb/host/ehci-mem.c b/drivers/usb/host/ehci-mem.c
> index 10d5291..df5334f 100644
> --- a/drivers/usb/host/ehci-mem.c
> +++ b/drivers/usb/host/ehci-mem.c
> @@ -83,8 +83,7 @@ static struct ehci_qh *ehci_qh_alloc (struct ehci_hcd
> *ehci, gfp_t flags)
>      struct ehci_qh        *qh;
>      dma_addr_t        dma;
>  
> -    qh = (struct ehci_qh *)
> -        dma_pool_alloc (ehci->qh_pool, flags, &dma);
> +    qh = dma_pool_alloc (ehci->qh_pool, flags, &dma);
>      if (!qh)
>          return qh;
>  
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>   

