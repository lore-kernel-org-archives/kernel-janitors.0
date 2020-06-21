From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 21 Jun 2020 08:33:15 +0000
Subject: [PATCH] kernel/cpu_pm: mark 1 function as __init to save some memory
Message-Id: <20200621083315.883209-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: swboyd@chromium.org, bjorn.andersson@linaro.org, dianders@chromium.org, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'cpu_pm_init()' is only called via 'core_initcall'.
It can be marked as __init to save a few bytes of memory.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 kernel/cpu_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/cpu_pm.c b/kernel/cpu_pm.c
index 44a259338e33..6a4717ae6917 100644
--- a/kernel/cpu_pm.c
+++ b/kernel/cpu_pm.c
@@ -191,7 +191,7 @@ static struct syscore_ops cpu_pm_syscore_ops = {
 	.resume = cpu_pm_resume,
 };
 
-static int cpu_pm_init(void)
+static int __init cpu_pm_init(void)
 {
 	register_syscore_ops(&cpu_pm_syscore_ops);
 	return 0;
-- 
2.25.1
