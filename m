From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 12 Dec 2017 12:44:45 +0000
Subject: [PATCH 4.14 105/164] irqchip/qcom: Fix u32 comparison with value less than zero
Message-Id: <20171212123448.806421851@linuxfoundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171212123443.785979602@linuxfoundation.org>
In-Reply-To: <20171212123443.785979602@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Colin Ian King <colin.king@canonical.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, kernel-janitors@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Sasha Levin <alexander.levin@verizon.com>

4.14-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Colin Ian King <colin.king@canonical.com>


[ Upstream commit e9990d70e8a063a7b894c5cbb99f630a0f41200d ]

The comparison of u32 nregs being less than zero is never true since
nregs is unsigned. Fix this by making nregs a signed integer.

Fixes: f20cc9b00c7b ("irqchip/qcom: Add IRQ combiner driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: kernel-janitors@vger.kernel.org
Cc: Jason Cooper <jason@lakedaemon.net>
Link: https://lkml.kernel.org/r/20171117183553.2739-1-colin.king@canonical.com
Signed-off-by: Sasha Levin <alexander.levin@verizon.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/irqchip/qcom-irq-combiner.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/irqchip/qcom-irq-combiner.c
+++ b/drivers/irqchip/qcom-irq-combiner.c
@@ -238,7 +238,7 @@ static int __init combiner_probe(struct
 {
 	struct combiner *combiner;
 	size_t alloc_sz;
-	u32 nregs;
+	int nregs;
 	int err;
 
 	nregs = count_registers(pdev);


