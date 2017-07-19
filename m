From: Colin King <colin.king@canonical.com>
Date: Wed, 19 Jul 2017 17:46:59 +0000
Subject: [PATCH] net: tehuti: don't process data if it has not been copied from userspace
Message-Id: <20170719174659.22646-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Gospodarek <andy@greyhouse.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The array data is only populated with valid information from userspace
if cmd != SIOCDEVPRIVATE, other cases the array contains garbage on
the stack. The subsequent switch statement acts on a subcommand in
data[0] which could be any garbage value if cmd is SIOCDEVPRIVATE which
seems incorrect to me.  Instead, just return EOPNOTSUPP for the case
where cmd = SIOCDEVPRIVATE to avoid this issue.

As a side note, I suspect that the original intention of the code
was for this ioctl to work just for cmd = SIOCDEVPRIVATE (and the
current logic is reversed). However, I don't wont to change the current
semantics in case any userspace code relies on this existing behaviour.

Detected by CoverityScan, CID#139647 ("Uninitialized scalar variable")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/tehuti/tehuti.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/tehuti/tehuti.c b/drivers/net/ethernet/tehuti/tehuti.c
index 711fbbbc4b1f..163d8d16bc24 100644
--- a/drivers/net/ethernet/tehuti/tehuti.c
+++ b/drivers/net/ethernet/tehuti/tehuti.c
@@ -654,6 +654,8 @@ static int bdx_ioctl_priv(struct net_device *ndev, struct ifreq *ifr, int cmd)
 			RET(-EFAULT);
 		}
 		DBG("%d 0x%x 0x%x\n", data[0], data[1], data[2]);
+	} else {
+		return -EOPNOTSUPP;
 	}
 
 	if (!capable(CAP_SYS_RAWIO))
-- 
2.11.0

