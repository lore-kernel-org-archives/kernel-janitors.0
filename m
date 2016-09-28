From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 28 Sep 2016 15:41:11 +0000
Subject: [PATCH 04/10] md/dm-crypt: Delete an unnecessary variable initialisation in crypt_message()
Message-Id: <5baf3472-b5d1-c96f-b84a-cad2f60a5547@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <7c232017-e291-fd2d-5516-26e5150d90df@users.sourceforge.net>
In-Reply-To: <7c232017-e291-fd2d-5516-26e5150d90df@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dm-devel@redhat.com, linux-raid@vger.kernel.org, Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, Shaohua Li <shli@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 28 Sep 2016 15:06:05 +0200

The local variable "ret" will be set to an appropriate value in if branches.
Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/md/dm-crypt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 08e3de2..7778e9b 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -2013,7 +2013,7 @@ static void crypt_resume(struct dm_target *ti)
 static int crypt_message(struct dm_target *ti, unsigned argc, char **argv)
 {
 	struct crypt_config *cc = ti->private;
-	int ret = -EINVAL;
+	int ret;
 
 	if (argc < 2)
 		goto show_warning;
-- 
2.10.0

