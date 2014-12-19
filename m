From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Fri, 19 Dec 2014 12:36:32 +0000
Subject: [PATCH v2 0/3] Minor clean up in mpt2sas
Message-Id: <20141219123632.GA20256@sloth>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: joe@perches.com
Cc: 1 Nagalakshmi Nandigama <nagalakshmi.nandigama@avagotech.com>, Praveen Krishnamoorthy <praveen.krishnamoorthy@avagotech.com>, Sreekanth Reddy <sreekanth.reddy@avagotech.com>, Abhijit Mahajan <abhijit.mahajan@avagotech.com>, "James E.J. Bottomley" <JBottomley@parallels.com>, MPT-FusionLinux.pdl@avagotech.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The version 2 of this patch fix the logic error pointed out by Joe Perches.

Quentin Lambert (3):
  [SCSI] mpt2sas: Merge two similar functions
  [SCSI] mpt2sas: Simplify the code of mpt2sas_scsih_tm_flag
  [SCSI] mpt2sas: Remove unnecessary use of a boolean variable

 drivers/scsi/mpt2sas/mpt2sas_base.c  |  6 +----
 drivers/scsi/mpt2sas/mpt2sas_scsih.c | 48 +++++++-----------------------------
 2 files changed, 10 insertions(+), 44 deletions(-)

-- 
1.9.1

