From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 01 Mar 2013 20:28:06 +0000
Subject: [patch] Staging: bcm: potential forever loop verifying firmware
Message-Id: <20130301202806.GB22066@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There is an ioctl() to write data to the firmware.  After the data
is written, it reads the databack from the firmware and compares
against what the user wanted to write and prints an error message
if it doesn't match.

The problem is that verify process has a forever loop if the
firmware size is not a multiple of 4.  I've fixed it by replacing
the bcm compare function with memcmp().

I have chopped out some debugging code in the process.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/bcm/InterfaceDld.c b/drivers/staging/bcm/InterfaceDld.c
index 64ea6ed..348ad75 100644
--- a/drivers/staging/bcm/InterfaceDld.c
+++ b/drivers/staging/bcm/InterfaceDld.c
@@ -205,30 +205,6 @@ static int bcm_download_config_file(struct bcm_mini_adapter *Adapter, struct bcm
 	return retval;
 }
 
-static int bcm_compare_buff_contents(unsigned char *readbackbuff, unsigned char *buff, unsigned int len)
-{
-	int retval = STATUS_SUCCESS;
-	struct bcm_mini_adapter *Adapter = GET_BCM_ADAPTER(gblpnetdev);
-	if ((len-sizeof(unsigned int)) < 4) {
-		if (memcmp(readbackbuff , buff, len))
-			retval = -EINVAL;
-	} else {
-		len -= 4;
-
-		while (len) {
-			if (*(unsigned int *)&readbackbuff[len] != *(unsigned int *)&buff[len]) {
-				BCM_DEBUG_PRINT(Adapter, DBG_TYPE_INITEXIT, MP_INIT, DBG_LVL_ALL, "Firmware Download is not proper");
-				BCM_DEBUG_PRINT(Adapter, DBG_TYPE_INITEXIT, MP_INIT, DBG_LVL_ALL, "Val from Binary %x, Val From Read Back %x ", *(unsigned int *)&buff[len], *(unsigned int*)&readbackbuff[len]);
-				BCM_DEBUG_PRINT(Adapter, DBG_TYPE_INITEXIT, MP_INIT, DBG_LVL_ALL, "len =%x!!!", len);
-				retval = -EINVAL;
-				break;
-			}
-			len -= 4;
-		}
-	}
-	return retval;
-}
-
 int bcm_ioctl_fw_download(struct bcm_mini_adapter *Adapter, struct bcm_firmware_info *psFwInfo)
 {
 	int retval = STATUS_SUCCESS;
@@ -321,9 +297,11 @@ static INT buffRdbkVerify(struct bcm_mini_adapter *Adapter, PUCHAR mappedbuffer,
 			break;
 		}
 
-		retval = bcm_compare_buff_contents(readbackbuff, mappedbuffer, len);
-		if (STATUS_SUCCESS != retval)
-			break;
+		if (memcmp(readbackbuff, mappedbuffer, len) != 0) {
+			pr_err("%s() failed.  The firmware doesn't match what was written",
+			       __func__);
+			retval = -EIO;
+		}
 
 		u32StartingAddress += len;
 		u32FirmwareLength -= len;
