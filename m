From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 29 Jul 2013 19:15:19 +0000
Subject: [patch] net: remove an unneeded check
Message-Id: <20130729191519.GA11874@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Patrick McHardy <kaber@trash.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

"ifa->ifa_label" is an array inside the in_ifaddr struct.  It can never
be NULL so we can remove this check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/ipv4/devinet.c b/net/ipv4/devinet.c
index 8d48c39..1b7f7ae 100644
--- a/net/ipv4/devinet.c
+++ b/net/ipv4/devinet.c
@@ -1124,10 +1124,7 @@ static int inet_gifconf(struct net_device *dev, char __user *buf, int len)
 		if (len < (int) sizeof(ifr))
 			break;
 		memset(&ifr, 0, sizeof(struct ifreq));
-		if (ifa->ifa_label)
-			strcpy(ifr.ifr_name, ifa->ifa_label);
-		else
-			strcpy(ifr.ifr_name, dev->name);
+		strcpy(ifr.ifr_name, ifa->ifa_label);
 
 		(*(struct sockaddr_in *)&ifr.ifr_addr).sin_family = AF_INET;
 		(*(struct sockaddr_in *)&ifr.ifr_addr).sin_addr.s_addr 