From: Ben Werbowyj <ben.werbowyj@gmail.com>
Date: Fri, 22 Jul 2016 01:08:09 +0000
Subject: [PATCH] drivers: w1: w1: fixed whitespace errors around parenthesis
Message-Id: <1469149689-6098-1-git-send-email-ben.werbowyj@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Removed whitespace between open/close parenthesis and internal
contents.

Signed-off-by: Ben Werbowyj <ben.werbowyj@gmail.com>
---
 drivers/w1/w1.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
index bb34362..789392f 100644
--- a/drivers/w1/w1.c
+++ b/drivers/w1/w1.c
@@ -963,7 +963,7 @@ void w1_search(struct w1_master *dev, u8 search_type, w1_slave_found_callback cb
 
 	desc_bit = 64;
 
-	while ( !last_device && (slave_count++ < dev->max_slave_count) ) {
+	while (!last_device && (slave_count++ < dev->max_slave_count)) {
 		last_rn = rn;
 		rn = 0;
 
@@ -1008,7 +1008,7 @@ void w1_search(struct w1_master *dev, u8 search_type, w1_slave_found_callback cb
 			triplet_ret = w1_triplet(dev, search_bit);
 
 			/* quit if no device responded */
-			if ( (triplet_ret & 0x03) = 0x03 )
+			if ((triplet_ret & 0x03) = 0x03)
 				break;
 
 			/* If both directions were valid, and we took the 0 path... */
@@ -1027,7 +1027,7 @@ void w1_search(struct w1_master *dev, u8 search_type, w1_slave_found_callback cb
 		}
 		mutex_unlock(&dev->bus_mutex);
 
-		if ( (triplet_ret & 0x03) != 0x03 ) {
+		if ((triplet_ret & 0x03) != 0x03) {
 			if ((desc_bit = last_zero) || (last_zero < 0)) {
 				last_device = 1;
 				dev->search_id = 0;
-- 
2.1.4

