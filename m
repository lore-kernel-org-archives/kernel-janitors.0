From: Jiri Kosina <jikos@kernel.org>
Date: Tue, 16 Jun 2020 15:17:10 +0000
Subject: Re: [PATCH] HID: usbhid: remove redundant assignment to variable retval
Message-Id: <nycvar.YFH.7.76.2006161717030.13242@cbobk.fhfr.pm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200610123101.1133117-1-colin.king@canonical.com>
In-Reply-To: <20200610123101.1133117-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-usb@vger.kernel.org, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 10 Jun 2020, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable retval is being initialized with a value that is
> never read and it is being updated later with a new value. The
> initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/hid/usbhid/hid-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
> index 17a638f15082..17a29ee0ac6c 100644
> --- a/drivers/hid/usbhid/hid-core.c
> +++ b/drivers/hid/usbhid/hid-core.c
> @@ -1667,7 +1667,7 @@ struct usb_interface *usbhid_find_interface(int minor)
>  
>  static int __init hid_init(void)
>  {
> -	int retval = -ENOMEM;
> +	int retval;
>  
>  	retval = hid_quirks_init(quirks_param, BUS_USB, MAX_USBHID_BOOT_QUIRKS);
>  	if (retval)

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs
