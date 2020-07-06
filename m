From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 06 Jul 2020 07:30:42 +0000
Subject: Re: [PATCH v5 14/14] irqchip/xilinx-intc: Fix potential resource leak
Message-Id: <5a2564f9-9280-9223-3e24-439fec81ab75@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1593998365-25910-1-git-send-email-yangtiezhu@loongson.cn>
 <1593998365-25910-15-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1593998365-25910-15-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> In the function xilinx_intc_of_init(), system resource "irqc->root_domain"
> was not released in an error case. Thus add a jump target to call the
> function "irq_domain_remove" for the completion of the desired exception
> handling.

Do the corresponding diff hunks express also a renaming of the label “error”?

Is there a need to split such an adjustment?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=dcb7fd82c75ee2d6e6f9d8cc71c52519ed52e258#n138

Regards,
Markus
