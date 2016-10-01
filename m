From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 01 Oct 2016 07:46:37 +0000
Subject: [PATCH 4/9] md/dm-table: Delete an unnecessary variable initialisation in dm_split_args()
Message-Id: <881c92f5-e986-62a1-5c42-708ed8f28520@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <45984567-4421-5f8d-ddf3-eb2a769a1860@users.sourceforge.net>
In-Reply-To: <45984567-4421-5f8d-ddf3-eb2a769a1860@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dm-devel@redhat.com, linux-raid@vger.kernel.org, Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, Shaohua Li <shli@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 1 Oct 2016 07:37:27 +0200

The local variable "argv" will be set to an appropriate pointer
a bit later. Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/md/dm-table.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 67cc635..e74763c 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -538,7 +538,7 @@ static char **realloc_argv(unsigned *array_size, char **old_argv)
  */
 int dm_split_args(int *argc, char ***argvp, char *input)
 {
-	char *start, *end = input, *out, **argv = NULL;
+	char *start, *end = input, *out, **argv;
 	unsigned array_size = 0;
 
 	*argc = 0;
-- 
2.10.0

