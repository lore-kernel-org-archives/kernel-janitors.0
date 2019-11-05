From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 05 Nov 2019 21:44:21 +0000
Subject: [PATCH 2/2] CIFS: Use common error handling code in smb2_ioctl_query_info()
Message-Id: <bfd1b925-7190-ba05-aeaf-f5f3a3e3d124@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b797b2fc-1a33-7311-70d7-dd258d721a03@web.de>
In-Reply-To: <b797b2fc-1a33-7311-70d7-dd258d721a03@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-cifs@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>Ronnie Sahlberg <lsahlber@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Aurelien Aptel <aaptel@suse.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 5 Nov 2019 22:26:53 +0100

Move the same error code assignments so that such exception handling
can be better reused at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/cifs/smb2ops.c | 45 +++++++++++++++++++++++----------------------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
index fde2e6d241a8..fde912aabb20 100644
--- a/fs/cifs/smb2ops.c
+++ b/fs/cifs/smb2ops.c
@@ -1535,35 +1535,32 @@ smb2_ioctl_query_info(const unsigned int xid,
 		if (le32_to_cpu(io_rsp->OutputCount) < qi.input_buffer_length)
 			qi.input_buffer_length = le32_to_cpu(io_rsp->OutputCount);
 		if (qi.input_buffer_length > 0 &&
-		    le32_to_cpu(io_rsp->OutputOffset) + qi.input_buffer_length > rsp_iov[1].iov_len) {
-			rc = -EFAULT;
-			goto iqinf_exit;
-		}
-		if (copy_to_user(&pqi->input_buffer_length, &qi.input_buffer_length,
-				 sizeof(qi.input_buffer_length))) {
-			rc = -EFAULT;
-			goto iqinf_exit;
-		}
+		    le32_to_cpu(io_rsp->OutputOffset) + qi.input_buffer_length
+		    > rsp_iov[1].iov_len)
+			goto e_fault;
+
+		if (copy_to_user(&pqi->input_buffer_length,
+				 &qi.input_buffer_length,
+				 sizeof(qi.input_buffer_length)))
+			goto e_fault;
+
 		if (copy_to_user((void __user *)pqi + sizeof(struct smb_query_info),
 				 (const void *)io_rsp + le32_to_cpu(io_rsp->OutputOffset),
-				 qi.input_buffer_length)) {
-			rc = -EFAULT;
-			goto iqinf_exit;
-		}
+				 qi.input_buffer_length))
+			goto e_fault;
 	} else {
 		pqi = (struct smb_query_info __user *)arg;
 		qi_rsp = (struct smb2_query_info_rsp *)rsp_iov[1].iov_base;
 		if (le32_to_cpu(qi_rsp->OutputBufferLength) < qi.input_buffer_length)
 			qi.input_buffer_length = le32_to_cpu(qi_rsp->OutputBufferLength);
-		if (copy_to_user(&pqi->input_buffer_length, &qi.input_buffer_length,
-				 sizeof(qi.input_buffer_length))) {
-			rc = -EFAULT;
-			goto iqinf_exit;
-		}
-		if (copy_to_user(pqi + 1, qi_rsp->Buffer, qi.input_buffer_length)) {
-			rc = -EFAULT;
-			goto iqinf_exit;
-		}
+		if (copy_to_user(&pqi->input_buffer_length,
+				 &qi.input_buffer_length,
+				 sizeof(qi.input_buffer_length)))
+			goto e_fault;
+
+		if (copy_to_user(pqi + 1, qi_rsp->Buffer,
+				 qi.input_buffer_length))
+			goto e_fault;
 	}

  iqinf_exit:
@@ -1579,6 +1576,10 @@ smb2_ioctl_query_info(const unsigned int xid,
 	free_rsp_buf(resp_buftype[1], rsp_iov[1].iov_base);
 	free_rsp_buf(resp_buftype[2], rsp_iov[2].iov_base);
 	return rc;
+
+e_fault:
+	rc = -EFAULT;
+	goto iqinf_exit;
 }

 static ssize_t
--
2.24.0
