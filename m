From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sun, 05 Sep 2010 18:32:18 +0000
Subject: [PATCH] md: do not use ++ in rcu_dereference() argument
Message-Id: <1283711539-7123-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org
Cc: Vasiliy Kulikov <segooon@gmail.com>, Neil Brown <neilb@suse.de>, Jens Axboe <jaxboe@fusionio.com>, linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org

From: Vasiliy Kulikov <segooon@gmail.com>

rcu_dereference() is macro, so it might use its argument twice.
Argument must not has side effects.

It was found by compiler warning:
drivers/md/raid1.c: In function ‘read_balance’:
drivers/md/raid1.c:445: warning: operation on ‘new_disk’ may be undefined

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 drivers/md/raid1.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index ad83a4d..12194df 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -442,7 +442,7 @@ static int read_balance(conf_t *conf, r1bio_t *r1_bio)
 		     r1_bio->bios[new_disk] = IO_BLOCKED ||
 		     !rdev || !test_bit(In_sync, &rdev->flags)
 			     || test_bit(WriteMostly, &rdev->flags);
-		     rdev = rcu_dereference(conf->mirrors[++new_disk].rdev)) {
+		     rdev = rcu_dereference(conf->mirrors[new_disk].rdev)) {
 
 			if (rdev && test_bit(In_sync, &rdev->flags) &&
 				r1_bio->bios[new_disk] != IO_BLOCKED)
@@ -452,6 +452,7 @@ static int read_balance(conf_t *conf, r1bio_t *r1_bio)
 				new_disk = wonly_disk;
 				break;
 			}
+			new_disk++;
 		}
 		goto rb_out;
 	}
-- 
1.7.0.4

