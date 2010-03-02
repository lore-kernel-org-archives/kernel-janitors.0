From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 02 Mar 2010 13:21:41 +0000
Subject: Re: bug report: sd:  off by one in sd_read_block_limits()
Message-Id: <yq1k4tu2716.fsf@sermon.lab.mkp.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100302082135.GA6218@bicker>
	<yq1tysy27ft.fsf@sermon.lab.mkp.net>
In-Reply-To: <yq1tysy27ft.fsf@sermon.lab.mkp.net> (Martin K. Petersen's
	message of "Tue, 02 Mar 2010 08:12:54 -0500")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Dan Carpenter <error27@gmail.com>, "James E.J. Bottomley" <James.Bottomley@suse.de>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

>>>>> "Martin" = Martin K Petersen <martin.petersen@oracle.com> writes:

Actually, looking closer at the VPD mechanism in e3deec09 we need to fit
the page header as well...


sd: Fix block limits VPD page length

Commit e3deec09 incorrectly assumed that the page length was limited to
32 bytes.  The B0 VPD page length is defined to be 64 bytes when the
device supports thin provisioning.

Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>

---

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 1dd4d84..72dbac7 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -1948,7 +1948,7 @@ static void sd_read_block_limits(struct scsi_disk *sdkp)
 {
 	struct request_queue *q = sdkp->disk->queue;
 	unsigned int sector_sz = sdkp->device->sector_size;
-	const int vpd_len = 32;
+	const int vpd_len = 64;
 	unsigned char *buffer = kmalloc(vpd_len, GFP_KERNEL);
 
 	if (!buffer ||
