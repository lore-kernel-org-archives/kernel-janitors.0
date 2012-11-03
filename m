From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 03 Nov 2012 20:30:24 +0000
Subject: [PATCH 7/8] drivers/scsi/scsi_transport_fc.c: drop if around WARN_ON
Message-Id: <1351974625-10282-8-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351974625-10282-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1351974625-10282-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E.J. Bottomley" <JBottomley@parallels.com>
Cc: kernel-janitors@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Just use WARN_ON rather than an if containing only WARN_ON(1).

A simplified version of the semantic patch that makes this transformation
is as follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e;
@@
- if (e) WARN_ON(1);
+ WARN_ON(e);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/scsi/scsi_transport_fc.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/scsi_transport_fc.c b/drivers/scsi/scsi_transport_fc.c
index e894ca7..f54c945 100644
--- a/drivers/scsi/scsi_transport_fc.c
+++ b/drivers/scsi/scsi_transport_fc.c
@@ -1699,9 +1699,8 @@ fc_stat_show(const struct device *dev, char *buf, unsigned long offset)
 	struct fc_host_statistics *stats;
 	ssize_t ret = -ENOENT;
 
-	if (offset > sizeof(struct fc_host_statistics) ||
-	    offset % sizeof(u64) != 0)
-		WARN_ON(1);
+	WARN_ON(offset > sizeof(struct fc_host_statistics) ||
+		offset % sizeof(u64) != 0);
 
 	if (i->f->get_fc_host_stats) {
 		stats = (i->f->get_fc_host_stats)(shost);

