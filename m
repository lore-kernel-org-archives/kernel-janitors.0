From: Amol Lad <amol@verismonetworks.com>
Date: Tue, 10 Oct 2006 06:19:52 +0000
Subject: [KJ] [PATCH 2/2] drivers/isdn/isdnloop: save_flags()/cli(),
Message-Id: <1160460472.19143.266.camel@amol.verismonetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Amol Lad <amol@verismonetworks.com>
---
 isdnloop.c |   70 ++++++++++++++++++++++++++-----------------------------------
 isdnloop.h |    1
---
diff -uprN -X linux-2.6.19-rc1-orig/Documentation/dontdiff linux-2.6.19-rc1-orig/drivers/isdn/isdnloop/isdnloop.c linux-2.6.19-rc1/drivers/isdn/isdnloop/isdnloop.c
--- linux-2.6.19-rc1-orig/drivers/isdn/isdnloop/isdnloop.c	2006-09-21 10:15:33.000000000 +0530
+++ linux-2.6.19-rc1/drivers/isdn/isdnloop/isdnloop.c	2006-10-10 11:03:23.000000000 +0530
@@ -100,12 +100,11 @@ isdnloop_pollbchan(unsigned long data)
 		isdnloop_bchan_send(card, 1);
 	if (card->flags & (ISDNLOOP_FLAGS_B1ACTIVE | ISDNLOOP_FLAGS_B2ACTIVE)) {
 		/* schedule b-channel polling again */
-		save_flags(flags);
-		cli();
+		spin_lock_irqsave(&card->isdnloop_lock, flags);
 		card->rb_timer.expires = jiffies + ISDNLOOP_TIMER_BCREAD;
 		add_timer(&card->rb_timer);
 		card->flags |= ISDNLOOP_FLAGS_RBTIMER;
-		restore_flags(flags);
+		spin_unlock_irqrestore(&card->isdnloop_lock, flags);
 	} else
 		card->flags &= ~ISDNLOOP_FLAGS_RBTIMER;
 }
@@ -281,8 +280,7 @@ isdnloop_putmsg(isdnloop_card * card, un
 {
 	ulong flags;
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&card->isdnloop_lock, flags);
 	*card->msg_buf_write++ = (c = 0xff) ? '\n' : c;
 	if (card->msg_buf_write = card->msg_buf_read) {
 		if (++card->msg_buf_read > card->msg_buf_end)
@@ -290,7 +288,7 @@ isdnloop_putmsg(isdnloop_card * card, un
 	}
 	if (card->msg_buf_write > card->msg_buf_end)
 		card->msg_buf_write = card->msg_buf;
-	restore_flags(flags);
+	spin_unlock_irqrestore(&card->isdnloop_lock, flags);
 }
 
 /*
@@ -372,21 +370,19 @@ isdnloop_polldchan(unsigned long data)
 		if (!(card->flags & ISDNLOOP_FLAGS_RBTIMER)) {
 			/* schedule b-channel polling */
 			card->flags |= ISDNLOOP_FLAGS_RBTIMER;
-			save_flags(flags);
-			cli();
+			spin_lock_irqsave(&card->isdnloop_lock, flags);
 			del_timer(&card->rb_timer);
 			card->rb_timer.function = isdnloop_pollbchan;
 			card->rb_timer.data = (unsigned long) card;
 			card->rb_timer.expires = jiffies + ISDNLOOP_TIMER_BCREAD;
 			add_timer(&card->rb_timer);
-			restore_flags(flags);
+			spin_unlock_irqrestore(&card->isdnloop_lock, flags);
 		}
 	/* schedule again */
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&card->isdnloop_lock, flags);
 	card->st_timer.expires = jiffies + ISDNLOOP_TIMER_DCREAD;
 	add_timer(&card->st_timer);
