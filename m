From: "Christophe Jaillet" <christophe.jaillet@wanadoo.fr>
Date: Tue, 18 Dec 2007 21:01:04 +0000
Subject: [PATCH 1/3] remove explicit memset to memory allocated withk[zc]alloc
Message-Id: <008c01c841b9$1aaf2420$0b01a8c0@bureau>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Remove an explicit memset(.., 0, ...) to a varialable allocated with
kzalloc.

Signed-off-by: Christophe Jaillet <christophe.jaillet@wanadoo.fr>

---

--- linux-2.6.24-rc5/drivers/ata/pata_at32.c 2007-12-16 11:15:36.000000000
+0100
+++ linux-2.6.24-rc5/drivers/ata/pata_at32.c.cj 2007-12-17
21:59:24.000000000 +0100
@@ -329,8 +329,6 @@ static int __init pata_at32_probe(struct
  if (!info)
   return -ENOMEM;

- memset(info, 0, sizeof(struct at32_ide_info));
-
  info->irq = irq;
  info->cs  = board->cs;



