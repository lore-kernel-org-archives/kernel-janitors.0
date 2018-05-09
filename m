From: Colin King <colin.king@canonical.com>
Date: Wed, 09 May 2018 09:48:33 +0000
Subject: [PATCH] net/9p: fix spelling mistake: "suspsend" -> "suspend"
Message-Id: <20180509094833.15871-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Van Hensbergen <ericvh@gmail.com>, Ron Minnich <rminnich@sandia.gov>, Latchesar Ionkov <lucho@ionkov.net>, "David S . Miller" <davem@davemloft.net>, v9fs-developer@lists.sourceforge.net, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dev_warn message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/9p/trans_xen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/9p/trans_xen.c b/net/9p/trans_xen.c
index 086a4abdfa7c..0f19960390a6 100644
--- a/net/9p/trans_xen.c
+++ b/net/9p/trans_xen.c
@@ -485,7 +485,7 @@ static int xen_9pfs_front_probe(struct xenbus_device *dev,
 
 static int xen_9pfs_front_resume(struct xenbus_device *dev)
 {
-	dev_warn(&dev->dev, "suspsend/resume unsupported\n");
+	dev_warn(&dev->dev, "suspend/resume unsupported\n");
 	return 0;
 }
 
-- 
2.17.0

