From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Dec 2017 10:32:46 +0000
Subject: [PATCH 4/7] rapidio: Improve a size determination in five functions
Message-Id: <495f571c-fb4d-b1d5-a6e5-494f2c537a8d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f6e4d185-2c9d-a31d-793d-bda521c450ea@users.sourceforge.net>
In-Reply-To: <f6e4d185-2c9d-a31d-793d-bda521c450ea@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Alexandre Bounine <alexandre.bounine@idt.com>, Matt Porter <mporter@kernel.crashing.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 14 Dec 2017 16:24:51 +0100

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/rapidio/rio.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/rapidio/rio.c b/drivers/rapidio/rio.c
index b9dc932ce19e..90534365e46c 100644
--- a/drivers/rapidio/rio.c
+++ b/drivers/rapidio/rio.c
@@ -110,9 +110,8 @@ EXPORT_SYMBOL(rio_query_mport);
  */
 struct rio_net *rio_alloc_net(struct rio_mport *mport)
 {
-	struct rio_net *net;
+	struct rio_net *net = kzalloc(sizeof(*net), GFP_KERNEL);
 
-	net = kzalloc(sizeof(struct rio_net), GFP_KERNEL);
 	if (net) {
 		INIT_LIST_HEAD(&net->node);
 		INIT_LIST_HEAD(&net->devices);
@@ -246,8 +245,7 @@ int rio_request_inb_mbox(struct rio_mport *mport,
 	if (!mport->ops->open_inb_mbox)
 		goto out;
 
-	res = kzalloc(sizeof(struct resource), GFP_KERNEL);
-
+	res = kzalloc(sizeof(*res), GFP_KERNEL);
 	if (res) {
 		rio_init_mbox_res(res, mbox, mbox);
 
@@ -329,8 +327,7 @@ int rio_request_outb_mbox(struct rio_mport *mport,
 	if (!mport->ops->open_outb_mbox)
 		goto out;
 
-	res = kzalloc(sizeof(struct resource), GFP_KERNEL);
-
+	res = kzalloc(sizeof(*res), GFP_KERNEL);
 	if (res) {
 		rio_init_mbox_res(res, mbox, mbox);
 
@@ -445,8 +442,7 @@ int rio_request_inb_dbell(struct rio_mport *mport,
 					u16 dst, u16 info))
 {
 	int rc = 0;
-
-	struct resource *res = kzalloc(sizeof(struct resource), GFP_KERNEL);
+	struct resource *res = kzalloc(sizeof(*res), GFP_KERNEL);
 
 	if (res) {
 		rio_init_dbell_res(res, start, end);
@@ -568,9 +564,8 @@ int rio_add_mport_pw_handler(struct rio_mport *mport, void *context,
 			     void *context, union rio_pw_msg *msg, int step))
 {
 	int rc = 0;
-	struct rio_pwrite *pwrite;
+	struct rio_pwrite *pwrite = kzalloc(sizeof(*pwrite), GFP_KERNEL);
 
-	pwrite = kzalloc(sizeof(struct rio_pwrite), GFP_KERNEL);
 	if (!pwrite) {
 		rc = -ENOMEM;
 		goto out;
-- 
2.15.1

