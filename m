From: Jiri Slaby <jslaby@suse.cz>
Date: Sun, 17 Oct 2010 15:34:20 +0000
Subject: Re: [PATCH 6/8] char: synclink: fix information leak to userland
Message-Id: <4CBB177C.9050007@suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1287326493-8134-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1287326493-8134-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Alan Cox <alan@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org

On 10/17/2010 04:41 PM, Vasiliy Kulikov wrote:
> Structure new_line is copied to userland with some padding fields unitialized.
> It leads to leaking of stack memory.

I think your tool has a bug. I must admit I fail to see the padding
which would cause leaks. Could you elaborate?

> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
> ---
>  Compile tested.
> 
>  drivers/char/synclink.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/char/synclink.c b/drivers/char/synclink.c
> index 3a6824f..abd0867 100644
> --- a/drivers/char/synclink.c
> +++ b/drivers/char/synclink.c
> @@ -7846,6 +7846,8 @@ static int hdlcdev_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
>  	if (cmd != SIOCWANDEV)
>  		return hdlc_ioctl(dev, ifr, cmd);
>  
> +	memset(&new_line, 0, size);
> +
>  	switch(ifr->ifr_settings.type) {
>  	case IF_GET_IFACE: /* return current sync_serial_settings */
>  


-- 
js
suse labs
