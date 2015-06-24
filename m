From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 24 Jun 2015 12:40:11 +0000
Subject: [PATCH] kdbus: Delete an unnecessary check before the function call "kdbus_domain_unref"
Message-Id: <558AA52B.1030809@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net>
In-Reply-To: <5317A59D.4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Mack <daniel@zonque.org>, David Herrmann <dh.herrmann@googlemail.com>, Djalal Harouni <tixxdz@opendz.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 24 Jun 2015 14:30:17 +0200

The kdbus_domain_unref() function tests whether its argument is NULL
and then returns immediately. Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 ipc/kdbus/fs.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/ipc/kdbus/fs.c b/ipc/kdbus/fs.c
index d01f33b..205a3ad 100644
--- a/ipc/kdbus/fs.c
+++ b/ipc/kdbus/fs.c
@@ -325,9 +325,7 @@ static void fs_super_kill(struct super_block *sb)
 	}
 
 	kill_anon_super(sb);
-
-	if (domain)
-		kdbus_domain_unref(domain);
+	kdbus_domain_unref(domain);
 }
 
 static int fs_super_set(struct super_block *sb, void *data)
-- 
2.4.4

