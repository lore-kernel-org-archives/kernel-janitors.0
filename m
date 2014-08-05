From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Aug 2014 08:09:59 +0000
Subject: [patch] partitions: aix.c: off by one bug
Message-Id: <20140805080959.GA13605@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>, Philippe De Muyter <phdm@macqel.be>
Cc: Fabian Frederick <fabf@skynet.be>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The lvip[] array has "state->limit" elements so the condition here
should be >= instead of >.

Fixes: 6ceea22bbbc8 ('partitions: add aix lvm partition support files')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/block/partitions/aix.c b/block/partitions/aix.c
index 0a6ed54..f3ed7b2 100644
--- a/block/partitions/aix.c
+++ b/block/partitions/aix.c
@@ -253,7 +253,7 @@ int aix_partition(struct parsed_partitions *state)
 				continue;
 			}
 			lv_ix = be16_to_cpu(p->lv_ix) - 1;
-			if (lv_ix > state->limit) {
+			if (lv_ix >= state->limit) {
 				cur_lv_ix = -1;
 				continue;
 			}
