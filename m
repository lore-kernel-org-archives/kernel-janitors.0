From: Jiri Kosina <jkosina@suse.cz>
Date: Wed, 29 May 2013 13:37:35 +0000
Subject: Re: [patch] pktcdvd: silence static checker warning
Message-Id: <alpine.LNX.2.00.1305291537120.30576@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130516081108.GC7494@elgon.mountain>
In-Reply-To: <20130516081108.GC7494@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 16 May 2013, Dan Carpenter wrote:

> Static checkers complain about widening the binary "not" operations here
> because sectors are u64 and "(pd)->settings.size" is unsigned int.
> It unintentionally clears the high 32 bits of the sector.  This means
> that the driver won't work for devices with over 2TB of space.  Since
> this is a DVD drive, we're unlikely to reach that limit, but we may as
> well silence the warning.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/block/pktcdvd.c b/drivers/block/pktcdvd.c
> index 898fa74..09142c4 100644
> --- a/drivers/block/pktcdvd.c
> +++ b/drivers/block/pktcdvd.c
> @@ -83,7 +83,8 @@
>  
>  #define MAX_SPEED 0xffff
>  
> -#define ZONE(sector, pd) (((sector) + (pd)->offset) & ~((pd)->settings.size - 1))
> +#define ZONE(sector, pd) (((sector) + (pd)->offset) & \
> +			~(sector_t)((pd)->settings.size - 1))
>  
>  static DEFINE_MUTEX(pktcdvd_mutex);
>  static struct pktcdvd_device *pkt_devs[MAX_WRITERS];

Makes sense. Applied, thanks Dan.

-- 
Jiri Kosina
SUSE Labs
