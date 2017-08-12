From: Colin King <colin.king@canonical.com>
Date: Sat, 12 Aug 2017 21:52:31 +0000
Subject: [PATCH] tap: make struct tap_fops static
Message-Id: <20170812215231.6272-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Sainath Grandhi <sainath.grandhi@intel.com>, Jason Wang <jasowang@redhat.com>, Rolf Neugebauer <rolf.neugebauer@docker.com>, Willem de Bruijn <willemb@google.com>, Zhang Shengju <zhangshengju@cmss.chinamobile.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The structure tap_fops is local to the source and does not need to
be in global scope, so make it static.

Cleans up sparse warning:
symbol 'tap_fops' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/tap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/tap.c b/drivers/net/tap.c
index ca267fd28ab8..0d039411e64c 100644
--- a/drivers/net/tap.c
+++ b/drivers/net/tap.c
@@ -1127,7 +1127,7 @@ static long tap_compat_ioctl(struct file *file, unsigned int cmd,
 }
 #endif
 
-const struct file_operations tap_fops = {
+static const struct file_operations tap_fops = {
 	.owner		= THIS_MODULE,
 	.open		= tap_open,
 	.release	= tap_release,
-- 
2.11.0

