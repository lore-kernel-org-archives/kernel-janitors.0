From: Colin King <colin.king@canonical.com>
Date: Sat, 30 Jun 2018 11:22:46 +0000
Subject: [PATCH][next] gnss: make struct ubx_gserial_ops static
Message-Id: <20180630112246.942-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johan Hovold <johan@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The structure ubx_gserial_ops is local to the source and does not need
to be in global scope, so make it static.

Cleans up sparse warning:
symbol 'ubx_gserial_ops' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gnss/ubx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gnss/ubx.c b/drivers/gnss/ubx.c
index 902b6854b7db..12568aebb7f6 100644
--- a/drivers/gnss/ubx.c
+++ b/drivers/gnss/ubx.c
@@ -59,7 +59,7 @@ static int ubx_set_power(struct gnss_serial *gserial,
 	return -EINVAL;
 }
 
-const struct gnss_serial_ops ubx_gserial_ops = {
+static const struct gnss_serial_ops ubx_gserial_ops = {
 	.set_power = ubx_set_power,
 };
 
-- 
2.17.1

