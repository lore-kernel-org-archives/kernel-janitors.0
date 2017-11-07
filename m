From: Alan Stern <stern@rowland.harvard.edu>
Date: Tue, 07 Nov 2017 17:39:58 +0000
Subject: Re: [PATCH] usb: host: fix incorrect updating of offset
Message-Id: <Pine.LNX.4.44L0.1711071239370.1395-100000@iolanthe.rowland.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20171107164504.5920-1-colin.king@canonical.com>
References: <20171107164504.5920-1-colin.king@canonical.com>
In-Reply-To: <20171107164504.5920-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 7 Nov 2017, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable temp is incorrectly being updated, instead it should
> be offset otherwise the loop just reads the same capability value
> and loops forever.  Thanks to Alan Stern for pointing out the
> correct fix to my original fix.  Fix also cleans up clang warning:
> 
> drivers/usb/host/ehci-dbg.c:840:4: warning: Value stored to 'temp'
> is never read
> 
> Fixes: d49d43174400 ("USB: misc ehci updates")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/usb/host/ehci-dbg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ehci-dbg.c b/drivers/usb/host/ehci-dbg.c
> index 7fb21d01b3d0..3bd0b2273171 100644
> --- a/drivers/usb/host/ehci-dbg.c
> +++ b/drivers/usb/host/ehci-dbg.c
> @@ -838,7 +838,7 @@ static ssize_t fill_registers_buffer(struct debug_buffer *buf)
>  			default:		/* unknown */
>  				break;
>  			}
> -			temp = (cap >> 8) & 0xff;
> +			offset = (cap >> 8) & 0xff;
>  		}
>  	}
>  #endif

Acked-by: Alan Stern <stern@rowland.harvard.edu>

