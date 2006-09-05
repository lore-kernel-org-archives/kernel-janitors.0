From: Henne <henne@nachtwindheim.de>
Date: Tue, 05 Sep 2006 20:05:21 +0000
Subject: [KJ] New idea for TODO
Message-Id: <44FDD881.8070002@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi there,

I know that the TODO list is long, but I may have found a new task.

In drivers/scsi lies a file called scsi.h which seems to be a relict and is included in many mature scsi-drivers,
but include/scsi/scsi.h would be the better choice.
After a little surfing I think all typedef'd Scsi_Cmnd can be replaced with struct scsi_cmnd, to get rid of
that typedef stuff.

Correct me if I'm wrong.

Greets,
Henne

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
