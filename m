From: Dan Carpenter <error27@gmail.com>
Date: Fri, 08 Oct 2010 12:56:58 +0000
Subject: [patch] Staging: bcm: return -EFAULT on copy_to_user() errors
Message-Id: <20101008125658.GM11681@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101008125348.GI11681@bicker>
In-Reply-To: <20101008125348.GI11681@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

bcm/InterfaceDld.c had a couple places which returned the number of
bytes remaining instead of -EFAULT.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/bcm/InterfaceDld.c b/drivers/staging/bcm/InterfaceDld.c
index 8825b8e..60c0f29 100644
--- a/drivers/staging/bcm/InterfaceDld.c
+++ b/drivers/staging/bcm/InterfaceDld.c
@@ -167,7 +167,7 @@ static int bcm_download_config_file(PMINI_ADAPTER Adapter,
 	{
 		bcm_kfree (Adapter->pstargetparams);
 		Adapter->pstargetparams = NULL;
-		return retval;
+		return -EFAULT;
 	}
 	/* Parse the structure and then Download the Firmware */
 	beceem_parse_target_struct(Adapter);
@@ -385,6 +385,7 @@ int bcm_ioctl_fw_download(PMINI_ADAPTER Adapter, FIRMWARE_INFO *psFwInfo)
 		if(retval != STATUS_SUCCESS)
 		{
 			BCM_DEBUG_PRINT(Adapter,DBG_TYPE_INITEXIT, MP_INIT, DBG_LVL_ALL, "copying buffer from user space failed");
+			retval = -EFAULT;
 			goto error ;
 		}
 
