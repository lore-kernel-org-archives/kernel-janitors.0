From: Greg KH <greg@kroah.com>
Date: Tue, 02 Jun 2009 19:14:11 +0000
Subject: Re: rspiusb driver in staging area removal of dbg local macro
Message-Id: <20090602191411.GA31992@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, May 30, 2009 at 12:12:21AM +0000, firstlink@comcast.net wrote:
> >From 57d81a0181a69d9a7ebd4bd5ae2c017eed51070b Mon Sep 17 00:00:00 2001 
> From: Jean-Pierre Sainfeld <firstlink@comcast.net> 
> Date: Thu, 21 May 2009 10:58:15 -0700 
> Subject: [PATCH] This patch addressed the TODO list item : " remove dbg() macro" 
> The dbg invocations have been replaced by dev_dbg call whenever possible. 
> This means wherever the pdx points to a valid device_extension structure. 
> 
> --- 
> drivers/staging/rspiusb/rspiusb.c | 197 +++++++++++++++++++++++-------------- 
> 1 files changed, 122 insertions(+), 75 deletions(-) 
> 
> diff --git a/drivers/staging/rspiusb/rspiusb.c b/drivers/staging/rspiusb/rspiusb.c 
> index 090bf41..7adf2cf 100644 
> --- a/drivers/staging/rspiusb/rspiusb.c 
> +++ b/drivers/staging/rspiusb/rspiusb.c 
> @@ -37,13 +37,6 @@ static int debug = 1; 
> #else 
> static int debug; 
> #endif 
> -/* Use our own dbg macro */ 
> -#undef dbg 
> -#define dbg(format, arg...) \ 
> - do { \ 
> - if (debug) \ 
> - printk(KERN_DEBUG __FILE__ ": " format "\n" , ##arg); \ 
> - } while (0) 

Your patch seems to have all spaces stripped out of it and can't be
applied :(

Also, there have been some changes in this driver recently, can you
respin this against the linux-next tree that comes out tomorrow?

thanks,

greg k-h
