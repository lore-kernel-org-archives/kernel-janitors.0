From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 10 Feb 2021 19:15:04 +0000
Subject: NAK: [PATCH][next] media: uvcvideo: remove duplicated dma_dev assignment
Message-Id: <1d50eb5e-bed3-50dd-6eaf-b055e188dcf8@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210210174555.144128-1-colin.king@canonical.com>
In-Reply-To: <20210210174555.144128-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>, Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/02/2021 17:45, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The assignment to dma_dev has been performed twice in one
> statement. Fix this by removing the extraneous assignment.
> 
> Addresses-Coverity: ("Evaluation order violation")
> Fixes: fdcd02a641e2 ("media: uvcvideo: Use dma_alloc_noncontiguos API")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index dc81f9a86eca..edf451a956d8 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1105,7 +1105,7 @@ static inline struct device *stream_to_dmadev(struct uvc_streaming *stream)
>  
>  static void uvc_urb_dma_sync(struct uvc_urb *uvc_urb, bool for_device)
>  {
> -	struct device *dma_dev = dma_dev = stream_to_dmadev(uvc_urb->stream);
> +	struct device *dma_dev = stream_to_dmadev(uvc_urb->stream);
>  
>  	if (for_device) {
>  		dma_sync_sgtable_for_device(dma_dev, uvc_urb->sgt,
> 

there are some other occurrences of this, I'll send a V2.
