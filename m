From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 01 Nov 2013 10:24:10 +0000
Subject: [patch] [SCSI] mpt fusion: declare some sizes as unsigned
Message-Id: <20131101102410.GD29795@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nagalakshmi Nandigama <Nagalakshmi.Nandigama@lsi.com>
Cc: Sreekanth Reddy <Sreekanth.Reddy@lsi.com>, support@lsi.com, DL-MPTFusionLinux@lsi.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

In mptctl_do_mpt_command() we cap the upper bound of .maxSenseBytes but
we don't check for negative values:

	if (karg.maxSenseBytes > MPT_SENSE_BUFFER_SIZE)

I've fixed this by making the type unsigned and I changed the
surrounding types to match as well.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/message/fusion/mptctl.h b/drivers/message/fusion/mptctl.h
index d564cc9..9ea5a18 100644
--- a/drivers/message/fusion/mptctl.h
+++ b/drivers/message/fusion/mptctl.h
@@ -324,11 +324,11 @@ struct mpt_ioctl_command {
 	char		__user *dataInBufPtr;
 	char		__user *dataOutBufPtr;
 	char		__user *senseDataPtr;
-	int		maxReplyBytes;
-	int		dataInSize;
-	int		dataOutSize;
-	int		maxSenseBytes;
-	int		dataSgeOffset;
+	u32		maxReplyBytes;
+	u32		dataInSize;
+	u32		dataOutSize;
+	u32		maxSenseBytes;
+	u32		dataSgeOffset;
 	char		MF[1];
 };
 
@@ -343,11 +343,11 @@ struct mpt_ioctl_command32 {
 	u32	dataInBufPtr;
 	u32	dataOutBufPtr;
 	u32	senseDataPtr;
-	int	maxReplyBytes;
-	int	dataInSize;
-	int	dataOutSize;
-	int	maxSenseBytes;
-	int	dataSgeOffset;
+	u32	maxReplyBytes;
+	u32	dataInSize;
+	u32	dataOutSize;
+	u32	maxSenseBytes;
+	u32	dataSgeOffset;
 	char	MF[1];
 };
 #endif	/*}*/
