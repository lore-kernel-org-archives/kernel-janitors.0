From: Dan Carpenter <error27@gmail.com>
Date: Fri, 08 Oct 2010 12:53:48 +0000
Subject: [patch] Staging: bcm: return -EFAULT on copy_to_user() failures
Message-Id: <20101008125348.GI11681@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There were a number of places in the bcm_char_ioctl() which returned the
number of bytes remaining to be copied instead of returning -EFAULT.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/bcm/Bcmchar.c b/drivers/staging/bcm/Bcmchar.c
index 38d21eb..77fdfe2 100644
--- a/drivers/staging/bcm/Bcmchar.c
+++ b/drivers/staging/bcm/Bcmchar.c
@@ -533,6 +533,7 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 			if(Status)
 			{
 				BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0,"Failed while copying the IOBufer from user space err:%d",Status);
+				Status = -EFAULT;
 				break;
 			}
 
@@ -540,6 +541,7 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 			if(Status)
 			{
 				BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0,"Failed while copying the InputBuffer from user space err:%d",Status);
+				Status = -EFAULT;
 				break;
 			}
 			//if LED thread is running(Actively or Inactively) set it state to make inactive
@@ -574,11 +576,10 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 				Status = -EACCES;
 				break;
 			}
-			if(copy_from_user((PCHAR)&IoBuffer, argp, sizeof(IOCTL_BUFFER)))
-            {
-            	Status = -EFAULT;
-                    break;
-                }
+			if(copy_from_user((PCHAR)&IoBuffer, argp, sizeof(IOCTL_BUFFER))) {
+                        	Status = -EFAULT;
+                    		break;
+                	}
                 if(copy_from_user(&gpio_info, IoBuffer.InputBuffer, IoBuffer.InputLength))
                 {
                     Status = -EFAULT;
@@ -615,6 +616,7 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 				if(Status)
 				{
 					BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0,"Failed while copying the IOBufer from user space err:%d",Status);
+					Status = -EFAULT;
 					break;
 				}
 
@@ -622,6 +624,7 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 				if(Status)
 				{
 					BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0,"Failed while copying the IOBufer Contents from user space err:%d",Status);
+					Status = -EFAULT;
 					break;
 				}
 				if(IsReqGpioIsLedInNVM(Adapter,pgpio_multi_info[WIMAX_IDX].uiGPIOMask)= FALSE)
@@ -683,6 +686,7 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 				if(Status)
 				{
 					BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0,"Failed while copying Content to IOBufer for user space err:%d",Status);
+					Status = -EFAULT;
 					break;
 				}
 			}
@@ -704,6 +708,7 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 			if(Status)
 			{
 				BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0,"Failed while copying the IOBufer from user space err:%d",Status);
+				Status = -EFAULT;
 				break;
 			}
 
@@ -711,6 +716,7 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 			if(Status)
 			{
 				BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0,"Failed while copying the IOBufer Contents from user space err:%d",Status);
+				Status = -EFAULT;
 				break;
 			}
 
@@ -763,6 +769,7 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 			if(Status)
 			{
 				BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0,"Failed while copying Content to IOBufer for user space err:%d",Status);
+				Status = -EFAULT;
 				break;
 			}
 		}
@@ -1322,7 +1329,7 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 					if(Status)
 					{
 						BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0,"Copy From User space failed. status :%d", Status);
-						return Status;
+						return -EFAULT;
 					}
 					uiSectorSize = *((PUINT)(IoBuffer.InputBuffer)); /* FIXME: unchecked __user access */
 					if((uiSectorSize < MIN_SECTOR_SIZE) || (uiSectorSize > MAX_SECTOR_SIZE))
@@ -1334,7 +1341,7 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 						if(Status)
 						{
 								BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0,"Coping the sector size to use space failed. status:%d",Status);
-								return Status;
+								return -EFAULT;
 						}
 					}
 					else
@@ -1347,7 +1354,7 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 							if(Status)
 							{
 									BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0,"Coping the sector size to use space failed. status:%d",Status);
-									return Status;
+									return -EFAULT;
 							}
 
 						}
