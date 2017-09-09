From: Colin King <colin.king@canonical.com>
Date: Sat, 09 Sep 2017 16:51:00 +0000
Subject: [PATCH] extcon: make extcon_info static const, fixes warning
Message-Id: <20170909165100.30701-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The array extcon_info is read only, local to the source and does not
need to be in global scope, so make it static const.

Cleans up sparse warning:
symbol 'extcon_info' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/extcon/extcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/extcon/extcon.c b/drivers/extcon/extcon.c
index 35e9fb885486..cb38c2747684 100644
--- a/drivers/extcon/extcon.c
+++ b/drivers/extcon/extcon.c
@@ -36,7 +36,7 @@
 
 #define SUPPORTED_CABLE_MAX	32
 
-struct __extcon_info {
+static const struct __extcon_info {
 	unsigned int type;
 	unsigned int id;
 	const char *name;
-- 
2.14.1

