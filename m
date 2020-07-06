From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 06 Jul 2020 06:14:58 +0000
Subject: Re: [PATCH v5 03/14] irqchip/csky-mpintc: Fix potential resource leaks
Message-Id: <3cdb3f12-0862-6985-2236-a724267ead81@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1593998365-25910-1-git-send-email-yangtiezhu@loongson.cn>
 <1593998365-25910-4-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1593998365-25910-4-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Denis Efremov <efremov@linux.com>, "Gustavo A. R. Silva" <garsilva@embeddedor.com>

> … Thus add jump targets for the completion of the desired
> exception handling. By the way, do some coding-style cleanups
> suggested by Markus.

I propose to split these changes.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=dcb7fd82c75ee2d6e6f9d8cc71c52519ed52e258#n138

Would you like to support easier back-porting of a fix
besides another bit of possible source code beautification?


…
+++ b/drivers/irqchip/irq-csky-mpintc.c
@@ -241,14 +241,16 @@ csky_mpintc_init(struct device_node *node, struct device_node *parent)
…
 		INTCG_base = ioremap(mfcr("cr<31, 14>"),
-				     INTCL_SIZE*nr_cpu_ids + INTCG_SIZE);
…
+				     INTCL_SIZE * nr_cpu_ids + INTCG_SIZE);

Can any macro (or function) be helpful for such a size computation?

Regards,
Markus