@@ -1383,13 +1390,14 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 				if(Status)
 				{
 					BCM_DEBUG_PRINT (Adapter, DBG_TYPE_PRINTK, 0, 0, "Copy from user failed\n");
+					Status = -EFAULT;
 					break;
 				}
 				Status = copy_from_user(&sUserDebugState,IoBuffer.InputBuffer, sizeof(USER_BCM_DBG_STATE));
 				if(Status)
 				{
 					BCM_DEBUG_PRINT (Adapter, DBG_TYPE_PRINTK, 0, 0,  "Copy of IoBuffer.InputBuffer failed");
-					return Status;
+					return -EFAULT;
 				}
 
 				BCM_DEBUG_PRINT (Adapter, DBG_TYPE_PRINTK, 0, 0, "IOCTL_BCM_SET_DEBUG: OnOff=%d Type = 0x%x ",
@@ -1448,7 +1456,7 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 				if(copy_from_user(&IoBuffer, argp, sizeof(IOCTL_BUFFER)))
 				{
 					BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0,"copy_from_user failed\n");
-                    Status = -EFAULT;
+					Status = -EFAULT;
 					break;
 				}
 				if(IOCTL_BCM_NVM_READ = cmd)
@@ -1619,7 +1627,7 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 				if(Status)
 				{
 					BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0, "Copy of IOCTL BUFFER failed");
-					return Status ;
+					return -EFAULT;
 				}
 
 				//Reading FLASH 2.x READ structure
@@ -1627,7 +1635,7 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 				if(Status)
 				{
 					BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0, "Copy of Input Buffer failed");
-					return Status ;
+					return -EFAULT;
 				}
 
 
@@ -1692,6 +1700,7 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 				 	if(Status)
 				 	{
 				 		BCM_DEBUG_PRINT(Adapter,DBG_TYPE_OTHERS, OSAL_DBG, DBG_LVL_ALL,"Copy to use failed with status :%d", Status);
+						Status = -EFAULT;
 						break;
 				 	}
 					NOB = NOB - ReadBytes;
@@ -1732,7 +1741,7 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 				if(Status)
 				{
 					BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0, "Copy of IOCTL BUFFER failed");
-					return Status;
+					return -EFAULT;
 				}
 
 				//Reading FLASH 2.x READ structure
@@ -1740,7 +1749,7 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 				if(Status)
 				{
 					BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0, "Reading of output Buffer from IOCTL buffer fails");
-					return Status;
+					return -EFAULT;
 				}
 
 				BCM_DEBUG_PRINT(Adapter,DBG_TYPE_OTHERS, OSAL_DBG, DBG_LVL_ALL,"\nsFlash2xRead.Section :%x" ,sFlash2xWrite.Section);
@@ -1807,6 +1816,7 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 				 	if(Status)
 				 	{
 				 		BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0,"Copy to user failed with status :%d", Status);
+						Status = -EFAULT;
 						break ;
 				 	}
 					BCM_DEBUG_PRINT_BUFFER(Adapter,DBG_TYPE_OTHERS, OSAL_DBG, DBG_LVL_ALL,pWriteBuff,WriteBytes);
@@ -1847,7 +1857,7 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 				if(Status)
 				{
 					BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0, "Copy of IOCTL BUFFER failed");
-					return Status;
+					return -EFAULT;
 				}
 				if(IoBuffer.OutputLength != sizeof(FLASH2X_BITMAP))
 				{
@@ -1881,7 +1891,7 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 				{
 					BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0, "copying Flash2x bitMap failed");
 					bcm_kfree(psFlash2xBitMap);
-					return Status;
+					return -EFAULT;
 				}
 				bcm_kfree(psFlash2xBitMap);
 			 }
@@ -1901,14 +1911,14 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 				if(Status)
 				{
 					BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0, "Copy of IOCTL BUFFER failed");
-					return Status;
+					return -EFAULT;
 				}
 
 				Status = copy_from_user(&eFlash2xSectionVal,IoBuffer.InputBuffer, sizeof(INT));
 				if(Status)
 				{
 					BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0, "Copy of flash section val failed");
-					return Status;
+					return -EFAULT;
 				}
 
 				down(&Adapter->NVMRdmWrmLock);
@@ -1945,13 +1955,13 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 				if(Status)
 				{
 					BCM_DEBUG_PRINT(Adapter,DBG_TYPE_OTHERS, OSAL_DBG, DBG_LVL_ALL, "Copy of IOCTL BUFFER failed");
-					return Status;
+					return -EFAULT;
 				}
 				Status = copy_from_user((PCHAR)section,(PCHAR)&IoBuffer, sizeof(INT));
 				if(Status)
 				{
 					BCM_DEBUG_PRINT(Adapter,DBG_TYPE_OTHERS, OSAL_DBG, DBG_LVL_ALL, "Copy of section type failed failed");
-					return Status;
+					return -EFAULT;
 				}
 				BCM_DEBUG_PRINT(Adapter,DBG_TYPE_OTHERS, OSAL_DBG, DBG_LVL_ALL,"Read Section :%d", section);
 			 	if(section = DSD)
