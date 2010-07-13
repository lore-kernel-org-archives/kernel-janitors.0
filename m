From: Kulikov Vasiliy <segooon@gmail.com>
Date: Tue, 13 Jul 2010 19:49:23 +0000
Subject: [PATCH v2] eth16i: fix memory leak
Message-Id: <1279050563-15759-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100713114347.GK5658@bicker>
In-Reply-To: <20100713114347.GK5658@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Mika Kuoppala <miku@iki.fi>, "David S. Miller" <davem@davemloft.net>, Stephen Hemminger <shemminger@vyatta.com>, Eric Dumazet <eric.dumazet@gmail.com>, Tejun Heo <tj@kernel.org>, Jiri Pirko <jpirko@redhat.com>, netdev@vger.kernel.org

Free allocated netdev if no probe is expected.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/net/eth16i.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/net/eth16i.c b/drivers/net/eth16i.c
index 874973f..10e39f2 100644
--- a/drivers/net/eth16i.c
+++ b/drivers/net/eth16i.c
@@ -1442,8 +1442,10 @@ int __init init_module(void)
 		dev->if_port = eth16i_parse_mediatype(mediatype[this_dev]);
 
 		if(io[this_dev] = 0) {
-			if(this_dev != 0) /* Only autoprobe 1st one */
+			if (this_dev != 0) { /* Only autoprobe 1st one */
+				free_netdev(dev);
 				break;
+			}
 
 			printk(KERN_NOTICE "eth16i.c: Presently autoprobing (not recommended) for a single card.\n");
 		}
-- 
1.7.0.4

