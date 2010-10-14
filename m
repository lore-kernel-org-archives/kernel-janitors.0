From: Dan Carpenter <error27@gmail.com>
Date: Thu, 14 Oct 2010 18:23:30 +0000
Subject: [patch -next] scsi_transport_fc: remove unneeded check
Message-Id: <20101014182330.GD6614@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E.J. Bottomley" <James.Bottomley@suse.de>
Cc: James Smart <james.smart@emulex.com>, Christof Schmitt <christof.schmitt@de.ibm.com>, Hannes Reinecke <hare@suse.de>, Mike Christie <michaelc@cs.wisc.edu>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

"val" can never be less than zero here.  It's unsigned and
simple_strtoul() always returns positive values.

I also cleaned up the check.  "*cp != '\0'" is more explicit than "*cp"
and I removed some parenthesis that weren't needed.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
I sent this patch some months back but didn't recieve any feedback.

diff --git a/drivers/scsi/scsi_transport_fc.c b/drivers/scsi/scsi_transport_fc.c
index 0681378..b108a9b 100644
--- a/drivers/scsi/scsi_transport_fc.c
+++ b/drivers/scsi/scsi_transport_fc.c
@@ -844,7 +844,7 @@ store_fc_rport_dev_loss_tmo(struct device *dev, struct device_attribute *attr,
 	    (rport->port_state = FC_PORTSTATE_NOTPRESENT))
 		return -EBUSY;
 	val = simple_strtoul(buf, &cp, 0);
-	if ((*cp && (*cp != '\n')) || (val < 0))
+	if (*cp != '\0' && *cp != '\n')
 		return -EINVAL;
 
 	/*

