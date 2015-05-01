From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 01 May 2015 19:37:54 +0000
Subject: [PATCH 13/20] staging: lustre: obdclass: llog: remove unneeded null test before free
Message-Id: <1430509086-22132-9-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430509086-22132-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1430509086-22132-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Kfree can cope with a null argument, so drop null tests.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@ expression ptr; @@

- if (ptr != NULL)
  kfree(ptr);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/obdclass/llog.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/lustre/lustre/obdclass/llog.c b/drivers/staging/lustre/lustre/obdclass/llog.c
index 636df94..4fa52d1 100644
--- a/drivers/staging/lustre/lustre/obdclass/llog.c
+++ b/drivers/staging/lustre/lustre/obdclass/llog.c
@@ -563,8 +563,7 @@ int llog_reverse_process(const struct lu_env *env,
 	}
 
 out:
-	if (buf)
-		kfree(buf);
+	kfree(buf);
 	return rc;
 }
 EXPORT_SYMBOL(llog_reverse_process);

