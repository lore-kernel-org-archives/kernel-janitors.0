From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 01 Jul 2020 09:30:49 +0000
Subject: Re: [PATCH v4 12/14] irqchip/riscv-intc: Fix potential resource leak
Message-Id: <78ab5f7d-3c64-6125-cf8e-822e7b0106ef@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1593569786-11500-1-git-send-email-yangtiezhu@loongson.cn>
 <1593569786-11500-13-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1593569786-11500-13-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> In the function riscv_intc_init(), system resource "intc_domain"
> was not released in the error case, fix it.

Another small wording adjustment:
  … in an error case. Thus add a call of the function “irq_domain_remove”
  in the if branch.

Regards,
Markus
