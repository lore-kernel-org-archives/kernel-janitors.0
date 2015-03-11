From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 11 Mar 2015 16:56:28 +0000
Subject: [PATCH 6/15] torture: don't export static symbol
Message-Id: <1426092997-30605-7-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1426092997-30605-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1426092997-30605-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, daniel@iogearbox.net
Cc: kernel-janitors@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
type T;
identifier f;
@@

static T f (...) { ... }

@@
identifier r.f;
declarer name EXPORT_SYMBOL_GPL;
@@

-EXPORT_SYMBOL_GPL(f);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 kernel/torture.c |    2 --
 1 file changed, 2 deletions(-)

diff -u -p a/kernel/torture.c b/kernel/torture.c
--- a/kernel/torture.c
+++ b/kernel/torture.c
@@ -206,7 +206,6 @@ static void torture_onoff_cleanup(void)
 	onoff_task = NULL;
 #endif /* #ifdef CONFIG_HOTPLUG_CPU */
 }
-EXPORT_SYMBOL_GPL(torture_onoff_cleanup);
 
 /*
  * Print online/offline testing statistics.
@@ -392,7 +391,6 @@ static void torture_shuffle_cleanup(void
 	}
 	shuffler_task = NULL;
 }
-EXPORT_SYMBOL_GPL(torture_shuffle_cleanup);
 
 /*
  * Variables for auto-shutdown.  This allows "lights out" torture runs

