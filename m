From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 17 Oct 2017 18:55:34 +0000
Subject: [PATCH 1/2] powerpc-ps3: Delete an error message for a failed memory allocation in update_flash_db()
Message-Id: <e16c8b7d-de3a-6c96-9af4-dd0551cca805@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <36a8ba41-7f1e-31f8-5d32-19e04393b181@users.sourceforge.net>
In-Reply-To: <36a8ba41-7f1e-31f8-5d32-19e04393b181@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Geoff Levand <geoff@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 17 Oct 2017 20:00:31 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/platforms/ps3/os-area.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/ps3/os-area.c b/arch/powerpc/platforms/ps3/os-area.c
index 3db53e8aff92..f2a8875e25d1 100644
--- a/arch/powerpc/platforms/ps3/os-area.c
+++ b/arch/powerpc/platforms/ps3/os-area.c
@@ -625,10 +625,8 @@ static int update_flash_db(void)
 	/* Read in header and db from flash. */
 
 	header = kmalloc(buf_len, GFP_KERNEL);
-	if (!header) {
-		pr_debug("%s: kmalloc failed\n", __func__);
+	if (!header)
 		return -ENOMEM;
-	}
 
 	count = os_area_flash_read(header, buf_len, 0);
 	if (count < 0) {
-- 
2.14.2

