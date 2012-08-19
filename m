From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 19 Aug 2012 16:56:41 +0000
Subject: Re: [staging-next V3] ozwpan: fix memcmp() test in oz_set_active_pd()
Message-Id: <alpine.DEB.2.02.1208191856160.2112@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1345394197-6561-1-git-send-email-tomas.winkler@intel.com>
In-Reply-To: <1345394197-6561-1-git-send-email-tomas.winkler@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There seems also to be an opportunity in drivers/scsi/qla2xxx/qla_init.c:

memcmp(icb->enode_mac, "\0\0\0\0\0\0", sizeof(icb->enode_mac))

julia

On Sun, 19 Aug 2012, Tomas Winkler wrote:

> "addr" is a pointer so it's either 4 or 8 bytes, but actually we want
> to compare 6 bytes (ETH_ALEN).
>
> As network stack already provides helper function
> is_zero_ether_addr() we use that instead of memcmp
>
> Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> Cc: Rupesh Gujare <rgujare@ozmodevices.com>
> ---
> V1: by Dan Carpenter <dan.carpenter@oracle.com>
> V2: replace memcmp with is_zero_ether_addr
> V3: include <linux/etherdevice.h>
>
> drivers/staging/ozwpan/ozcdev.c |    3 ++-
> 1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/staging/ozwpan/ozcdev.c b/drivers/staging/ozwpan/ozcdev.c
> index d983219..758ce0a 100644
> --- a/drivers/staging/ozwpan/ozcdev.c
> +++ b/drivers/staging/ozwpan/ozcdev.c
> @@ -8,6 +8,7 @@
> #include <linux/cdev.h>
> #include <linux/uaccess.h>
> #include <linux/netdevice.h>
> +#include <linux/etherdevice.h>
> #include <linux/poll.h>
> #include <linux/sched.h>
> #include "ozconfig.h"
> @@ -213,7 +214,7 @@ static int oz_set_active_pd(u8 *addr)
> 		if (old_pd)
> 			oz_pd_put(old_pd);
> 	} else {
> -		if (!memcmp(addr, "\0\0\0\0\0\0", sizeof(addr))) {
> +		if (is_zero_ether_addr(addr)) {
> 			spin_lock_bh(&g_cdev.lock);
> 			pd = g_cdev.active_pd;
> 			g_cdev.active_pd = 0;
> -- 
> 1.7.4.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
