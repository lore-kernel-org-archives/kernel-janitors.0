From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 15 Oct 2017 20:09:39 +0000
Subject: [PATCH 2/3] char/bsr: Improve a size determination in bsr_add_node()
Message-Id: <504858bd-8add-3820-541e-a3f0aa64df65@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ff23c201-8043-124e-88fd-25e5abd382fb@users.sourceforge.net>
In-Reply-To: <ff23c201-8043-124e-88fd-25e5abd382fb@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 15 Oct 2017 21:25:46 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/char/bsr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/char/bsr.c b/drivers/char/bsr.c
index 865eb457e539..d0597dfa4d88 100644
--- a/drivers/char/bsr.c
+++ b/drivers/char/bsr.c
@@ -197,8 +197,7 @@ static int bsr_add_node(struct device_node *bn)
 	num_bsr_devs = bsr_bytes_len / sizeof(u32);
 
 	for (i = 0 ; i < num_bsr_devs; i++) {
-		struct bsr_dev *cur = kzalloc(sizeof(struct bsr_dev),
-					      GFP_KERNEL);
+		struct bsr_dev *cur = kzalloc(sizeof(*cur), GFP_KERNEL);
 		struct resource res;
 		int result;
 
-- 
2.14.2

