From: Jiri Pirko <jpirko@redhat.com>
Date: Sat, 09 May 2009 17:12:53 +0000
Subject: Re: [PATCH] Remove duplicate slow protocol define in bond_3ad.h
Message-Id: <20090509171250.GA3390@psychotron.englab.brq.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1241888356-7575-1-git-send-email-richard.genoud@gmail.com>
In-Reply-To: <1241888356-7575-1-git-send-email-richard.genoud@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Genoud <richard.genoud@gmail.com>
Cc: Jay Vosburgh <fubar@us.ibm.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org

Sat, May 09, 2009 at 06:59:16PM CEST, richard.genoud@gmail.com wrote:
>ETH_P_SLOW is already defined in include/linux/if_ether.h.
>There's no need to define BOND_ETH_P_LACPDU in drivers/net/bonding/bond_3ad.h
>
>Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
>---
> drivers/net/bonding/bond_3ad.h |    4 ++--
> 1 files changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/net/bonding/bond_3ad.h b/drivers/net/bonding/bond_3ad.h
>index a306230..2c46a15 100644
>--- a/drivers/net/bonding/bond_3ad.h
>+++ b/drivers/net/bonding/bond_3ad.h
>@@ -26,10 +26,10 @@
> #include <asm/byteorder.h>
> #include <linux/skbuff.h>
> #include <linux/netdevice.h>
>+#include <linux/if_ether.h>
> 
> // General definitions
>-#define BOND_ETH_P_LACPDU       0x8809
>-#define PKT_TYPE_LACPDU         cpu_to_be16(BOND_ETH_P_LACPDU)
>+#define PKT_TYPE_LACPDU         cpu_to_be16(ETH_P_SLOW)
> #define AD_TIMER_INTERVAL       100 /*msec*/
> 
> #define MULTICAST_LACPDU_ADDR    {0x01, 0x80, 0xC2, 0x00, 0x00, 0x02}
>-- 
>1.6.0.4

Looks good.

Signed-off-by: Jiri Pirko <jpirko@redhat.com>

>
>--
>To unsubscribe from this list: send the line "unsubscribe netdev" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
