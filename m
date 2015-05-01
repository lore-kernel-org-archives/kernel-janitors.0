From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 01 May 2015 19:37:51 +0000
Subject: [PATCH 16/20] staging: lustre: obdecho: remove unneeded null test before free
Message-Id: <1430509086-22132-6-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/staging/lustre/lustre/obdecho/echo_client.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/lustre/lustre/obdecho/echo_client.c b/drivers/staging/lustre/lustre/obdecho/echo_client.c
index cf64538..5376178 100644
--- a/drivers/staging/lustre/lustre/obdecho/echo_client.c
+++ b/drivers/staging/lustre/lustre/obdecho/echo_client.c
@@ -1737,10 +1737,8 @@ static int echo_client_prep_commit(const struct lu_env *env,
 	}
 
 out:
-	if (lnb)
-		kfree(lnb);
-	if (rnb)
-		kfree(rnb);
+	kfree(lnb);
+	kfree(rnb);
 	return ret;
 }
 

