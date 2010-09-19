From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 19 Sep 2010 07:36:23 +0000
Subject: [PATCH v2] staging: keucr: check kmalloc() return value
Message-Id: <20100919073621.GA5905@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1284317808-4850-1-git-send-email-segooon@gmail.com>
 <20100916193201.GC10397@kroah.com>
In-Reply-To: <20100916193201.GC10397@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <greg@kroah.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Al Cho <acho@novell.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

kmalloc() may fail, if so return error code.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 drivers/staging/keucr/init.c   |    2 ++
 drivers/staging/keucr/msscsi.c |    4 ++++
 drivers/staging/keucr/smscsi.c |    4 ++++
 3 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/drivers/staging/keucr/init.c b/drivers/staging/keucr/init.c
index 2ae129b..1934805 100644
--- a/drivers/staging/keucr/init.c
+++ b/drivers/staging/keucr/init.c
@@ -300,6 +300,8 @@ int ENE_LoadBinCode(struct us_data *us, BYTE flag)
 		return USB_STOR_TRANSPORT_GOOD;
 
 	buf = kmalloc(0x800, GFP_KERNEL);
+	if (buf = NULL)
+		return USB_STOR_TRANSPORT_ERROR;
 	switch ( flag )
 	{
 		// For SD
diff --git a/drivers/staging/keucr/msscsi.c b/drivers/staging/keucr/msscsi.c
index b908a23..ad0c5c6 100644
--- a/drivers/staging/keucr/msscsi.c
+++ b/drivers/staging/keucr/msscsi.c
@@ -168,6 +168,8 @@ int MS_SCSI_Read(struct us_data *us, struct scsi_cmnd *srb)
 		DWORD	blkno;
 
 		buf = kmalloc(blenByte, GFP_KERNEL);
+		if (buf = NULL)
+			return USB_STOR_TRANSPORT_ERROR;
 
 		result = ENE_LoadBinCode(us, MS_RW_PATTERN);
 		if (result != USB_STOR_XFER_GOOD)
@@ -271,6 +273,8 @@ int MS_SCSI_Write(struct us_data *us, struct scsi_cmnd *srb)
 		WORD	len, oldphy, newphy;
 
 		buf = kmalloc(blenByte, GFP_KERNEL);
+		if (buf = NULL)
+			return USB_STOR_TRANSPORT_ERROR;
 		usb_stor_set_xfer_buf(us, buf, blenByte, srb, FROM_XFER_BUF);
 
 		result = ENE_LoadBinCode(us, MS_RW_PATTERN);
diff --git a/drivers/staging/keucr/smscsi.c b/drivers/staging/keucr/smscsi.c
index 43e32c6..6211686 100644
--- a/drivers/staging/keucr/smscsi.c
+++ b/drivers/staging/keucr/smscsi.c
@@ -145,6 +145,8 @@ int SM_SCSI_Read(struct us_data *us, struct scsi_cmnd *srb)
 		return USB_STOR_TRANSPORT_ERROR;
 
 	buf = kmalloc(blenByte, GFP_KERNEL);
+	if (buf = NULL)
+		return USB_STOR_TRANSPORT_ERROR;
 	result = Media_D_ReadSector(us, bn, blen, buf);
 	usb_stor_set_xfer_buf(us, buf, blenByte, srb, TO_XFER_BUF);
 	kfree(buf);
@@ -175,6 +177,8 @@ int SM_SCSI_Write(struct us_data *us, struct scsi_cmnd *srb)
 		return USB_STOR_TRANSPORT_ERROR;
 
 	buf = kmalloc(blenByte, GFP_KERNEL);
+	if (buf = NULL)
+		return USB_STOR_TRANSPORT_ERROR;
 	usb_stor_set_xfer_buf(us, buf, blenByte, srb, FROM_XFER_BUF);
 	result = Media_D_CopySector(us, bn, blen, buf);
 	kfree(buf);
-- 
1.7.0.4

