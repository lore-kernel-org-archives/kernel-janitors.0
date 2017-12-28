From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 28 Dec 2017 21:46:54 +0000
Subject: [PATCH 2/3] pcmcia/cis: Delete an error message for a failed memory allocation in two functions
Message-Id: <c22708e9-bd7f-71fa-d70c-eed78a04de01@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4eaa454f-8b57-fe0a-4802-3676bc2f582e@users.sourceforge.net>
In-Reply-To: <4eaa454f-8b57-fe0a-4802-3676bc2f582e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pcmcia@lists.infradead.org, Bhumika Goyal <bhumirks@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 28 Dec 2017 22:20:51 +0100

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pcmcia/pcmcia_cis.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/pcmcia/pcmcia_cis.c b/drivers/pcmcia/pcmcia_cis.c
index 1c05d74e850d..ffcd014b7bc1 100644
--- a/drivers/pcmcia/pcmcia_cis.c
+++ b/drivers/pcmcia/pcmcia_cis.c
@@ -43,10 +43,9 @@ int pccard_read_tuple(struct pcmcia_socket *s, unsigned int function,
 	int ret;
 
 	buf = kmalloc(256, GFP_KERNEL);
-	if (buf = NULL) {
-		dev_warn(&s->dev, "no memory to read tuple\n");
+	if (!buf)
 		return -ENOMEM;
-	}
+
 	tuple.DesiredTuple = code;
 	tuple.Attributes = 0;
 	if (function = BIND_FN_ALL)
@@ -93,10 +92,8 @@ int pccard_loop_tuple(struct pcmcia_socket *s, unsigned int function,
 	int ret;
 
 	buf = kzalloc(256, GFP_KERNEL);
-	if (buf = NULL) {
-		dev_warn(&s->dev, "no memory to read tuple\n");
+	if (!buf)
 		return -ENOMEM;
-	}
 
 	tuple.TupleData = buf;
 	tuple.TupleDataMax = 255;
-- 
2.15.1

