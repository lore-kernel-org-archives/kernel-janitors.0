From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 Mar 2018 08:09:01 +0000
Subject: [PATCH] macsec: missing dev_put() on error in macsec_newlink()
Message-Id: <20180321080900.GA9826@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Sabrina Dubroca <sd@queasysnail.net>
Cc: David Ahern <dsahern@gmail.com>, David Windsor <dwindsor@gmail.com>, Elena Reshetova <elena.reshetova@intel.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Matthias Schiffer <mschiffer@universe-factory.net>, Johannes Berg <johannes.berg@intel.com>, Felix Walter <felix.walter@cloudandheat.com>, Girish Moodalbail <girish.moodalbail@oracle.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We moved the dev_hold(real_dev); call earlier in the function but forgot
to update the error paths.

Fixes: 0759e552bce7 ("macsec: fix negative refcnt on parent link")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/macsec.c b/drivers/net/macsec.c
index 7de88b33d5b9..9cbb0c8a896a 100644
--- a/drivers/net/macsec.c
+++ b/drivers/net/macsec.c
@@ -3277,7 +3277,7 @@ static int macsec_newlink(struct net *net, struct net_device *dev,
 
 	err = netdev_upper_dev_link(real_dev, dev, extack);
 	if (err < 0)
-		goto unregister;
+		goto put_dev;
 
 	/* need to be already registered so that ->init has run and
 	 * the MAC addr is set
@@ -3316,7 +3316,8 @@ static int macsec_newlink(struct net *net, struct net_device *dev,
 	macsec_del_dev(macsec);
 unlink:
 	netdev_upper_dev_unlink(real_dev, dev);
-unregister:
+put_dev:
+	dev_put(real_dev);
 	unregister_netdevice(dev);
 	return err;
 }
