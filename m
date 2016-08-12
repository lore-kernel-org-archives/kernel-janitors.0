From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Fri, 12 Aug 2016 12:58:35 +0000
Subject: [PATCH 2/2] staging: rts5208/ms.c: add missing releases in mg_get_local_EKB and mg_get_ICV
Message-Id: <20160812125835.2324-3-lambert.quentin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160812125835.2324-1-lambert.quentin@gmail.com>
In-Reply-To: <20160812125835.2324-1-lambert.quentin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Quentin Lambert <lambert.quentin@gmail.com>

mg_get_local_EKB and mg_get_ICV used to return with an error code before
releasing all resources. This patch add a jump to the appropriate label
ensuring that the resources are properly released before returning.

This issue was found with Hector.

Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>
---
 drivers/staging/rts5208/ms.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

--- a/drivers/staging/rts5208/ms.c
+++ b/drivers/staging/rts5208/ms.c
@@ -4328,7 +4328,8 @@ int mg_get_local_EKB(struct scsi_cmnd *s
 		set_sense_type(chip, lun, SENSE_TYPE_MG_KEY_FAIL_NOT_AUTHEN);
 		rtsx_clear_ms_error(chip);
 		rtsx_trace(chip);
-		return STATUS_FAIL;
+		retval = STATUS_FAIL;
+		goto free_buffer;
 	}
 
 	bufflen = min_t(int, 1052, scsi_bufflen(srb));
@@ -4581,7 +4582,8 @@ int mg_get_ICV(struct scsi_cmnd *srb, st
 		set_sense_type(chip, lun, SENSE_TYPE_MEDIA_UNRECOVER_READ_ERR);
 		rtsx_clear_ms_error(chip);
 		rtsx_trace(chip);
-		return STATUS_FAIL;
+		retval = STATUS_FAIL;
+		goto free_buffer;
 	}
 
 	bufflen = min_t(int, 1028, scsi_bufflen(srb));
