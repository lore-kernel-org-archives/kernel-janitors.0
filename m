From: Dan Carpenter <error27@gmail.com>
Date: Sat, 10 Jul 2010 14:31:11 +0000
Subject: [patch] isdn: fix strlen() usage
Message-Id: <20100710143111.GA19184@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karsten Keil <isdn@linux-pingi.de>
Cc: Stephen Hemminger <shemminger@vyatta.com>, "David S. Miller" <davem@davemloft.net>, Dirk Hohndel <hohndel@infradead.org>, Jiri Kosina <jkosina@suse.cz>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

There was a missing "else" statement so the original code overflowed if
->master->name was too long.  Also the ->slave and ->master buffers can
hold names with 9 characters and a NULL so I cleaned it up to allow
another character.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/isdn/i4l/isdn_net.c b/drivers/isdn/i4l/isdn_net.c
index 8c85d1e..26d44c3 100644
--- a/drivers/isdn/i4l/isdn_net.c
+++ b/drivers/isdn/i4l/isdn_net.c
@@ -2924,16 +2924,17 @@ isdn_net_getcfg(isdn_net_ioctl_cfg * cfg)
 		cfg->dialtimeout = lp->dialtimeout >= 0 ? lp->dialtimeout / HZ : -1;
 		cfg->dialwait = lp->dialwait / HZ;
 		if (lp->slave) {
-			if (strlen(lp->slave->name) > 8)
+			if (strlen(lp->slave->name) >= 10)
 				strcpy(cfg->slave, "too-long");
 			else
 				strcpy(cfg->slave, lp->slave->name);
 		} else
 			cfg->slave[0] = '\0';
 		if (lp->master) {
-			if (strlen(lp->master->name) > 8)
+			if (strlen(lp->master->name) >= 10)
 				strcpy(cfg->master, "too-long");
-			strcpy(cfg->master, lp->master->name);
+			else
+				strcpy(cfg->master, lp->master->name);
 		} else
 			cfg->master[0] = '\0';
 		return 0;