-	restore_flags(flags);
+	spin_unlock_irqrestore(&card->isdnloop_lock, flags);
 }
 
 /*
@@ -416,8 +412,7 @@ isdnloop_sendbuf(int channel, struct sk_
 			return 0;
 		if (card->sndcount[channel] > ISDNLOOP_MAX_SQUEUE)
 			return 0;
-		save_flags(flags);
-		cli();
+		spin_lock_irqsave(&card->isdnloop_lock, flags);
 		nskb = dev_alloc_skb(skb->len);
 		if (nskb) {
 			memcpy(skb_put(nskb, len), skb->data, len);
@@ -426,7 +421,7 @@ isdnloop_sendbuf(int channel, struct sk_
 		} else
 			len = 0;
 		card->sndcount[channel] += len;
-		restore_flags(flags);
+		spin_unlock_irqrestore(&card->isdnloop_lock, flags);
 	}
 	return len;
 }
@@ -576,8 +571,7 @@ isdnloop_atimeout(isdnloop_card * card, 
 	unsigned long flags;
 	char buf[60];
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&card->isdnloop_lock, flags);
 	if (card->rcard) {
 		isdnloop_fake(card->rcard[ch], "DDIS_I", card->rch[ch] + 1);
 		card->rcard[ch]->rcard[card->rch[ch]] = NULL;
@@ -587,7 +581,7 @@ isdnloop_atimeout(isdnloop_card * card, 
 	/* No user responding */
 	sprintf(buf, "CAU%s", isdnloop_unicause(card, 1, 3));
 	isdnloop_fake(card, buf, ch + 1);
