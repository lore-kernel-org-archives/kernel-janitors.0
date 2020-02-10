From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 10 Feb 2020 08:32:43 +0000
Subject: Re: [PATCH] usb: dwc3: debug: remove redundant call to strlen
Message-Id: <20200210083243.GW1778@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200208162508.29336-1-colin.king@canonical.com>
In-Reply-To: <20200208162508.29336-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Feb 08, 2020 at 04:25:08PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The call to strlen is redundant since the return value is assigned
> to variable len but not subsequently used. Remove the redundant
> call.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/usb/dwc3/debug.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/debug.h b/drivers/usb/dwc3/debug.h
> index e56beb9d1e36..ee964352c8e2 100644
> --- a/drivers/usb/dwc3/debug.h
> +++ b/drivers/usb/dwc3/debug.h
> @@ -296,8 +296,6 @@ static inline const char *dwc3_ep_event_string(char *str, size_t size,
>  				status & DEPEVT_STATUS_TRANSFER_ACTIVE ?
>  				" (Active)" : " (Not Active)");
>  
> -		len = strlen(str);

This code is buggy.  It's a mixup between ret and len.  Get rid of "ret"
and use "len" throughout.

Unlike userspace snprintf() the kernel version always returns a positive
value.  It returns the number of bytes that would have been copied if
there were enough space.  This code should probably be changed to use
scnprintf() which returns the number of bytes which were copied
successfully.

The remove all the strlen() calls.  It should just be += the return.

	len += scnprintf(str + len, size - len, "Transfer Not Ready [%d] %s",
			 event->parameters,
			 status & DEPEVT_STATUS_TRANSFER_ACTIVE ?
				"(Active)" : "(Not Active)");

regards,
dan carpenter
