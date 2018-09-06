From: Colin King <colin.king@canonical.com>
Date: Thu, 06 Sep 2018 11:19:30 +0000
Subject: [PATCH] agp: check for index out of range before accessing maxes_table[index]
Message-Id: <20180906111930.18743-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently maxes_table[index] is accessed before index is checked to
be out of range.  Fix this by performing the out of range check on
index first.  Also don't check against a hard-coded maximum value
but use the array size instead.

Detected by static analysis with cppcheck:
"Array index 'index' is used before limits check"

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/char/agp/backend.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/char/agp/backend.c b/drivers/char/agp/backend.c
index 38ffb281df97..4e07f01833a2 100644
--- a/drivers/char/agp/backend.c
+++ b/drivers/char/agp/backend.c
@@ -121,7 +121,8 @@ static int agp_find_max(void)
 #endif
 	index = 1;
 
-	while ((memory > maxes_table[index].mem) && (index < 8))
+	while ((index < ARRAY_SIZE(maxes_table) - 1) &&
+	       (memory > maxes_table[index].mem))
 		index++;
 
 	result = maxes_table[index - 1].agp +
-- 
2.17.1
