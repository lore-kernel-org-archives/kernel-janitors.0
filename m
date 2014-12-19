From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Fri, 19 Dec 2014 13:00:25 +0000
Subject: [PATCH v2 0/1] int to bool conversion
Message-Id: <20141219130025.GA20426@sloth>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nagalakshmi Nandigama <nagalakshmi.nandigama@avagotech.com>, Praveen Krishnamoorthy <praveen.krishnamoorthy@avagotech.com>, Sreekanth Reddy <sreekanth.reddy@avagotech.com>, Abhijit Mahajan <abhijit.mahajan@avagotech.com>, "James E.J. Bottomley" <JBottomley@parallels.com>
Cc: MPT-FusionLinux.pdl@avagotech.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The second version of this patch did not treat the cases where the use
of boolean variable was unnecessary. These cases are now treated in
a patchset that was already submitted.

It also left out the cases treated by one Dan Carpenter's patch currently
being reviewed:
http://www.spinics.net/lists/linux-kernel-janitors/msg20627.html

Quentin Lambert (1):
  [SCSI] mpt2sas: Convert non-returned local variable to boolean when
    relevant

 drivers/scsi/mpt2sas/mpt2sas_base.c      | 12 ++++++------
 drivers/scsi/mpt2sas/mpt2sas_config.c    |  5 +++--
 drivers/scsi/mpt2sas/mpt2sas_ctl.c       | 22 ++++++++++------------
 drivers/scsi/mpt2sas/mpt2sas_scsih.c     |  8 ++++----
 drivers/scsi/mpt2sas/mpt2sas_transport.c | 27 ++++++++++++++-------------
 5 files changed, 37 insertions(+), 37 deletions(-)

-- 
1.9.1

