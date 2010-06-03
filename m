From: Dan Carpenter <error27@gmail.com>
Date: Thu, 03 Jun 2010 10:05:35 +0000
Subject: [patch] tehuti: return -EFAULT on copy_to_user errors
Message-Id: <20100603100535.GT5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Indenbaum <baum@tehutinetworks.net>
Cc: Andy Gospodarek <andy@greyhouse.net>, "David S. Miller" <davem@davemloft.net>, Jiri Pirko <jpirko@redhat.com>, Stephen Hemminger <shemminger@vyatta.com>, Eric Dumazet <eric.dumazet@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

copy_to_user() returns the number of bytes remaining but we want to
return a negative error code here.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/tehuti.c b/drivers/net/tehuti.c
index 20ab161..737df60 100644
--- a/drivers/net/tehuti.c
+++ b/drivers/net/tehuti.c
@@ -646,7 +646,7 @@ static int bdx_ioctl_priv(struct net_device *ndev, struct ifreq *ifr, int cmd)
 		error = copy_from_user(data, ifr->ifr_data, sizeof(data));
 		if (error) {
 			pr_err("cant copy from user\n");
-			RET(error);
+			RET(-EFAULT);
 		}
 		DBG("%d 0x%x 0x%x\n", data[0], data[1], data[2]);
 	}
@@ -665,7 +665,7 @@ static int bdx_ioctl_priv(struct net_device *ndev, struct ifreq *ifr, int cmd)
 		    data[2]);
 		error = copy_to_user(ifr->ifr_data, data, sizeof(data));
 		if (error)
-			RET(error);
+			RET(-EFAULT);
 		break;
 
 	case BDX_OP_WRITE:
