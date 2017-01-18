From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Jan 2017 13:48:12 +0000
Subject: [PATCH 2/3] AVR32: Delete an unnecessary variable initialisation in setup_rt_frame()
Message-Id: <e5f590b7-b7bf-740b-62b6-8fc7d7def05c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <308dc151-c874-dfe7-64f9-24a63fc66883@users.sourceforge.net>
In-Reply-To: <308dc151-c874-dfe7-64f9-24a63fc66883@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Haavard Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Jan 2017 14:03:10 +0100

The local variable "err" will be set to an appropriate value a bit later.
Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/avr32/kernel/signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/avr32/kernel/signal.c b/arch/avr32/kernel/signal.c
index 13c31a7b9ae4..0c46d3618694 100644
--- a/arch/avr32/kernel/signal.c
+++ b/arch/avr32/kernel/signal.c
@@ -138,7 +138,7 @@ static int
 setup_rt_frame(struct ksignal *ksig, sigset_t *set, struct pt_regs *regs)
 {
 	struct rt_sigframe __user *frame;
-	int err = 0;
+	int err;
 
 	frame = get_sigframe(ksig, regs, sizeof(*frame));
 	if (!access_ok(VERIFY_WRITE, frame, sizeof (*frame)))
-- 
2.11.0

