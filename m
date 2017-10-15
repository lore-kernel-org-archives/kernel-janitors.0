From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 15 Oct 2017 20:10:42 +0000
Subject: [PATCH 3/3] char/bsr: Adjust one function call together with a variable assignment
Message-Id: <5ec5cfbe-bc03-d01a-d5e6-4083b7071d69@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ff23c201-8043-124e-88fd-25e5abd382fb@users.sourceforge.net>
In-Reply-To: <ff23c201-8043-124e-88fd-25e5abd382fb@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 15 Oct 2017 21:55:26 +0200

The script "checkpatch.pl" pointed information out like the following.

ERROR: do not use assignment in if condition

Thus fix the affected source code place.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/char/bsr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/char/bsr.c b/drivers/char/bsr.c
index d0597dfa4d88..f11df210294a 100644
--- a/drivers/char/bsr.c
+++ b/drivers/char/bsr.c
@@ -320,7 +320,8 @@ static int __init bsr_init(void)
 		goto out_err_2;
 	}
 
-	if ((ret = bsr_create_devs(np)) < 0) {
+	ret = bsr_create_devs(np);
+	if (ret < 0) {
 		np = NULL;
 		goto out_err_3;
 	}
-- 
2.14.2

