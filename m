From: Alan Stern <stern@rowland.harvard.edu>
Date: Tue, 07 Nov 2017 15:42:51 +0000
Subject: Re: [PATCH] USB: remove redundant assignment to temp
Message-Id: <Pine.LNX.4.44L0.1711071039210.1395-100000@iolanthe.rowland.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20171107102759.10456-1-colin.king@canonical.com>
References: <20171107102759.10456-1-colin.king@canonical.com>
In-Reply-To: <20171107102759.10456-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 7 Nov 2017, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable temp is being set at the end of each loop iteration
> but this value is never read, it is either being updated in just
> the case 1 block or at the end of the loop.  Thus the assignment
> is redundant and can be removed.  Cleans up clang warning:
> 
> drivers/usb/host/ehci-dbg.c:840:4: warning: Value stored to 'temp'
> is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/usb/host/ehci-dbg.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ehci-dbg.c b/drivers/usb/host/ehci-dbg.c
> index 7fb21d01b3d0..70d4768958be 100644
> --- a/drivers/usb/host/ehci-dbg.c
> +++ b/drivers/usb/host/ehci-dbg.c
> @@ -838,7 +838,6 @@ static ssize_t fill_registers_buffer(struct debug_buffer *buf)
>  			default:		/* unknown */
>  				break;
>  			}
> -			temp = (cap >> 8) & 0xff;
>  		}
>  	}
>  #endif

Good catch, but the solution is wrong.  The original code was mistaken;
it should have said:

			offset = (cap >> 8) & 0xff;

You can see that something like this is necessary if you consider the 
code path for the case where (cap & 0xff) != 1 -- the loop would just 
read the same capability value over and over again.

Would you like to submit a revised patch?

Alan Stern

