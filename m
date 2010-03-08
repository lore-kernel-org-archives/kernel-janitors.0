From: "Christophe Jaillet" <christophe.jaillet@wanadoo.fr>
Date: Mon, 08 Mar 2010 21:06:20 +0000
Subject: [patch] arch/powerpc/platforms/pseries/ras.c - cleanup
Message-Id: <hn3osd$4in$1@dough.gmane.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Christophe Jaillet <christophe.jaillet@wanadoo.fr>

Hi, here is a patch against arch/powerpc/platforms/pseries/ras.c.

No need to memset (.., 0, ...) a buffer that is complety filled by a memcpy
the line after.


Signed-off-by: Christophe Jaillet <christophe.jaillet@wanadoo.fr>

---

diff --git a/arch/powerpc/platforms/pseries/ras.c
b/arch/powerpc/platforms/pseries/ras.c
index 2b548af..7a401ed 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -276,7 +276,6 @@ static struct rtas_error_log *fwnmi_get_errinfo(struct
pt_regs *regs)
      (errdata >= rtas.base && errdata < rtas.base + rtas.size - 16)) {
   savep = __va(errdata);
   regs->gpr[3] = savep[0]; /* restore original r3 */
-  memset(mce_data_buf, 0, RTAS_ERROR_LOG_MAX);
   memcpy(mce_data_buf, (char *)(savep + 1), RTAS_ERROR_LOG_MAX);
   errhdr = (struct rtas_error_log *)mce_data_buf;
  } else {



