From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 03 Aug 2017 19:09:51 +0000
Subject: [PATCH] tee: constify tee_driver_ops and tee_desc structures
Message-Id: <1501787391-13965-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>

tee_driver_ops structures are only stored in the ops field of tee_desc
structures, which is const, and in turn tee_desc structures are only passed
as the first argument of tee_device_alloc, and this argument is const as
well.  Thus the two kinds of structures can be const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/tee/optee/core.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
index 58169e5..7609ec6 100644
--- a/drivers/tee/optee/core.c
+++ b/drivers/tee/optee/core.c
@@ -258,7 +258,7 @@ static void optee_release(struct tee_context *ctx)
 	}
 }
 
-static struct tee_driver_ops optee_ops = {
+static const struct tee_driver_ops optee_ops = {
 	.get_version = optee_get_version,
 	.open = optee_open,
 	.release = optee_release,
@@ -268,13 +268,13 @@ static void optee_release(struct tee_context *ctx)
 	.cancel_req = optee_cancel_req,
 };
 
-static struct tee_desc optee_desc = {
+static const struct tee_desc optee_desc = {
 	.name = DRIVER_NAME "-clnt",
 	.ops = &optee_ops,
 	.owner = THIS_MODULE,
 };
 
-static struct tee_driver_ops optee_supp_ops = {
+static const struct tee_driver_ops optee_supp_ops = {
 	.get_version = optee_get_version,
 	.open = optee_open,
 	.release = optee_release,
@@ -282,7 +282,7 @@ static void optee_release(struct tee_context *ctx)
 	.supp_send = optee_supp_send,
 };
 
-static struct tee_desc optee_supp_desc = {
+static const struct tee_desc optee_supp_desc = {
 	.name = DRIVER_NAME "-supp",
 	.ops = &optee_supp_ops,
 	.owner = THIS_MODULE,

