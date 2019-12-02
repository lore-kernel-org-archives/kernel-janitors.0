From: Colin King <colin.king@canonical.com>
Date: Mon, 02 Dec 2019 09:02:15 +0000
Subject: [PATCH][next] s390/test_unwind: fix spelling mistake "reqister" -> "register"
Message-Id: <20191202090215.28766-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heiko Carstens <heiko.carstens@de.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>, linux-s390@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a pr_info message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/s390/lib/test_unwind.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/s390/lib/test_unwind.c b/arch/s390/lib/test_unwind.c
index bda7ac0ddd29..32b7a30b2485 100644
--- a/arch/s390/lib/test_unwind.c
+++ b/arch/s390/lib/test_unwind.c
@@ -238,7 +238,7 @@ static int test_unwind_irq(struct unwindme *u)
 {
 	preempt_disable();
 	if (register_external_irq(EXT_IRQ_CLK_COMP, unwindme_irq_handler)) {
-		pr_info("Couldn't reqister external interrupt handler");
+		pr_info("Couldn't register external interrupt handler");
 		return -1;
 	}
 	u->task = current;
-- 
2.24.0
