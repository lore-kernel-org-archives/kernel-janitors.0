From: walter harms <wharms@bfs.de>
Date: Thu, 02 Feb 2017 13:31:45 +0000
Subject: Re: [PATCH] usb: storage: fix infinite wait loop by incrementing loop counter
Message-Id: <589334C1.7020802@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170202131910.31001-1-colin.king@canonical.com>
In-Reply-To: <20170202131910.31001-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org



Am 02.02.2017 14:19, schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> If jumpshot_get_status continues to return a failed result then the
> wait loop will spin forever because the waitcount counter is never
> being incremented and we don't ever timeout.  Fix this by incrementing
> waitcount.
> 
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/usb/storage/jumpshot.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/storage/jumpshot.c b/drivers/usb/storage/jumpshot.c
> index 011e527..81d82ce 100644
> --- a/drivers/usb/storage/jumpshot.c
> +++ b/drivers/usb/storage/jumpshot.c
> @@ -311,6 +311,7 @@ static int jumpshot_write_data(struct us_data *us,
>  			if (result != USB_STOR_TRANSPORT_GOOD) {
>  				// I have not experimented to find the smallest value.
>  				//
> +				waitcount++;
>  				msleep(50); 
>  			}
>  		} while ((result != USB_STOR_TRANSPORT_GOOD) && (waitcount < 10));


the function looks a bit complicated ..
what i about this ?

for(waitcount=0;waitcount<10;waitcount++)
{
   result = jumpshot_get_status(us);
   if ( result = USB_STOR_TRANSPORT_GOOD)
	break;

   msleep(50);

}

just my 2 cents,

re,
 wg




