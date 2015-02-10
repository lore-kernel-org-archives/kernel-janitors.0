From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Tue, 10 Feb 2015 09:24:12 +0000
Subject: [PATCH v2 1/1] staging: ozwpan: Remove allocation from delaration line
Message-Id: <20150210092412.GA12753@sloth>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shigekatsu Tateno <shigekatsu.tateno@atmel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

This patch removes allocation from declaration line because
people are known to gloss over declarations.

Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>
---
 Changes since v1:
 - Remove the blank line between allocation and NULL check

 drivers/staging/ozwpan/ozhcd.c | 5 +++--
 drivers/staging/ozwpan/ozpd.c  | 8 +++++---
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/ozwpan/ozhcd.c b/drivers/staging/ozwpan/ozhcd.c
index 8543bb2..96e95bf 100644
--- a/drivers/staging/ozwpan/ozhcd.c
+++ b/drivers/staging/ozwpan/ozhcd.c
@@ -280,8 +280,9 @@ static void oz_free_urb_link(struct oz_urb_link *urbl)
  */
 static struct oz_endpoint *oz_ep_alloc(int buffer_size, gfp_t mem_flags)
 {
-	struct oz_endpoint *ep -		kzalloc(sizeof(struct oz_endpoint)+buffer_size, mem_flags);
+	struct oz_endpoint *ep;
+
+	ep = kzalloc(sizeof(struct oz_endpoint)+buffer_size, mem_flags);
 	if (ep) {
 		INIT_LIST_HEAD(&ep->urb_list);
 		INIT_LIST_HEAD(&ep->link);
diff --git a/drivers/staging/ozwpan/ozpd.c b/drivers/staging/ozwpan/ozpd.c
index 852c288..1c95d57 100644
--- a/drivers/staging/ozwpan/ozpd.c
+++ b/drivers/staging/ozwpan/ozpd.c
@@ -102,8 +102,9 @@ void oz_pd_put(struct oz_pd *pd)
  */
 struct oz_pd *oz_pd_alloc(const u8 *mac_addr)
 {
-	struct oz_pd *pd = kzalloc(sizeof(struct oz_pd), GFP_ATOMIC);
+	struct oz_pd *pd;
 
+	pd = kzalloc(sizeof(struct oz_pd), GFP_ATOMIC);
 	if (pd) {
 		int i;
 
@@ -652,8 +653,9 @@ static struct oz_isoc_stream *pd_stream_find(struct oz_pd *pd, u8 ep_num)
  */
 int oz_isoc_stream_create(struct oz_pd *pd, u8 ep_num)
 {
-	struct oz_isoc_stream *st -		kzalloc(sizeof(struct oz_isoc_stream), GFP_ATOMIC);
+	struct oz_isoc_stream *st;
+
+	st = kzalloc(sizeof(struct oz_isoc_stream), GFP_ATOMIC);
 	if (!st)
 		return -ENOMEM;
 	st->ep_num = ep_num;
-- 
1.9.1

