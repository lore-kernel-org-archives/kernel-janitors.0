From: Colin King <colin.king@canonical.com>
Date: Tue, 18 Jul 2017 13:03:58 +0000
Subject: [PATCH 1/3][staging-next] staging: pi433: Make a couple of functions static
Message-Id: <20170718130400.25436-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marcus Wolf <linux@Wolf-Entwicklungen.de>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The functions pi433_receive and pi433_tx_thread are local to the source
and do not need to be in global scope, so make them static

Cleans up sparse warnings:
symbol 'pi433_receive' was not declared. Should it be static?
symbol 'pi433_tx_thread' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/pi433/pi433_if.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index d9328ce5ec1d..95930a192de4 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -313,7 +313,7 @@ pi433_start_rx(struct pi433_device *dev)
 
 /*-------------------------------------------------------------------------*/
 
-int
+static int
 pi433_receive(void *data)
 {
 	struct pi433_device *dev = data;
@@ -463,7 +463,7 @@ pi433_receive(void *data)
 		return bytes_total;
 }
 
-int
+static int
 pi433_tx_thread(void *data)
 {
 	struct pi433_device *device = data;
-- 
2.11.0

