From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 04 Jul 2015 07:13:02 +0000
Subject: [PATCH] kernel-sched: Delete an unnecessary check before unregister_sysctl_table()
Message-Id: <5597877E.3060503@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net>
In-Reply-To: <5317A59D.4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>
Cc: kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 4 Jul 2015 09:06:32 +0200

The unregister_sysctl_table() function tests whether its argument is NULL
and then returns immediately. Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 kernel/sched/core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index b803e1b..4756d1c 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5298,8 +5298,7 @@ static void register_sched_domain_sysctl(void)
 /* may be called multiple times per register */
 static void unregister_sched_domain_sysctl(void)
 {
-	if (sd_sysctl_header)
-		unregister_sysctl_table(sd_sysctl_header);
+	unregister_sysctl_table(sd_sysctl_header);
 	sd_sysctl_header = NULL;
 	if (sd_ctl_dir[0].child)
 		sd_free_ctl_entry(&sd_ctl_dir[0].child);
-- 
2.4.5

