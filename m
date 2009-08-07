From: "Davidlohr Bueso A." <dave@gnu.org>
Date: Fri, 07 Aug 2009 18:39:53 +0000
Subject: [PATCH] drivers/scsi: Check NULL for kmalloc() return
Message-Id: <20090807183953.GA22286@fencepost.gnu.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

Verify that ch->dt is not NULL before using it:
ch-dt[elem] = value;

Signed-off-by: Davidlohr Bueso

---
 drivers/scsi/ch.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/scsi/ch.c b/drivers/scsi/ch.c
index 7b1633a..96cbd20 100644
--- a/drivers/scsi/ch.c
+++ b/drivers/scsi/ch.c
@@ -353,6 +353,10 @@ ch_readconfig(scsi_changer *ch)
        /* look up the devices of the data transfer elements */
        ch->dt = kmalloc(ch->counts[CHET_DT]*sizeof(struct scsi_device),
                         GFP_KERNEL);
+
+       if (!ch->dt)
+               return -ENOMEM;
+
        for (elem = 0; elem < ch->counts[CHET_DT]; elem++) {
                id  = -1;
                lun = 0;
