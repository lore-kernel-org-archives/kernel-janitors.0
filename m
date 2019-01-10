From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 Jan 2019 13:02:30 +0000
Subject: [PATCH] [PATCH] rapidio: Potential oops in riocm_ch_listen()
Message-Id: <20190110130230.GB27017@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Porter <mporter@kernel.crashing.org>, Alexandre Bounine <alexandre.bounine@idt.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

If riocm_get_channel() fails, then we should just return -EINVAL.
Calling riocm_put_channel() will trigger a NULL dereference and
generally we should call put() if the get() didn't succeed.

Fixes: b6e8d4aa1110 ("rapidio: add RapidIO channelized messaging driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/rapidio/rio_cm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/rapidio/rio_cm.c b/drivers/rapidio/rio_cm.c
index bad0e0ea4f30..cf45829585cb 100644
--- a/drivers/rapidio/rio_cm.c
+++ b/drivers/rapidio/rio_cm.c
@@ -1215,7 +1215,9 @@ static int riocm_ch_listen(u16 ch_id)
 	riocm_debug(CHOP, "(ch_%d)", ch_id);
 
 	ch = riocm_get_channel(ch_id);
-	if (!ch || !riocm_cmp_exch(ch, RIO_CM_CHAN_BOUND, RIO_CM_LISTEN))
+	if (!ch)
+		return -EINVAL;
+	if (!riocm_cmp_exch(ch, RIO_CM_CHAN_BOUND, RIO_CM_LISTEN))
 		ret = -EINVAL;
 	riocm_put_channel(ch);
 	return ret;
-- 
2.17.1
