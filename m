From: Mao Wenan <maowenan@huawei.com>
Date: Mon, 05 Aug 2019 11:57:44 +0000
Subject: [PATCH net-next v3] net: can: Fix compiling warnings for two functions
Message-Id: <20190805115744.112440-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6fd68e9b-a8ae-4e5e-9b23-c099b5ca9aa4@web.de>
In-Reply-To: <6fd68e9b-a8ae-4e5e-9b23-c099b5ca9aa4@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, socketcan@hartkopp.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, maowenan@huawei.com

There are two warnings in net/can, fix them by setting bcm_sock_no_ioctlcmd
and raw_sock_no_ioctlcmd as static.

net/can/bcm.c:1683:5: warning: symbol 'bcm_sock_no_ioctlcmd' was not declared. Should it be static?
net/can/raw.c:840:5: warning: symbol 'raw_sock_no_ioctlcmd' was not declared. Should it be static?

Fixes: 473d924d7d46 ("can: fix ioctl function removal")

Signed-off-by: Mao Wenan <maowenan@huawei.com>
Acked-by: Oliver Hartkopp <socketcan@hartkopp.net>
---
 v1->v2: change patch description typo error, 'warings' to 'warnings'.
 v2->v3: change subject of patch.
 net/can/bcm.c | 2 +-
 net/can/raw.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/can/bcm.c b/net/can/bcm.c
index bf1d0bbecec8..b8a32b4ac368 100644
--- a/net/can/bcm.c
+++ b/net/can/bcm.c
@@ -1680,7 +1680,7 @@ static int bcm_recvmsg(struct socket *sock, struct msghdr *msg, size_t size,
 	return size;
 }
 
-int bcm_sock_no_ioctlcmd(struct socket *sock, unsigned int cmd,
+static int bcm_sock_no_ioctlcmd(struct socket *sock, unsigned int cmd,
 			 unsigned long arg)
 {
 	/* no ioctls for socket layer -> hand it down to NIC layer */
diff --git a/net/can/raw.c b/net/can/raw.c
index da386f1fa815..a01848ff9b12 100644
--- a/net/can/raw.c
+++ b/net/can/raw.c
@@ -837,7 +837,7 @@ static int raw_recvmsg(struct socket *sock, struct msghdr *msg, size_t size,
 	return size;
 }
 
-int raw_sock_no_ioctlcmd(struct socket *sock, unsigned int cmd,
+static int raw_sock_no_ioctlcmd(struct socket *sock, unsigned int cmd,
 			 unsigned long arg)
 {
 	/* no ioctls for socket layer -> hand it down to NIC layer */
-- 
2.20.1