@@ -1979,14 +1989,14 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 				if(Status)
 				{
 					BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0, "Copy of IOCTL BUFFER failed Status :%d", Status);
-					return Status;
+					return -EFAULT;
 				}
 
 				Status = copy_from_user(&sCopySectStrut,IoBuffer.InputBuffer, sizeof(FLASH2X_COPY_SECTION));
 				if(Status)
 				{
 					BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0, "Copy of Copy_Section_Struct failed with Status :%d", Status);
-					return Status;
+					return -EFAULT;
 				}
 				BCM_DEBUG_PRINT(Adapter,DBG_TYPE_OTHERS, OSAL_DBG, DBG_LVL_ALL, "Source SEction :%x", sCopySectStrut.SrcSection);
 				BCM_DEBUG_PRINT(Adapter,DBG_TYPE_OTHERS, OSAL_DBG, DBG_LVL_ALL, "Destination SEction :%x", sCopySectStrut.DstSection);
@@ -2057,6 +2067,7 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 				if(Status)
 				{
 					BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0, "Copy of IOCTL BUFFER failed");
+					Status = -EFAULT;
 					break;
 				}
 				if(Adapter->eNVMType != NVM_FLASH)
@@ -2079,6 +2090,7 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 					if(Status)
 					{
 						BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0, "copying Flash2x cs info failed");
+						Status = -EFAULT;
 						break;
 					}
 				}
@@ -2094,6 +2106,7 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 					if(Status)
 					{
 						BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0, "copying Flash CS info failed");
+						Status = -EFAULT;
 						break;
 					}
 
@@ -2117,13 +2130,13 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 				if(Status)
 				{
 					BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0, "Copy of IOCTL BUFFER failed");
-					return Status;
+					return -EFAULT;
 				}
 				Status = copy_from_user(&eFlash2xSectionVal,IoBuffer.InputBuffer, sizeof(INT));
 				if(Status)
 				{
 					BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0, "Copy of flash section val failed");
-					return Status;
+					return -EFAULT;
 				}
 
 				BCM_DEBUG_PRINT(Adapter,DBG_TYPE_OTHERS, OSAL_DBG, DBG_LVL_ALL,"Read Section :%d", eFlash2xSectionVal);
@@ -2234,6 +2247,7 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 				 	if(Status)
 				 	{
 				 		BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0,"Copy to use failed with status :%d", Status);
+						Status = -EFAULT;
 						break;
 				 	}
 					NOB = NOB - ReadBytes;
@@ -2259,6 +2273,7 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 				if(Status)
 				{
 					BCM_DEBUG_PRINT(Adapter,DBG_TYPE_OTHERS, OSAL_DBG, DBG_LVL_ALL,"copy of Ioctl buffer is failed from user space");
+					Status = -EFAULT;
 					break;
 				}
 
@@ -2266,6 +2281,7 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 				if(Status)
 				{
 					BCM_DEBUG_PRINT(Adapter,DBG_TYPE_OTHERS, OSAL_DBG, DBG_LVL_ALL,"copy of control bit mask failed from user space");
+					Status = -EFAULT;
 					break;
 				}
 				BCM_DEBUG_PRINT(Adapter,DBG_TYPE_OTHERS, OSAL_DBG, DBG_LVL_ALL,"\n Got user defined cntrl msg bit mask :%lx", RxCntrlMsgBitMask);
@@ -2288,6 +2304,7 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 				if(Status)
 				{
 					BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0, "Copy of IOCTL BUFFER failed");
+					Status = -EFAULT;
 					break;
 				}
 				if(IoBuffer.OutputLength < sizeof(DevInfo))
@@ -2301,6 +2318,7 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 				if(Status)
 				{
 					BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0,"copying Dev info structure to user space buffer failed");
+					Status = -EFAULT;
 					break;
 				}
 			}
@@ -2317,6 +2335,7 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 				if(Status)
 				{
 					BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0, "Copy of IOCTL BUFFER failed");
+					Status = -EFAULT;
 					break;
 				}
 				if(IoBuffer.OutputLength < sizeof(ST_TIME_ELAPSED))
@@ -2334,6 +2353,7 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 				if(Status)
 				{
 					BCM_DEBUG_PRINT(Adapter,DBG_TYPE_PRINTK, 0, 0,"copying ST_TIME_ELAPSED structure to user space buffer failed");
+					Status = -EFAULT;
 					break;
 				}
 
