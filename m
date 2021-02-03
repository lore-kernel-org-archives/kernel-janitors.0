From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Feb 2021 13:06:50 +0000
Subject: Re: [PATCH][next] usb: cdnsp: Fix spelling mistake "delagete" -> "delegate"
Message-Id: <20210203130440.GV2696@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210203111239.18313-1-colin.king@canonical.com>
In-Reply-To: <20210203111239.18313-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Pawel Laszczak <pawell@cadence.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Feb 03, 2021 at 11:12:39AM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a literal string. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/usb/cdns3/cdnsp-ep0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/cdns3/cdnsp-ep0.c b/drivers/usb/cdns3/cdnsp-ep0.c
> index e2b1bcb3f80e..e30931ebc870 100644
> --- a/drivers/usb/cdns3/cdnsp-ep0.c
> +++ b/drivers/usb/cdns3/cdnsp-ep0.c
> @@ -45,7 +45,7 @@ static int cdnsp_ep0_delegate_req(struct cdnsp_device *pdev,
>  {
>  	int ret;
>  
> -	trace_cdnsp_ep0_request("delagete");
> +	trace_cdnsp_ep0_request("delegate");
>  

This printk is useless and should just be deleted.  Use ftrace instead.

regards,
dan carpenter
