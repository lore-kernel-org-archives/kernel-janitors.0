From: Domen Puncer <domen@coderock.org>
Date: Fri, 16 Jan 2004 21:45:32 +0000
Subject: [Kernel-janitors]
Message-Id: <200401162245.33097.domen@coderock.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi.

To be aplied on top of CONFIG_LEDMAN patch, or you'll get -11 lines offsets.

I left one copy_*_user, because locking needs to be fixed around it too.
About that s/break/return/ in switch: at end of switch there is a "return 0".
Didn't compile test it, since it's a motorola driver.


	Domen

--- c/drivers/serial/mcfserial.c	2004-01-16 22:28:31.000000000 +0100
+++ a/drivers/serial/mcfserial.c	2004-01-16 22:40:44.000000000 +0100
@@ -880,8 +880,7 @@ static int get_serial_info(struct mcf_se
 	tmp.close_delay = info->close_delay;
 	tmp.closing_wait = info->closing_wait;
 	tmp.custom_divisor = info->custom_divisor;
-	copy_to_user(retinfo,&tmp,sizeof(*retinfo));
-	return 0;
+	return copy_to_user(retinfo,&tmp,sizeof(*retinfo)) ? -EFAULT : 0;
 }
 
 static int set_serial_info(struct mcf_serial * info,
@@ -893,7 +892,8 @@ static int set_serial_info(struct mcf_se
 
 	if (!new_info)
 		return -EFAULT;
-	copy_from_user(&new_serial,new_info,sizeof(new_serial));
+	if (copy_from_user(&new_serial,new_info,sizeof(new_serial)))
+		return -EFAULT;
 	old_info = *info;
 
 	if (!capable(CAP_SYS_ADMIN)) {
@@ -950,8 +950,7 @@ static int get_lsr_info(struct mcf_seria
 	status = (uartp[MCFUART_USR] & MCFUART_USR_TXEMPTY) ? TIOCSER_TEMT : 0;
 	local_irq_restore(flags);
 
-	put_user(status,value);
-	return 0;
+	return put_user(status,value);
 }
 
 /*
@@ -1009,79 +1008,54 @@ static int mcfrs_ioctl(struct tty_struct
 			send_break(info, arg ? arg*(HZ/10) : HZ/4);
 			return 0;
 		case TIOCGSOFTCAR:
-			error = verify_area(VERIFY_WRITE, (void *) arg,sizeof(long));
 			if (error)
-				return error;
-			put_user(C_CLOCAL(tty) ? 1 : 0,
+			error = put_user(C_CLOCAL(tty) ? 1 : 0,
 				    (unsigned long *) arg);
-			return 0;
+			return error;
 		case TIOCSSOFTCAR:
-			get_user(arg, (unsigned long *) arg);
+			if (get_user(arg, (unsigned long *) arg))
+				return -EFAULT;
 			tty->termios->c_cflag  				((tty->termios->c_cflag & ~CLOCAL) |
 				 (arg ? CLOCAL : 0));
 			return 0;
 		case TIOCGSERIAL:
-			error = verify_area(VERIFY_WRITE, (void *) arg,
-						sizeof(struct serial_struct));
-			if (error)
-				return error;
 			return get_serial_info(info,
 					       (struct serial_struct *) arg);
 		case TIOCSSERIAL:
 			return set_serial_info(info,
 					       (struct serial_struct *) arg);
 		case TIOCSERGETLSR: /* Get line status register */
-			error = verify_area(VERIFY_WRITE, (void *) arg,
-				sizeof(unsigned int));
-			if (error)
-				return error;
-			else
-			    return get_lsr_info(info, (unsigned int *) arg);
+			return get_lsr_info(info, (unsigned int *) arg);
 
 		case TIOCSERGSTRUCT:
-			error = verify_area(VERIFY_WRITE, (void *) arg,
-						sizeof(struct mcf_serial));
-			if (error)
-				return error;
-			copy_to_user((struct mcf_serial *) arg,
-				    info, sizeof(struct mcf_serial));
-			return 0;
+			if (copy_to_user((struct mcf_serial *) arg,
+				    info, sizeof(struct mcf_serial)))
+			return -EFAULT;
 			
 		case TIOCMGET:
-			if ((error = verify_area(VERIFY_WRITE, (void *) arg,
-                            sizeof(unsigned int))))
-                                return(error);
 			val = mcfrs_getsignals(info);
-			put_user(val, (unsigned int *) arg);
-			break;
+			return put_user(val, (unsigned int *) arg);
 
                 case TIOCMBIS:
-			if ((error = verify_area(VERIFY_WRITE, (void *) arg,
-                            sizeof(unsigned int))))
-				return(error);
-
-			get_user(val, (unsigned int *) arg);
+			if (get_user(val, (unsigned int *) arg))
+				return -EFAULT;
 			rts = (val & TIOCM_RTS) ? 1 : -1;
 			dtr = (val & TIOCM_DTR) ? 1 : -1;
 			mcfrs_setsignals(info, dtr, rts);
 			break;
 
                 case TIOCMBIC:
-			if ((error = verify_area(VERIFY_WRITE, (void *) arg,
-                            sizeof(unsigned int))))
-				return(error);
-			get_user(val, (unsigned int *) arg);
+			if (get_user(val, (unsigned int *) arg))
+				return -EFAULT;
 			rts = (val & TIOCM_RTS) ? 0 : -1;
 			dtr = (val & TIOCM_DTR) ? 0 : -1;
 			mcfrs_setsignals(info, dtr, rts);
 			break;
 
                 case TIOCMSET:
-			if ((error = verify_area(VERIFY_WRITE, (void *) arg,
-                            sizeof(unsigned int))))
-				return(error);
-			get_user(val, (unsigned int *) arg);
+			if (get_user(val, (unsigned int *) arg))
+				return -EFAULT;
 			rts = (val & TIOCM_RTS) ? 1 : 0;
 			dtr = (val & TIOCM_DTR) ? 1 : 0;
 			mcfrs_setsignals(info, dtr, rts);
@@ -1089,13 +1063,13 @@ static int mcfrs_ioctl(struct tty_struct
 
 #ifdef TIOCSET422
 		case TIOCSET422:
-			get_user(val, (unsigned int *) arg);
+			if (get_user(val, (unsigned int *) arg))
+				return -EFAULT;
 			mcf_setpa(MCFPP_PA11, (val ? 0 : MCFPP_PA11));
 			break;
 		case TIOCGET422:
 			val = (mcf_getpa() & MCFPP_PA11) ? 0 : 1;
-			put_user(val, (unsigned int *) arg);
-			break;
+			return put_user(val, (unsigned int *) arg);
 #endif
 
 		default:

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
