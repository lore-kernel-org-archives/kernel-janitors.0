From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Feb 2015 19:48:41 +0000
Subject: [PATCH 6/7] ocfs2: One function call less in ocfs2_init_slot_info() after error detection
Message-Id: <54E8E119.1080908@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <5455FC05.4010606@users.sourceforge.net> <alpine.DEB.2.02.1411021150540.2239@localhost6.localdomain6> <54E8DDDB.9020902@users.sourceforge.net>
In-Reply-To: <54E8DDDB.9020902@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joel Becker <jlbec@evilplan.org>, Mark Fasheh <mfasheh@suse.com>, ocfs2-devel@oss.oracle.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Feb 2015 19:49:50 +0100

The __ocfs2_free_slot_info() function was called by the ocfs2_init_slot_info()
function even if a call of the kzalloc() function failed.

Return from this implementation directly after corresponding
exception handling.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/ocfs2/slot_map.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ocfs2/slot_map.c b/fs/ocfs2/slot_map.c
index c5e530a..e78a203 100644
--- a/fs/ocfs2/slot_map.c
+++ b/fs/ocfs2/slot_map.c
@@ -427,7 +427,7 @@ int ocfs2_init_slot_info(struct ocfs2_super *osb)
 	if (!si) {
 		status = -ENOMEM;
 		mlog_errno(status);
-		goto bail;
+		return status;
 	}
 
 	si->si_extended = ocfs2_uses_extended_slot_map(osb);
-- 
2.3.0

