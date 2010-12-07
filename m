From: Dan Carpenter <error27@gmail.com>
Date: Tue, 07 Dec 2010 11:01:38 +0000
Subject: [patch] econet: unlock on -EPERM path
Message-Id: <20101207110138.GM10623@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: Phil Blundell <philb@gnu.org>, Eric Dumazet <eric.dumazet@gmail.com>, "David S. Miller" <davem@davemloft.net>, kernel-janitors@vger.kernel.org

We need to do a mutex_unlock() and a put_dev() before returning.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/econet/af_econet.c b/net/econet/af_econet.c
index 13992e1..f180371 100644
--- a/net/econet/af_econet.c
+++ b/net/econet/af_econet.c
@@ -661,8 +661,10 @@ static int ec_dev_ioctl(struct socket *sock, unsigned int cmd, void __user *arg)
 	err = 0;
 	switch (cmd) {
 	case SIOCSIFADDR:
-		if (!capable(CAP_NET_ADMIN))
-			return -EPERM;
+		if (!capable(CAP_NET_ADMIN)) {
+			err = -EPERM;
+			break;
+		}
 
 		edev = dev->ec_ptr;
 		if (edev = NULL) {
