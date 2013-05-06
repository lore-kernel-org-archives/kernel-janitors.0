From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 06 May 2013 12:15:13 +0000
Subject: [patch -next] netpoll: inverted down_trylock() test
Message-Id: <20130506121513.GA13930@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Neil Horman <nhorman@tuxdriver.com>
Cc: Cong Wang <amwang@redhat.com>, Eric Dumazet <edumazet@google.com>, Jiri Pirko <jiri@resnulli.us>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The return value is reversed from mutex_trylock().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/core/netpoll.c b/net/core/netpoll.c
index a5802a8..cec074b 100644
--- a/net/core/netpoll.c
+++ b/net/core/netpoll.c
@@ -206,7 +206,7 @@ static void netpoll_poll_dev(struct net_device *dev)
 	 * the dev_open/close paths use this to block netpoll activity
 	 * while changing device state
 	 */
-	if (!down_trylock(&ni->dev_lock))
+	if (down_trylock(&ni->dev_lock))
 		return;
 
 	if (!netif_running(dev)) {
