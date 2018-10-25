From: Shuah Khan <shuah@kernel.org>
Date: Thu, 25 Oct 2018 18:49:29 +0000
Subject: Re: [PATCH] usbip: tools: fix atoi() on non-null terminated string
Message-Id: <82ed890f-f544-ce88-9509-f4eedafe4a91@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181016180343.5620-1-colin.king@canonical.com>
In-Reply-To: <20181016180343.5620-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Valentina Manea <valentina.manea.m@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,

On 10/16/2018 12:03 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the call to atoi is being passed a single char string
> that is not null terminated, so there is a potential read overrun
> along the stack when parsing for an integer value.  Fix this by
> instead using a 2 char string that is initialized to all zeros
> to ensure that a 1 char read into the string is always terminated
> with a \0.
> 
> Detected by cppcheck:
> "Invalid atoi() argument nr 1. A nul-terminated string is required."
> 
> Fixes: 3391ba0e2792 ("usbip: tools: Extract generic code to be shared with vudc backend")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  tools/usb/usbip/libsrc/usbip_host_common.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/usb/usbip/libsrc/usbip_host_common.c b/tools/usb/usbip/libsrc/usbip_host_common.c
> index dc93fadbee96..d79c7581b175 100644
> --- a/tools/usb/usbip/libsrc/usbip_host_common.c
> +++ b/tools/usb/usbip/libsrc/usbip_host_common.c
> @@ -43,7 +43,7 @@ static int32_t read_attr_usbip_status(struct usbip_usb_device *udev)
>  	int size;
>  	int fd;
>  	int length;
> -	char status;
> +	char status[2] = { 0 }>  	int value = 0;
>  
>  	size = snprintf(status_attr_path, sizeof(status_attr_path),
> @@ -61,14 +61,14 @@ static int32_t read_attr_usbip_status(struct usbip_usb_device *udev)
>  		return -1;
>  	}
>  
> -	length = read(fd, &status, 1);
> +	length = read(fd, status, 1);
>  	if (length < 0) {
>  		err("error reading attribute %s", status_attr_path);
>  		close(fd);
>  		return -1;
>  	}
>  
> -	value = atoi(&status);
> +	value = atoi(status);
>  
>  	return value;
>  }
> 

Thanks for the patch. Looks good to me.

Acked-by: Shuah Khan <shuah@kernel.org>

thanks,
-- Shuah
