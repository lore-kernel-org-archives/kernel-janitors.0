From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Jan 2017 13:46:24 +0000
Subject: [PATCH 1/3] AVR32: Return directly after a failed access_ok() in setup_rt_frame()
Message-Id: <59733f4e-18e2-9d71-31c8-dbf654c191f0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <308dc151-c874-dfe7-64f9-24a63fc66883@users.sourceforge.net>
In-Reply-To: <308dc151-c874-dfe7-64f9-24a63fc66883@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Haavard Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Jan 2017 13:50:38 +0100

Return directly after a call of the function "access_ok" failed
at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/avr32/kernel/signal.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/avr32/kernel/signal.c b/arch/avr32/kernel/signal.c
index 8f1c63b9b983..13c31a7b9ae4 100644
--- a/arch/avr32/kernel/signal.c
+++ b/arch/avr32/kernel/signal.c
@@ -141,9 +141,8 @@ setup_rt_frame(struct ksignal *ksig, sigset_t *set, struct pt_regs *regs)
 	int err = 0;
 
 	frame = get_sigframe(ksig, regs, sizeof(*frame));
-	err = -EFAULT;
 	if (!access_ok(VERIFY_WRITE, frame, sizeof (*frame)))
-		goto out;
+		return -EFAULT;
 
 	/*
 	 * Set up the return code:
-- 
2.11.0

