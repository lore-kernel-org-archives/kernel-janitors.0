From: Mao Wenan <maowenan@huawei.com>
Date: Tue, 06 Aug 2019 14:40:43 +0000
Subject: [PATCH net-next v5] net: can: Fix sparse warnings for two functions
Message-Id: <20190806144043.187422-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d928a635-accd-2a8f-1829-5d7da551a8e8@web.de>
In-Reply-To: <d928a635-accd-2a8f-1829-5d7da551a8e8@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: socketcan@hartkopp.net, davem@davemloft.net, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mao Wenan <maowenan@huawei.com>

There are two warnings in net/can, fix them by setting
bcm_sock_no_ioctlcmd and raw_sock_no_ioctlcmd as static.

net/can/bcm.c:1683:5: warning: symbol 'bcm_sock_no_ioctlcmd' was not declared. Should it be static?
net/can/raw.c:840:5: warning: symbol 'raw_sock_no_ioctlcmd' was not declared. Should it be static?

Fixes: 473d924d7d46 ("can: fix ioctl function removal")
Signed-off-by: Mao Wenan <maowenan@huawei.com>
Acked-by: Oliver Hartkopp <socketcan@hartkopp.net>
---
 v2: change patch description typo error, 'warings' to 'warnings'.
 v3: change subject of patch.
 v4: change the alignment of two functions. 
 v5: change subject of patch.
 net/can/bcm.c | 4 ++--
 net/can/raw.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/can/bcm.c b/net/can/bcm.c
index bf1d0bbecec8..eb1d28b8c46a 100644
--- a/net/can/bcm.c
+++ b/net/can/bcm.c
@@ -1680,8 +1680,8 @@ static int bcm_recvmsg(struct socket *sock, struct msghdr *msg, size_t size,
 	return size;
 }
 
-int bcm_sock_no_ioctlcmd(struct socket *sock, unsigned int cmd,
-			 unsigned long arg)
+static int bcm_sock_no_ioctlcmd(struct socket *sock, unsigned int cmd,
+				unsigned long arg)
 {
 	/* no ioctls for socket layer -> hand it down to NIC layer */
 	return -ENOIOCTLCMD;
diff --git a/net/can/raw.c b/net/can/raw.c
index da386f1fa815..a30aaecd9327 100644
--- a/net/can/raw.c
+++ b/net/can/raw.c
@@ -837,8 +837,8 @@ static int raw_recvmsg(struct socket *sock, struct msghdr *msg, size_t size,
 	return size;
 }
 
-int raw_sock_no_ioctlcmd(struct socket *sock, unsigned int cmd,
-			 unsigned long arg)
+static int raw_sock_no_ioctlcmd(struct socket *sock, unsigned int cmd,
+				unsigned long arg)
 {
 	/* no ioctls for socket layer -> hand it down to NIC layer */
 	return -ENOIOCTLCMD;
-- 
2.20.1
