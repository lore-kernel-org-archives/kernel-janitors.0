From: Boaz Harrosh <bharrosh@panasas.com>
Date: Sun, 27 Dec 2009 14:18:31 +0000
Subject: Re: pointless assignments
Message-Id: <4B376CB7.2050904@panasas.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20091227134148.GL6075@bicker>
In-Reply-To: <20091227134148.GL6075@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, open-osd <osd-dev@open-osd.org>, linux-scsi <linux-scsi@vger.kernel.org>

On 12/27/2009 03:41 PM, Dan Carpenter wrote:
> drivers/scsi/osd/osd_initiator.c +1435 osd_finalize_request warning: assignment to 'ret' was never used

Thanks, very good catch. Humans 0 Robots 1 ;-)

I'll queue the below patch for next Kernel. (Such an unused code path no need
rocking the bote)

Boaz
---
From: Boaz Harrosh <bharrosh@panasas.com>
Date: Sun, 27 Dec 2009 16:06:47 +0200
Subject: [PATCH] libosd: Fix unchecked err return found by smatch

Doing CHECK="smatch --two-passes gives:
drivers/scsi/osd/osd_initiator.c +1435 osd_finalize_request warning: assignment to 'ret' was never used

Which is an unchecked possible allocation failure, Fixed.

Reported-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Boaz Harrosh <bharrosh@panasas.com>
---
 drivers/scsi/osd/osd_initiator.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/scsi/osd/osd_initiator.c b/drivers/scsi/osd/osd_initiator.c
index 2422347..9334431 100644
--- a/drivers/scsi/osd/osd_initiator.c
+++ b/drivers/scsi/osd/osd_initiator.c
@@ -1433,6 +1433,10 @@ int osd_finalize_request(struct osd_request *or,
 	cdbh->command_specific_options |= or->attributes_mode;
 	if (or->attributes_mode = OSD_CDB_GET_ATTR_PAGE_SET_ONE) {
 		ret = _osd_req_finalize_attr_page(or);
+		if (ret) {
+			OSD_DEBUG("_osd_req_finalize_set_attr_list failed\n");
+			return ret;
+		}
 	} else {
 		/* TODO: I think that for the GET_ATTR command these 2 should
 		 * be reversed to keep them in execution order (for embeded
-- 
1.6.5.2

