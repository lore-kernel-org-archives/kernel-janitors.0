From: Jiri Olsa <olsajiri@gmail.com>
Date: Tue, 19 Feb 2008 21:49:33 +0000
Subject: [PATCH] uml: use DIV_ROUND_UP
Message-Id: <47BB4EED.7020109@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

I just saw similar patches in the janitor kernel's list,
and spotted place it fits.

Signed-off-by: Jiri Olsa <olsajiri@gmail.com>
---
 arch/um/drivers/ubd_kern.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/arch/um/drivers/ubd_kern.c b/arch/um/drivers/ubd_kern.c
index b1a77b1..1e579e4 100644
--- a/arch/um/drivers/ubd_kern.c
+++ b/arch/um/drivers/ubd_kern.c
@@ -1020,8 +1020,7 @@ static void cowify_bitmap(__u64 io_offset, int length, unsigned long *cow_mask,
 	 * by one word.  Thanks to Lynn Kerby for the fix and James McMechan
 	 * for the original diagnosis.
 	 */
-	if(*cow_offset = ((bitmap_len + sizeof(unsigned long) - 1) /
-			   sizeof(unsigned long) - 1))
+	if(*cow_offset = (DIV_ROUND_UP(bitmap_len, sizeof(unsigned long)) - 1))
 		(*cow_offset)--;
 
 	bitmap_words[0] = bitmap[*cow_offset];

