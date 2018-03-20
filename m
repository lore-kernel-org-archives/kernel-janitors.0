From: Christoph Hellwig <hch@lst.de>
Date: Tue, 20 Mar 2018 08:42:08 +0000
Subject: Re: [PATCH 1/2] scsi: dpt_i2o: use after free in adpt_release()
Message-Id: <20180320084208.GA16215@lst.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180319103303.GA8543@mwanda>
In-Reply-To: <20180319103303.GA8543@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Mar 19, 2018 at 11:08:37PM -0400, Martin K. Petersen wrote:
> 
> Dan,
> 
> > The scsi_host_put() function frees "pHba" and then we dereference it on
> > the next line when we do "scsi_host_put(pHba->host);".
> 
> Applied to 4.17/scsi-queue, thank you.

This fix is broken!  adpt_i2o_delete_hba references pHba->host as well.

Instead we need a local variable for the host. Fix below:

---
From 701440055539c0f72a3179d85a44bd59d45a7d4b Mon Sep 17 00:00:00 2001
From: Christoph Hellwig <hch@lst.de>
Date: Tue, 20 Mar 2018 09:40:44 +0100
Subject: dpt_i2o: fix use after free in adpt_release for real

Fixes: 7bec5bed ("scsi: dpt_i2o: use after free in adpt_release()")

adpt_i2o_delete_hba still references the host.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/scsi/dpt_i2o.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/dpt_i2o.c b/drivers/scsi/dpt_i2o.c
index 0f30792d74c4..35d45903ed2e 100644
--- a/drivers/scsi/dpt_i2o.c
+++ b/drivers/scsi/dpt_i2o.c
@@ -304,10 +304,12 @@ static int adpt_detect(struct scsi_host_template* sht)
 
 static void adpt_release(adpt_hba *pHba)
 {
-	scsi_remove_host(pHba->host);
+	struct Scsi_Host *shost = pHba->host;
+
+	scsi_remove_host(shost);
 //	adpt_i2o_quiesce_hba(pHba);
-	scsi_host_put(pHba->host);
 	adpt_i2o_delete_hba(pHba);
+	scsi_host_put(shost);
 }
 
 
-- 
2.14.2

