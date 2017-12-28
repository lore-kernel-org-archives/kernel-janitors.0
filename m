From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 28 Dec 2017 21:45:45 +0000
Subject: [PATCH 1/3] pcmcia/cistpl: Delete error messages for a failed memory allocation in three functions
Message-Id: <45a0f894-3de7-0606-08d1-3422d135cf2d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4eaa454f-8b57-fe0a-4802-3676bc2f582e@users.sourceforge.net>
In-Reply-To: <4eaa454f-8b57-fe0a-4802-3676bc2f582e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pcmcia@lists.infradead.org, Bhumika Goyal <bhumirks@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 28 Dec 2017 22:12:00 +0100

Omit extra messages for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pcmcia/cistpl.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/pcmcia/cistpl.c b/drivers/pcmcia/cistpl.c
index 102646fedb56..192c0e8e9c3d 100644
--- a/drivers/pcmcia/cistpl.c
+++ b/drivers/pcmcia/cistpl.c
@@ -379,10 +379,9 @@ int verify_cis_cache(struct pcmcia_socket *s)
 		return -EINVAL;
 
 	buf = kmalloc(256, GFP_KERNEL);
-	if (buf = NULL) {
-		dev_warn(&s->dev, "no memory for verifying CIS\n");
+	if (!buf)
 		return -ENOMEM;
-	}
+
 	mutex_lock(&s->ops_mutex);
 	list_for_each_entry(cis, &s->cis_cache, node) {
 		int len = cis->len;
@@ -419,7 +418,6 @@ int pcmcia_replace_cis(struct pcmcia_socket *s,
 	kfree(s->fake_cis);
 	s->fake_cis = kmalloc(len, GFP_KERNEL);
 	if (s->fake_cis = NULL) {
-		dev_warn(&s->dev, "no memory to replace CIS\n");
 		mutex_unlock(&s->ops_mutex);
 		return -ENOMEM;
 	}
@@ -1395,14 +1393,12 @@ int pccard_validate_cis(struct pcmcia_socket *s, unsigned int *info)
 	mutex_unlock(&s->ops_mutex);
 
 	tuple = kmalloc(sizeof(*tuple), GFP_KERNEL);
-	if (tuple = NULL) {
-		dev_warn(&s->dev, "no memory to validate CIS\n");
+	if (!tuple)
 		return -ENOMEM;
-	}
+
 	p = kmalloc(sizeof(*p), GFP_KERNEL);
 	if (p = NULL) {
 		kfree(tuple);
-		dev_warn(&s->dev, "no memory to validate CIS\n");
 		return -ENOMEM;
 	}
 
-- 
2.15.1

