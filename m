From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 28 Dec 2017 21:48:17 +0000
Subject: [PATCH 3/3] pcmcia/cis: Improve a size determination in pcmcia_loop_config()
Message-Id: <5c488128-16ca-195c-f5fc-ab97938bd8e5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4eaa454f-8b57-fe0a-4802-3676bc2f582e@users.sourceforge.net>
In-Reply-To: <4eaa454f-8b57-fe0a-4802-3676bc2f582e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pcmcia@lists.infradead.org, Bhumika Goyal <bhumirks@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 28 Dec 2017 22:30:42 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pcmcia/pcmcia_cis.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pcmcia/pcmcia_cis.c b/drivers/pcmcia/pcmcia_cis.c
index ffcd014b7bc1..ecee94e8f30a 100644
--- a/drivers/pcmcia/pcmcia_cis.c
+++ b/drivers/pcmcia/pcmcia_cis.c
@@ -264,7 +264,7 @@ int pcmcia_loop_config(struct pcmcia_device *p_dev,
 	struct pcmcia_cfg_mem *cfg_mem;
 	int ret;
 
-	cfg_mem = kzalloc(sizeof(struct pcmcia_cfg_mem), GFP_KERNEL);
+	cfg_mem = kzalloc(sizeof(*cfg_mem), GFP_KERNEL);
 	if (cfg_mem = NULL)
 		return -ENOMEM;
 
-- 
2.15.1

