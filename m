From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Wed, 03 Mar 2004 19:40:45 +0000
Subject: [Kernel-janitors] [PATCH 2/3] - De-uglification work for
Message-Id: <1078342458.14557.40.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org


switch()s.

diff -Nparu linux-2.6.4-rc1-bk2/drivers/block/floppy.c linux-2.6.4-rc1-bk2~=
/drivers/block/floppy.c
--- linux-2.6.4-rc1-bk2/drivers/block/floppy.c	2004-02-18 15:54:22.00000000=
0 -0300
+++ linux-2.6.4-rc1-bk2~/drivers/block/floppy.c	2004-03-02 17:53:39.0000000=
00 -0300
@@ -1256,20 +1256,20 @@ static inline void perpendicular_mode(vo
 	unsigned char perp_mode;
=20
 	if (raw_cmd->rate & 0x40){
-		switch(raw_cmd->rate & 3){
-			case 0:
-				perp_mode=3D2;
-				break;
-			case 3:
-				perp_mode=3D3;
-				break;
-			default:
-				DPRINT("Invalid data rate for perpendicular mode!\n");
-				cont->done(0);
-				FDCS->reset =3D 1; /* convenient way to return to
-						  * redo without to much hassle (deep
-						  * stack et al. */
-				return;
+		switch (raw_cmd->rate & 3) {
+		case 0:
+			perp_mode=3D2;
+			break;
+		case 3:
+			perp_mode=3D3;
+			break;
+		default:
+			DPRINT("Invalid data rate for perpendicular mode!\n");
+			cont->done(0);
+			FDCS->reset =3D 1; /* convenient way to return to
+					  * redo without to much hassle (deep
+					  * stack et al. */
+			return;
 		}
 	} else
 		perp_mode =3D 0;
@@ -1338,24 +1338,24 @@ static void fdc_specify(void)
 	}
=20
 	switch (raw_cmd->rate & 0x03) {
-		case 3:
-			dtr =3D 1000;
-			break;
-		case 1:
-			dtr =3D 300;
-			if (FDCS->version >=3D FDC_82078) {
-				/* chose the default rate table, not the one
-				 * where 1 =3D 2 Mbps */
-				output_byte(FD_DRIVESPEC);
-				if (need_more_output() =3D MORE_OUTPUT) {
-					output_byte(UNIT(current_drive));
-					output_byte(0xc0);
-				}
+	case 3:
+		dtr =3D 1000;
+		break;
+	case 1:
+		dtr =3D 300;
+		if (FDCS->version >=3D FDC_82078) {
+			/* chose the default rate table, not the one
+			 * where 1 =3D 2 Mbps */
+			output_byte(FD_DRIVESPEC);
+			if (need_more_output() =3D MORE_OUTPUT) {
+				output_byte(UNIT(current_drive));
+				output_byte(0xc0);
 			}
-			break;
-		case 2:
-			dtr =3D 250;
-			break;
+		}
+		break;
+	case 2:
+		dtr =3D 250;
+		break;
 	}
=20
 	if (FDCS->version >=3D FDC_82072) {
@@ -1445,62 +1445,62 @@ static int interpret_errors(void)
=20
 	/* check IC to find cause of interrupt */
 	switch (ST0 & ST0_INTR) {
-		case 0x40:	/* error occurred during command execution */
-			if (ST1 & ST1_EOC)
-				return 0; /* occurs with pseudo-DMA */
-			bad =3D 1;
-			if (ST1 & ST1_WP) {
-				DPRINT("Drive is write protected\n");
-				CLEARF(FD_DISK_WRITABLE);
-				cont->done(0);
-				bad =3D 2;
-			} else if (ST1 & ST1_ND) {
-				SETF(FD_NEED_TWADDLE);
-			} else if (ST1 & ST1_OR) {
-				if (DP->flags & FTD_MSG)
-					DPRINT("Over/Underrun - retrying\n");
-				bad =3D 0;
-			}else if (*errors >=3D DP->max_errors.reporting){
-				DPRINT("");
-				if (ST0 & ST0_ECE) {
-					printk("Recalibrate failed!");
-				} else if (ST2 & ST2_CRC) {
-					printk("data CRC error");
-					tell_sector();
-				} else if (ST1 & ST1_CRC) {
-					printk("CRC error");
-					tell_sector();
-				} else if ((ST1 & (ST1_MAM|ST1_ND)) || (ST2 & ST2_MAM)) {
-					if (!probing) {
-						printk("sector not found");
-						tell_sector();
-					} else
-						printk("probe failed...");
-				} else if (ST2 & ST2_WC) {	/* seek error */
-					printk("wrong cylinder");
-				} else if (ST2 & ST2_BC) {	/* cylinder marked as bad */
-					printk("bad cylinder");
-				} else {
-					printk("unknown error. ST[0..2] are: 0x%x 0x%x 0x%x", ST0, ST1, ST2);
+	case 0x40:	/* error occurred during command execution */
+		if (ST1 & ST1_EOC)
+			return 0; /* occurs with pseudo-DMA */
+		bad =3D 1;
+		if (ST1 & ST1_WP) {
+			DPRINT("Drive is write protected\n");
+			CLEARF(FD_DISK_WRITABLE);
+			cont->done(0);
+			bad =3D 2;
+		} else if (ST1 & ST1_ND) {
+			SETF(FD_NEED_TWADDLE);
+		} else if (ST1 & ST1_OR) {
+			if (DP->flags & FTD_MSG)
+				DPRINT("Over/Underrun - retrying\n");
+			bad =3D 0;
+		} else if (*errors >=3D DP->max_errors.reporting) {
+			DPRINT("");
+			if (ST0 & ST0_ECE) {
+				printk("Recalibrate failed!");
+			} else if (ST2 & ST2_CRC) {
+				printk("data CRC error");
+				tell_sector();
+			} else if (ST1 & ST1_CRC) {
+				printk("CRC error");
+				tell_sector();
+			} else if ((ST1 & (ST1_MAM|ST1_ND)) || (ST2 & ST2_MAM)) {
+				if (!probing) {
+					printk("sector not found");
 					tell_sector();
-				}
-				printk("\n");
-
+				} else
+					printk("probe failed...");
+			} else if (ST2 & ST2_WC) {	/* seek error */
+				printk("wrong cylinder");
+			} else if (ST2 & ST2_BC) {	/* cylinder marked as bad */
+				printk("bad cylinder");
+			} else {
+				printk("unknown error. ST[0..2] are: 0x%x 0x%x 0x%x", ST0, ST1, ST2);
+				tell_sector();
 			}
-			if (ST2 & ST2_WC || ST2 & ST2_BC)
-				/* wrong cylinder =3D> recal */
-				DRS->track =3D NEED_2_RECAL;
-			return bad;
-		case 0x80: /* invalid command given */
-			DPRINT("Invalid FDC command given!\n");
-			cont->done(0);
-			return 2;
-		case 0xc0:
-			DPRINT("Abnormal termination caused by polling\n");
-			cont->error();
-			return 2;
-		default: /* (0) Normal command termination */
-			return 0;
+			printk("\n");
+		=09
+		}
+		if (ST2 & ST2_WC || ST2 & ST2_BC)
+			/* wrong cylinder =3D> recal */
+			DRS->track =3D NEED_2_RECAL;
+		return bad;
+	case 0x80: /* invalid command given */
+		DPRINT("Invalid FDC command given!\n");
+		cont->done(0);
+		return 2;
+	case 0xc0:
+		DPRINT("Abnormal termination caused by polling\n");
+		cont->error();
+		return 2;
+	default: /* (0) Normal command termination */
+		return 0;
 	}
 }
=20
@@ -1690,49 +1690,49 @@ static void recal_interrupt(void)
 	if (inr !=3D2)
 		FDCS->reset =3D 1;
 	else if (ST0 & ST0_ECE) {
-	       	switch(DRS->track){
-			case NEED_1_RECAL:
+	       	switch (DRS->track) {
+		case NEED_1_RECAL:
 #ifdef DEBUGT
-				debugt("recal interrupt need 1 recal:");
+			debugt("recal interrupt need 1 recal:");
 #endif
-				/* after a second recalibrate, we still haven't
-				 * reached track 0. Probably no drive. Raise an
-				 * error, as failing immediately might upset
-				 * computers possessed by the Devil :-) */
-				cont->error();
-				cont->redo();
-				return;
-			case NEED_2_RECAL:
+			/* after a second recalibrate, we still haven't
+			 * reached track 0. Probably no drive. Raise an
+			 * error, as failing immediately might upset
+			 * computers possessed by the Devil :-) */
+			cont->error();
+			cont->redo();
+			return;
+		case NEED_2_RECAL:
 #ifdef DEBUGT
-				debugt("recal interrupt need 2 recal:");
+			debugt("recal interrupt need 2 recal:");
 #endif
-				/* If we already did a recalibrate,
-				 * and we are not at track 0, this
-				 * means we have moved. (The only way
-				 * not to move at recalibration is to
-				 * be already at track 0.) Clear the
-				 * new change flag */
+			/* If we already did a recalibrate,
+			 * and we are not at track 0, this
+			 * means we have moved. (The only way
+			 * not to move at recalibration is to
+			 * be already at track 0.) Clear the
+			 * new change flag */
 #ifdef DCL_DEBUG
-				if (DP->flags & FD_DEBUG){
-					DPRINT("clearing NEWCHANGE flag because of second recalibrate\n");
-				}
+			if (DP->flags & FD_DEBUG){
+				DPRINT("clearing NEWCHANGE flag because of second recalibrate\n");
+			}
 #endif
-
-				CLEARF(FD_DISK_NEWCHANGE);
-				DRS->select_date =3D jiffies;
-				/* fall through */
-			default:
+		=09
+			CLEARF(FD_DISK_NEWCHANGE);
+			DRS->select_date =3D jiffies;
+			/* fall through */
+		default:
 #ifdef DEBUGT
-				debugt("recal interrupt default:");
+			debugt("recal interrupt default:");
 #endif
-				/* Recalibrate moves the head by at
-				 * most 80 steps. If after one
-				 * recalibrate we don't have reached
-				 * track 0, this might mean that we
-				 * started beyond track 80.  Try
-				 * again.  */
-				DRS->track =3D NEED_1_RECAL;
-				break;
+			/* Recalibrate moves the head by at
+			 * most 80 steps. If after one
+			 * recalibrate we don't have reached
+			 * track 0, this might mean that we
+			 * started beyond track 80.  Try
+			 * again.  */
+			 DRS->track =3D NEED_1_RECAL;
+			 break;
 		}
 	} else
 		DRS->track =3D ST1;
@@ -2185,13 +2185,13 @@ static void set_floppy(int drive)
  */
 static void format_interrupt(void)
 {
-	switch (interpret_errors()){
-		case 1:
-			cont->error();
-		case 2:
-			break;
-		case 0:
-			cont->done(1);
+	switch (interpret_errors()) {
+	case 1:
+		cont->error();
+	case 2:
+		break;
+	case 0:
+		cont->done(1);
 	}
 	cont->redo();
 }
@@ -2422,25 +2422,25 @@ static void rw_interrupt(void)
 	INFBOUND(nr_sectors,0);
 	SUPBOUND(current_count_sectors, nr_sectors);
=20
-	switch (interpret_errors()){
-		case 2:
+	switch (interpret_errors()) {
+	case 2:
+		cont->redo();
+		return;
+	case 1:
+		if (!current_count_sectors) {
+			cont->error();
 			cont->redo();
 			return;
-		case 1:
-			if (!current_count_sectors){
-				cont->error();
-				cont->redo();
-				return;
-			}
-			break;
-		case 0:
-			if (!current_count_sectors){
-				cont->redo();
-				return;
-			}
-			current_type[current_drive] =3D _floppy;
-			floppy_sizes[TOMINOR(current_drive) ]=3D _floppy->size;
-			break;
+		}
+		break;
+	case 0:
+		if (!current_count_sectors) {
+			cont->redo();
+			return;
+		}
+		current_type[current_drive] =3D _floppy;
+		floppy_sizes[TOMINOR(current_drive) ]=3D _floppy->size;
+		break;
 	}
=20
 	if (probing) {
@@ -3487,20 +3487,20 @@ static int fd_ioctl(struct inode *inode,
 	}
=20
 	/* generic block device ioctls */
-	switch(cmd) {
-		/* the following have been inspired by the corresponding
-		 * code for other block devices. */
-		struct floppy_struct *g;
-		case HDIO_GETGEO:
-		{
-			struct hd_geometry loc;
-			ECALL(get_floppy_geometry(drive, type, &g));
-			loc.heads =3D g->head;
-			loc.sectors =3D g->sect;
-			loc.cylinders =3D g->track;
-			loc.start =3D 0;
-			return _COPYOUT(loc);
-		}
+	switch (cmd) {
+        /* the following have been inspired by the corresponding
+	 * code for other block devices. */
+	struct floppy_struct *g;
+	case HDIO_GETGEO:
+	{
+		struct hd_geometry loc;
+		ECALL(get_floppy_geometry(drive, type, &g));
+		loc.heads =3D g->head;
+		loc.sectors =3D g->sect;
+		loc.cylinders =3D g->track;
+		loc.start =3D 0;
+		return _COPYOUT(loc);
+	}
 	}
=20
 	/* convert the old style command into a new style command */
@@ -3520,111 +3520,111 @@ static int fd_ioctl(struct inode *inode,
 		ECALL(fd_copyin((void *)param, &inparam, size))
=20
 	switch (cmd) {
-		case FDEJECT:
-			if (UDRS->fd_ref !=3D 1)
-				/* somebody else has this drive open */
-				return -EBUSY;
-			LOCK_FDC(drive,1);
-
-			/* do the actual eject. Fails on
-			 * non-Sparc architectures */
-			ret=FD_eject(UNIT(drive));
+	case FDEJECT:
+		if (UDRS->fd_ref !=3D 1)
+			/* somebody else has this drive open */
+			return -EBUSY;
+		LOCK_FDC(drive,1);
=20
-			USETF(FD_DISK_CHANGED);
-			USETF(FD_VERIFY);
-			process_fd_request();
-			return ret;		=09
-		case FDCLRPRM:
-			LOCK_FDC(drive,1);
-			current_type[drive] =3D NULL;
-			floppy_sizes[drive] =3D MAX_DISK_SIZE << 1;
-			UDRS->keep_data =3D 0;
-			return invalidate_drive(inode->i_bdev);
-		case FDSETPRM:
-		case FDDEFPRM:
-			return set_geometry(cmd, & inparam.g,
-					    drive, type, inode->i_bdev);
-		case FDGETPRM:
-			ECALL(get_floppy_geometry(drive, type,=20
-						  (struct floppy_struct**)
-						  &outparam));
-			break;
+		/* do the actual eject. Fails on
+		 * non-Sparc architectures */
+		ret =3D fd_eject(UNIT(drive));
+	=09
+		USETF(FD_DISK_CHANGED);
+		USETF(FD_VERIFY);
+		process_fd_request();
+		return ret;		=09
+	case FDCLRPRM:
+		LOCK_FDC(drive,1);
+		current_type[drive] =3D NULL;
+		floppy_sizes[drive] =3D MAX_DISK_SIZE << 1;
+		UDRS->keep_data =3D 0;
+		return invalidate_drive(inode->i_bdev);
+	case FDSETPRM:
+	case FDDEFPRM:
+		return set_geometry(cmd, & inparam.g,
+				    drive, type, inode->i_bdev);
+	case FDGETPRM:
+		ECALL(get_floppy_geometry(drive, type,=20
+					  (struct floppy_struct**)
+					  &outparam));
+		break;
=20
-		case FDMSGON:
-			UDP->flags |=3D FTD_MSG;
-			return 0;
-		case FDMSGOFF:
-			UDP->flags &=3D ~FTD_MSG;
-			return 0;
+	case FDMSGON:
+		UDP->flags |=3D FTD_MSG;
+		return 0;
+	case FDMSGOFF:
+		UDP->flags &=3D ~FTD_MSG;
+		return 0;
=20
-		case FDFMTBEG:
-			LOCK_FDC(drive,1);
-			CALL(poll_drive(1, FD_RAW_NEED_DISK));
-			ret =3D UDRS->flags;
-			process_fd_request();
-			if (ret & FD_VERIFY)
-				return -ENODEV;
-			if (!(ret & FD_DISK_WRITABLE))
-				return -EROFS;
-			return 0;
-		case FDFMTTRK:
-			if (UDRS->fd_ref !=3D 1)
-				return -EBUSY;
-			return do_format(drive, &inparam.f);
+	case FDFMTBEG:
+		LOCK_FDC(drive,1);
+		CALL(poll_drive(1, FD_RAW_NEED_DISK));
+		ret =3D UDRS->flags;
+		process_fd_request();
+		if (ret & FD_VERIFY)
+			return -ENODEV;
+		if (!(ret & FD_DISK_WRITABLE))
+			return -EROFS;
+		return 0;
+	case FDFMTTRK:
+		if (UDRS->fd_ref !=3D 1)
+			return -EBUSY;
+		return do_format(drive, &inparam.f);
 		case FDFMTEND:
-		case FDFLUSH:
-			LOCK_FDC(drive,1);
-			return invalidate_drive(inode->i_bdev);
-
-		case FDSETEMSGTRESH:
-			UDP->max_errors.reporting -				(unsigned short) (param & 0x0f);
-			return 0;
+	case FDFLUSH:
+		LOCK_FDC(drive,1);
+		return invalidate_drive(inode->i_bdev);
+
+	case FDSETEMSGTRESH:
+		UDP->max_errors.reporting +			(unsigned short) (param & 0x0f);
+		return 0;
 		OUT(FDGETMAXERRS, &UDP->max_errors);
 		IN(FDSETMAXERRS, &UDP->max_errors, max_errors);
=20
-		case FDGETDRVTYP:
-			outparam =3D drive_name(type,drive);
-			SUPBOUND(size,strlen(outparam)+1);
-			break;
+	case FDGETDRVTYP:
+		outparam =3D drive_name(type,drive);
+		SUPBOUND(size,strlen(outparam)+1);
+		break;
=20
 		IN(FDSETDRVPRM, UDP, dp);
 		OUT(FDGETDRVPRM, UDP);
=20
-		case FDPOLLDRVSTAT:
-			LOCK_FDC(drive,1);
-			CALL(poll_drive(1, FD_RAW_NEED_DISK));
-			process_fd_request();
-			/* fall through */
+	case FDPOLLDRVSTAT:
+		LOCK_FDC(drive,1);
+		CALL(poll_drive(1, FD_RAW_NEED_DISK));
+		process_fd_request();
+		/* fall through */
 	       	OUT(FDGETDRVSTAT, UDRS);
=20
-		case FDRESET:
-			return user_reset_fdc(drive, (int)param, 1);
+	case FDRESET:
+		return user_reset_fdc(drive, (int)param, 1);
=20
 		OUT(FDGETFDCSTAT,UFDCS);
-
-		case FDWERRORCLR:
-			CLEARSTRUCT(UDRWE);
-			return 0;
+	=09
+	case FDWERRORCLR:
+		CLEARSTRUCT(UDRWE);
+		return 0;
 		OUT(FDWERRORGET,UDRWE);
=20
-		case FDRAWCMD:
-			if (type)
-				return -EINVAL;
-			LOCK_FDC(drive,1);
-			set_floppy(drive);
-			CALL(i =3D raw_cmd_ioctl(cmd,(void *) param));
-			process_fd_request();
-			return i;
+	case FDRAWCMD:
+		if (type)
+			return -EINVAL;
+		LOCK_FDC(drive,1);
+		set_floppy(drive);
+		CALL(i =3D raw_cmd_ioctl(cmd,(void *) param));
+		process_fd_request();
+		return i;
=20
-		case FDTWADDLE:
-			LOCK_FDC(drive,1);
-			twaddle();
-			process_fd_request();
-			return 0;
+	case FDTWADDLE:
+		LOCK_FDC(drive,1);
+		twaddle();
+		process_fd_request();
+		return 0;
=20
-		default:
-			return -EINVAL;
+	default:
+		return -EINVAL;
 	}
=20
 	if (_IOC_DIR(cmd) & _IOC_READ)
@@ -4049,23 +4049,23 @@ static char __init get_fdc_version(void)
 		return FDC_82077;	/* Revised 82077AA passes all the tests */
 	}
 	switch (reply_buffer[0] >> 5) {
-		case 0x0:
-			/* Either a 82078-1 or a 82078SL running at 5Volt */
-			printk(KERN_INFO "FDC %d is an 82078.\n",fdc);
-			return FDC_82078;
-		case 0x1:
-			printk(KERN_INFO "FDC %d is a 44pin 82078\n",fdc);
-			return FDC_82078;
-		case 0x2:
-			printk(KERN_INFO "FDC %d is a S82078B\n", fdc);
-			return FDC_S82078B;
-		case 0x3:
-			printk(KERN_INFO "FDC %d is a National Semiconductor PC87306\n", fdc);
-			return FDC_87306;
-		default:
-			printk(KERN_INFO "FDC %d init: 82078 variant with unknown PARTID=3D%d.\=
n",
-			       fdc, reply_buffer[0] >> 5);
-			return FDC_82078_UNKN;
+	case 0x0:
+		/* Either a 82078-1 or a 82078SL running at 5Volt */
+		printk(KERN_INFO "FDC %d is an 82078.\n",fdc);
+		return FDC_82078;
+	case 0x1:
+		printk(KERN_INFO "FDC %d is a 44pin 82078\n",fdc);
+		return FDC_82078;
+	case 0x2:
+		printk(KERN_INFO "FDC %d is a S82078B\n", fdc);
+		return FDC_S82078B;
+	case 0x3:
+		printk(KERN_INFO "FDC %d is a National Semiconductor PC87306\n", fdc);
+		return FDC_87306;
+	default:
+		printk(KERN_INFO "FDC %d init: 82078 variant with unknown PARTID=3D%d.\n=
",
+		       fdc, reply_buffer[0] >> 5);
+		return FDC_82078_UNKN;
 	}
 } /* get_fdc_version */
=20

--=20
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
