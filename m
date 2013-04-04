From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Apr 2013 06:29:42 +0000
Subject: [patch] staging: slicoss: information leak in ETHTOOL_GSET
Message-Id: <20130404062942.GA6494@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There are some fields in "edata" which have not been cleared.  One
example is edata.cmd.  It leaks uninitialized stack information to the
user.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/slicoss/slicoss.c b/drivers/staging/slicoss/slicoss.c
index c8375a2..e4b8277 100644
--- a/drivers/staging/slicoss/slicoss.c
+++ b/drivers/staging/slicoss/slicoss.c
@@ -3149,6 +3149,7 @@ static int slic_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
 			return -EFAULT;
 
 		if (ecmd.cmd = ETHTOOL_GSET) {
+			memset(&edata, 0, sizeof(edata));
 			edata.supported = (SUPPORTED_10baseT_Half |
 					   SUPPORTED_10baseT_Full |
 					   SUPPORTED_100baseT_Half |
