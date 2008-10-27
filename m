From: "Manish Katiyar" <mkatiyar@gmail.com>
Date: Mon, 27 Oct 2008 12:48:50 +0000
Subject: [PATCH] : Fix unused variable compilation warnings in drivers/net/wan/syncppp.c
Message-Id: <ea11fea30810270548y11453b8i10eb53caff1838e8@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, linux-netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Cc: mkatiyar@gmail.com

Below patch fixes the unused compilation warnings in
drivers/net/wan/syncppp.c when CONFIG_INET is not defined.

Signed-off-by: Manish Katiyar <mkatiyar@gmail.com>
---
 drivers/net/wan/syncppp.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wan/syncppp.c b/drivers/net/wan/syncppp.c
index 327d585..11124f3 100644
--- a/drivers/net/wan/syncppp.c
+++ b/drivers/net/wan/syncppp.c
@@ -756,10 +756,10 @@ static void sppp_cisco_input (struct sppp *sp,
struct sk_buff *skb)
 	case CISCO_ADDR_REQ:
 		/* Stolen from net/ipv4/devinet.c -- SIOCGIFADDR ioctl */
 		{
-		struct in_device *in_dev;
-		struct in_ifaddr *ifa;
 		__be32 addr = 0, mask = htonl(~0U); /* FIXME: is the mask correct? */
 #ifdef CONFIG_INET
+		struct in_device *in_dev;
+		struct in_ifaddr *ifa;
 		rcu_read_lock();
 		if ((in_dev = __in_dev_get_rcu(dev)) != NULL)
 		{
-- 
1.5.4.3


Thanks -
Manish
