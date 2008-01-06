From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Sun, 06 Jan 2008 03:02:50 +0000
Subject: [PATCH  0/33][SCSI] Arrange for removal of 'scsi_typedefs.h'
Message-Id: <20080106030250.30002.96493.sendpatchset@thinktank.campus.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James.Bottomley@SteelEye.com
Cc: kernel-janitors@vger.kernel.org, trivial@kernel.org, linux-scsi@vger.kernel.org, Richard Knutsson <ricknu-0@student.ltu.se>

Hi all

drivers/scsi/scsi_typedefs.h is about ready to be removed, only the
'struct scsi_cmnd' typedef Scsi_Cmnd is left.
This set converts all the Scsi_Cmnd's, except in:
Changelogs
Documentation/scsi/scsi_mid_low_api.txt

So if all these gets merged, in one form or the other, we can:
un'include scsi_typedefs.h from drivers/scsi/scsi.h
fix the text in Documentation/scsi/scsi_mid_low_api.txt
(finally) remove the file in question


Left the "over 80 characters wide"-warnings alone, until requested otherwise.

Am not subscribed on linux-scsi@vger.kernel.org, so if replying, please Cc: me.

Yours,
Richard Knutsson

PS
If someone know of a tool to chain-mail patches and still be able to customize
the mail-addresses between them, please let me know.
