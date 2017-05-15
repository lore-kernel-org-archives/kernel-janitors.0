From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 May 2017 12:29:01 +0000
Subject: [PATCH 3/4] pcmcia: pd6729: Add the macro "pr_fmt"
Message-Id: <6afb72fc-18c4-3fbd-17c6-54fb535f495c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <07cd817c-3045-72d8-34e2-e81b73efc291@users.sourceforge.net>
In-Reply-To: <07cd817c-3045-72d8-34e2-e81b73efc291@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pcmcia@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 May 2017 13:15:33 +0200

Add a definition for the macro "pr_fmt" so that its information can be used
for consistent message output.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pcmcia/pd6729.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pcmcia/pd6729.c b/drivers/pcmcia/pd6729.c
index a723ffbbd691..b3422119820a 100644
--- a/drivers/pcmcia/pd6729.c
+++ b/drivers/pcmcia/pd6729.c
@@ -7,6 +7,8 @@
  * the GNU General Public License, incorporated herein by reference.
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/slab.h>
-- 
2.13.0

