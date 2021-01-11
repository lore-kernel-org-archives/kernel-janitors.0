From: Colin King <colin.king@canonical.com>
Date: Mon, 11 Jan 2021 09:25:55 +0000
Subject: [PATCH][next] dm integrity: fix spelling mistake "flusing" -> "flushing"
Message-Id: <20210111092555.6770-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dm_integrity_io_error error
message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/md/dm-integrity.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
index 11c7c538f7a9..44478744f191 100644
--- a/drivers/md/dm-integrity.c
+++ b/drivers/md/dm-integrity.c
@@ -1390,7 +1390,7 @@ static void flush_notify(unsigned long error, void *fr_)
 {
 	struct flush_request *fr = fr_;
 	if (unlikely(error != 0))
-		dm_integrity_io_error(fr->ic, "flusing disk cache", -EIO);
+		dm_integrity_io_error(fr->ic, "flushing disk cache", -EIO);
 	complete(&fr->comp);
 }
 
-- 
2.29.2
