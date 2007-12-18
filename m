From: "Christophe Jaillet" <christophe.jaillet@wanadoo.fr>
Date: Tue, 18 Dec 2007 21:16:50 +0000
Subject: [PATCH 2/3] remove explicit memset to memory allocated with k[zc]alloc
Message-Id: <004a01c841bb$4eb629b0$0b01a8c0@bureau>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Remove an explicit memset(.., 0, ...) to a varialable allocated with
kcalloc.

Signed-off-by: Christophe Jaillet <christophe.jaillet@wanadoo.fr>

---

--- linux-2.6.24-rc5/arch/blackfin/kernel/bfin_gpio.c 2007-12-16
11:13:58.000000000 +0100
+++ linux-2.6.24-rc5/arch/blackfin/kernel/bfin_gpio.c.cj 2007-12-17
21:58:02.000000000 +0100
@@ -423,8 +423,6 @@ static int __init bfin_gpio_init(void)
  if (str_ident = NULL)
   return -ENOMEM;

- memset(str_ident, 0, MAX_RESOURCES * sizeof(struct str_ident));
-
  printk(KERN_INFO "Blackfin GPIO Controller\n");

  return 0;


