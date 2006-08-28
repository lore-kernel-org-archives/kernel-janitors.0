From: ville palo <ville.palo@vi64pa.net>
Date: Mon, 28 Aug 2006 17:26:57 +0000
Subject: Re: [KJ] [PATCH] Removed unreachable code and fixed one
Message-Id: <1156786017.5373.4.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1156784251.4195.7.camel@localhost.localdomain>
In-Reply-To: <1156784251.4195.7.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 2006-08-28 at 18:59 +0200, Benoit Boissinot wrote:
> You are removing the comments here, and it is useful information to
> understand the code.
> 

Yes, you are right, here's the fixed patch:


Signed-off-by: Ville Palo <ville.palo@vi64pa.net>

diff --git a/drivers/cdrom/gscd.c b/drivers/cdrom/gscd.c
index fa70824..03884df 100644
--- a/drivers/cdrom/gscd.c
+++ b/drivers/cdrom/gscd.c
@@ -266,7 +266,7 @@ repeat:
 		goto out;
 
 	if (req->cmd != READ) {
-		printk("GSCD: bad cmd %u\n", rq_data_dir(req));
+		printk("GSCD: bad cmd %lu\n", rq_data_dir(req));
 		end_request(req, 0);
 		goto repeat;
 	}
@@ -569,7 +569,6 @@ static void cmd_out(int cmd_type, char *
 							     respo_count,
 							     CD_FRAMESIZE /
 							     2);
-							return;
 						} else {
 							/* read the data to the buffer (byte) */
 
@@ -578,15 +577,13 @@ static void cmd_out(int cmd_type, char *
 							    (respo_buf,
 							     respo_count,
 							     CD_FRAMESIZE);
-							return;
 						}
 					} else {
 						/* read the info to the buffer */
 						cmd_info_in(respo_buf,
 							    respo_count);
-						return;
 					}
-
+					
 					return;
 				}
 			}
diff --git a/drivers/cdrom/isp16.c b/drivers/cdrom/isp16.c
index db0fd9a..3c1b493 100644
--- a/drivers/cdrom/isp16.c
+++ b/drivers/cdrom/isp16.c
@@ -318,7 +318,6 @@ isp16_cdi_config(int base, u_char drive_
 		printk("ISP16: dma 1 cannot be used by cdrom interface,"
 		       " due to conflict with the sound card.\n");
 		return -1;
-		break;
 	case 3:
 		dma_code = ISP16_DMA_3;
 		break;
diff --git a/drivers/cdrom/mcdx.c b/drivers/cdrom/mcdx.c
index dcd1ab6..bcff5a8 100644
--- a/drivers/cdrom/mcdx.c
+++ b/drivers/cdrom/mcdx.c
@@ -622,9 +622,6 @@ static void do_mcdx_request(request_queu
 		}
 		end_request(req, 1);
 		goto again;
-
-		xtrace(REQUEST, "end_request(1)\n");
-		end_request(req, 1);
 	}
 
 	goto again;
@@ -1710,11 +1707,8 @@ static int mcdx_tray_move(struct cdrom_d
 	if (!(stuffp->present & DOOR))
 		return -ENOSYS;
 
-	if (position)		/* 1: eject */
-		return mcdx_talk(stuffp, "\xf6", 1, NULL, 1, 5 * HZ, 3);
-	else			/* 0: close */
-		return mcdx_talk(stuffp, "\xf8", 1, NULL, 1, 5 * HZ, 3);
-	return 1;
+	/* If position is 1 then eject, otherwise close */
+	return mcdx_talk(stuffp, position ? "\xf6" : "\xf8", 1, NULL, 1, 5 * HZ, 3);
 }
 
 static int mcdx_stop(struct s_drive_stuff *stuffp, int tries)
diff --git a/drivers/cdrom/sonycd535.c b/drivers/cdrom/sonycd535.c
index 30ab562..65bdd64 100644
--- a/drivers/cdrom/sonycd535.c
+++ b/drivers/cdrom/sonycd535.c
@@ -1028,7 +1028,6 @@ sony_get_subchnl_info(void __user *arg)
 		if (copy_to_user(arg, &schi, sizeof schi))
 			return -EFAULT;
 		return 0;
-		break;
 
 	case CDROM_AUDIO_INVALID:
 	case CDROM_AUDIO_ERROR:
@@ -1083,7 +1082,6 @@ cdu_ioctl(struct inode *inode,
 			return -EIO;
 		}
 		return 0;
-		break;
 
 	case CDROMSTOP:			/* Spin down the drive */
 		cmd_buff[0] = SONY535_HOLD;
@@ -1103,7 +1101,6 @@ cdu_ioctl(struct inode *inode,
 			return -EIO;
 		}
 		return 0;
-		break;
 
 	case CDROMPAUSE:			/* Pause the drive */
 		cmd_buff[0] = SONY535_HOLD;		/* CDU-31 driver uses AUDIO_STOP, not pause */
@@ -1121,7 +1118,6 @@ cdu_ioctl(struct inode *inode,
 		cur_pos_msf[2] = last_sony_subcode->abs_msf[2];
 		sony_audio_status = CDROM_AUDIO_PAUSED;
 		return 0;
-		break;
 
 	case CDROMRESUME:			/* Start the drive after being paused */
 		set_drive_mode(SONY535_AUDIO_DRIVE_MODE, status);
@@ -1150,7 +1146,6 @@ cdu_ioctl(struct inode *inode,
 		}
 		sony_audio_status = CDROM_AUDIO_PLAY;
 		return 0;
-		break;
 
 	case CDROMPLAYMSF:			/* Play starting at the given MSF address. */
 		if (copy_from_user(params, argp, 6))
@@ -1181,7 +1176,6 @@ cdu_ioctl(struct inode *inode,
 		final_pos_msf[2] = cmd_buff[9];
 		sony_audio_status = CDROM_AUDIO_PLAY;
 		return 0;
-		break;
 
 	case CDROMREADTOCHDR:		/* Read the table of contents header */
 		{
@@ -1197,7 +1191,6 @@ cdu_ioctl(struct inode *inode,
 				return -EFAULT;
 		}
 		return 0;
-		break;
 
 	case CDROMREADTOCENTRY:	/* Read a given table of contents entry */
 		{
@@ -1240,7 +1233,6 @@ cdu_ioctl(struct inode *inode,
 				return -EFAULT;
 		}
 		return 0;
-		break;
 
 	case CDROMPLAYTRKIND:		/* Play a track.  This currently ignores index. */
 		{
@@ -1346,7 +1338,6 @@ cdu_ioctl(struct inode *inode,
 			return -EIO;
 		}
 		return 0;
-		break;
 
 	default:
 		return -EINVAL;


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
