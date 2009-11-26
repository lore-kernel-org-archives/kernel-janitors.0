From: Rudy Matela <rudy.matela@gmail.com>
Date: Thu, 26 Nov 2009 23:13:42 +0000
Subject: [PATCH] Coding style correction in HDLC/Frame Relay support
Message-Id: <20091126231342.GA25041@vacuum.larces.uece.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Krzysztof Halasa <khc@pm.waw.pl>
Cc: trivial@kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Coding style corrections on Frame Relay/DLCI support routines.

Added a space separating some if keywords from the following parenthesis to
conform to the CodingStyle.

Signed-off-by: Rudy Matela <rudy.matela@gmail.com>
---

diff --git a/drivers/net/wan/hdlc_fr.c b/drivers/net/wan/hdlc_fr.c
index 840cff7..a7d4fc1 100644
--- a/drivers/net/wan/hdlc_fr.c
+++ b/drivers/net/wan/hdlc_fr.c
@@ -1214,10 +1214,10 @@ static int fr_ioctl(struct net_device *dev, struct ifreq *ifr)
 		return 0;
 
 	case IF_PROTO_FR:
-		if(!capable(CAP_NET_ADMIN))
+		if (!capable(CAP_NET_ADMIN))
 			return -EPERM;
 
-		if(dev->flags & IFF_UP)
+		if (dev->flags & IFF_UP)
 			return -EBUSY;
 
 		if (copy_from_user(&new_settings, fr_s, size))
@@ -1263,7 +1263,7 @@ static int fr_ioctl(struct net_device *dev, struct ifreq *ifr)
 		if (dev_to_hdlc(dev)->proto != &proto) /* Different proto */
 			return -EINVAL;
 
-		if(!capable(CAP_NET_ADMIN))
+		if (!capable(CAP_NET_ADMIN))
 			return -EPERM;
 
 		if (copy_from_user(&pvc, ifr->ifr_settings.ifs_ifsu.fr_pvc,