-	restore_flags(flags);
+	spin_unlock_irqrestore(&card->isdnloop_lock, flags);
 }
 
 /*
@@ -622,8 +616,7 @@ isdnloop_start_ctimer(isdnloop_card * ca
 {
 	unsigned long flags;
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&card->isdnloop_lock, flags);
 	init_timer(&card->c_timer[ch]);
 	card->c_timer[ch].expires = jiffies + ISDNLOOP_TIMER_ALERTWAIT;
 	if (ch)
@@ -632,7 +625,7 @@ isdnloop_start_ctimer(isdnloop_card * ca
 		card->c_timer[ch].function = isdnloop_atimeout0;
 	card->c_timer[ch].data = (unsigned long) card;
 	add_timer(&card->c_timer[ch]);
-	restore_flags(flags);
+	spin_unlock_irqrestore(&card->isdnloop_lock, flags);
 }
 
 /*
@@ -647,10 +640,9 @@ isdnloop_kill_ctimer(isdnloop_card * car
 {
 	unsigned long flags;
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&card->isdnloop_lock, flags);
 	del_timer(&card->c_timer[ch]);
-	restore_flags(flags);
+	spin_unlock_irqrestore(&card->isdnloop_lock, flags);
 }
 
 static u_char si2bit[] @@ -706,13 +698,12 @@ isdnloop_try_call(isdnloop_card * card, 
 					}
 			}
 			if (num_match) {
-				save_flags(flags);
-				cli();
+				spin_lock_irqsave(&card->isdnloop_lock, flags);
 				/* channel idle? */
 				if (!(cc->rcard[ch])) {
 					/* Check SI */
 					if (!(si2bit[cmd->parm.setup.si1] & cc->sil[ch])) {
-						restore_flags(flags);
+						spin_unlock_irqrestore(&card->isdnloop_lock, flags);
 						return 3;
 					}
 					/* ch is idle, si and number matches */
@@ -720,10 +711,10 @@ isdnloop_try_call(isdnloop_card * card, 
 					cc->rch[ch] = lch;
 					card->rcard[lch] = cc;
 					card->rch[lch] = ch;
-					restore_flags(flags);
+					spin_unlock_irqrestore(&card->isdnloop_lock, flags);
 					return 0;
 				} else {
-					restore_flags(flags);
+					spin_unlock_irqrestore(&card->isdnloop_lock, flags);
 					/* num matches, but busy */
 					if (ch = 1)
 						return 1;
@@ -1027,8 +1018,7 @@ isdnloop_stopcard(isdnloop_card * card)
 	unsigned long flags;
 	isdn_ctrl cmd;
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&card->isdnloop_lock, flags);
 	if (card->flags & ISDNLOOP_FLAGS_RUNNING) {
 		card->flags &= ~ISDNLOOP_FLAGS_RUNNING;
 		del_timer(&card->st_timer);
@@ -1039,7 +1029,7 @@ isdnloop_stopcard(isdnloop_card * card)
 		cmd.driver = card->myid;
 		card->interface.statcallb(&cmd);
 	}
-	restore_flags(flags);
+	spin_unlock_irqrestore(&card->isdnloop_lock, flags);
 }
 
 /*
@@ -1078,18 +1068,17 @@ isdnloop_start(isdnloop_card * card, isd
 		return -EBUSY;
 	if (copy_from_user((char *) &sdef, (char *) sdefp, sizeof(sdef)))
 		return -EFAULT;
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&card->isdnloop_lock, flags);
 	switch (sdef.ptype) {
 		case ISDN_PTYPE_EURO:
 			if (isdnloop_fake(card, "DRV1.23EC-Q.931-CAPI-CNS-BASIS-20.02.96",
 					  -1)) {
-				restore_flags(flags);
+				spin_unlock_irqrestore(&card->isdnloop_lock, flags);
 				return -ENOMEM;
 			}
 			card->sil[0] = card->sil[1] = 4;
 			if (isdnloop_fake(card, "TEI OK", 0)) {
-				restore_flags(flags);
+				spin_unlock_irqrestore(&card->isdnloop_lock, flags);
 				return -ENOMEM;
 			}
 			for (i = 0; i < 3; i++)
@@ -1098,12 +1087,12 @@ isdnloop_start(isdnloop_card * card, isd
 		case ISDN_PTYPE_1TR6:
 			if (isdnloop_fake(card, "DRV1.04TC-1TR6-CAPI-CNS-BASIS-29.11.95",
 					  -1)) {
-				restore_flags(flags);
+				spin_unlock_irqrestore(&card->isdnloop_lock, flags);
 				return -ENOMEM;
 			}
 			card->sil[0] = card->sil[1] = 4;
 			if (isdnloop_fake(card, "TEI OK", 0)) {
-				restore_flags(flags);
+				spin_unlock_irqrestore(&card->isdnloop_lock, flags);
 				return -ENOMEM;
 			}
 			strcpy(card->s0num[0], sdef.num[0]);
@@ -1111,7 +1100,7 @@ isdnloop_start(isdnloop_card * card, isd
 			card->s0num[2][0] = '\0';
 			break;
 		default:
-			restore_flags(flags);
+			spin_unlock_irqrestore(&card->isdnloop_lock, flags);
 			printk(KERN_WARNING "isdnloop: Illegal D-channel protocol %d\n",
 			       sdef.ptype);
 			return -EINVAL;
@@ -1122,7 +1111,7 @@ isdnloop_start(isdnloop_card * card, isd
 	card->st_timer.data = (unsigned long) card;
 	add_timer(&card->st_timer);
 	card->flags |= ISDNLOOP_FLAGS_RUNNING;
-	restore_flags(flags);
+	spin_unlock_irqrestore(&card->isdnloop_lock, flags);
 	return 0;
 }
 
@@ -1472,6 +1461,7 @@ isdnloop_initcard(char *id)
 		skb_queue_head_init(&card->bqueue[i]);
 	}
 	skb_queue_head_init(&card->dqueue);
+	card->isdnloop_lock = SPIN_LOCK_UNLOCKED;
 	card->next = cards;
 	cards = card;
 	if (!register_isdn(&card->interface)) {
diff -uprN -X linux-2.6.19-rc1-orig/Documentation/dontdiff linux-2.6.19-rc1-orig/drivers/isdn/isdnloop/isdnloop.h linux-2.6.19-rc1/drivers/isdn/isdnloop/isdnloop.h
--- linux-2.6.19-rc1-orig/drivers/isdn/isdnloop/isdnloop.h	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.19-rc1/drivers/isdn/isdnloop/isdnloop.h	2006-10-10 10:56:04.000000000 +0530
@@ -94,6 +94,7 @@ typedef struct isdnloop_card {
 	struct sk_buff_head
 	 bqueue[ISDNLOOP_BCH];  /* B-Channel queues                 */
 	struct sk_buff_head dqueue;	/* D-Channel queue                  */
+	spinlock_t isdnloop_lock;
 } isdnloop_card;
 
 /*


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
