From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Wed, 11 Mar 2015 14:04:33 +0000
Subject: [PATCH 2/3] Staging: dgnc: Use goto for error handling
Message-Id: <20150311140433.GA17051@sloth>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lidza Louina <lidza.louina@gmail.com>, Mark Hounschell <markh@compro.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, driverdev-devel@linuxdriverproject.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

This patch introduces goto statments for error handling
and in cases where a lock needs to be released.

A simplified version of the semantic patch that finds this problem is as
follows: (http://coccinelle.lip6.fr)

@candidates exists@
identifier f, label;
statement s;
position p1, p2, p3;
@@

  f@p1(...) {
  ...when any

    if@p2(...) {
    ...when any
      s

      return@p3 ...;
    }
  ...when any
  }

@good1 exists@
identifier candidates.f, candidates.label;
statement candidates.s;
position candidates.p1, candidates.p2;
@@

  f@p1(...) {
  ...when any

    if(...) {
    ...when any
      s
      return ...;
    }
    ...when any

    if@p2(...) {...}
  ...when any
 }

@depends on good1@
identifier candidates.f, candidates.label;
position candidates.p1, candidates.p3;
@@

   f@p1(...) {
   ...when any
*  return@p3 ...;
  }

Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>
---
 drivers/staging/dgnc/dgnc_cls.c    | 19 +++++++------------
 drivers/staging/dgnc/dgnc_driver.c | 14 +++-----------
 drivers/staging/dgnc/dgnc_neo.c    | 30 ++++++++++++------------------
 3 files changed, 22 insertions(+), 41 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_cls.c b/drivers/staging/dgnc/dgnc_cls.c
index bedc522..02f19f1 100644
--- a/drivers/staging/dgnc/dgnc_cls.c
+++ b/drivers/staging/dgnc/dgnc_cls.c
@@ -1029,22 +1029,16 @@ static void cls_copy_data_from_queue_to_uart(struct channel_t *ch)
 	spin_lock_irqsave(&ch->ch_lock, flags);
 
 	/* No data to write to the UART */
-	if (ch->ch_w_tail = ch->ch_w_head) {
-		spin_unlock_irqrestore(&ch->ch_lock, flags);
-		return;
-	}
+	if (ch->ch_w_tail = ch->ch_w_head)
+		goto exit_unlock;
 
 	/* If port is "stopped", don't send any data to the UART */
 	if ((ch->ch_flags & CH_FORCED_STOP) ||
-				 (ch->ch_flags & CH_BREAK_SENDING)) {
-		spin_unlock_irqrestore(&ch->ch_lock, flags);
-		return;
-	}
+				 (ch->ch_flags & CH_BREAK_SENDING))
+		goto exit_unlock;
 
-	if (!(ch->ch_flags & (CH_TX_FIFO_EMPTY | CH_TX_FIFO_LWM))) {
-		spin_unlock_irqrestore(&ch->ch_lock, flags);
-		return;
-	}
+	if (!(ch->ch_flags & (CH_TX_FIFO_EMPTY | CH_TX_FIFO_LWM)))
+		goto exit_unlock;
 
 	n = 32;
 
@@ -1094,6 +1088,7 @@ static void cls_copy_data_from_queue_to_uart(struct channel_t *ch)
 	if (len_written > 0)
 		ch->ch_flags &= ~(CH_TX_FIFO_EMPTY | CH_TX_FIFO_LWM);
 
+exit_unlock:
 	spin_unlock_irqrestore(&ch->ch_lock, flags);
 }
 
diff --git a/drivers/staging/dgnc/dgnc_driver.c b/drivers/staging/dgnc/dgnc_driver.c
index b7fd2bf..9387a0e 100644
--- a/drivers/staging/dgnc/dgnc_driver.c
+++ b/drivers/staging/dgnc/dgnc_driver.c
@@ -572,30 +572,19 @@ static int dgnc_found_board(struct pci_dev *pdev, int id)
 
 	rc = dgnc_tty_register(brd);
 	if (rc < 0) {
-		dgnc_tty_uninit(brd);
 		pr_err(DRVSTR ": Can't register tty devices (%d)\n", rc);
-		brd->state = BOARD_FAILED;
-		brd->dpastatus = BD_NOFEP;
 		goto failed;
 	}
 
 	rc = dgnc_finalize_board_init(brd);
 	if (rc < 0) {
-		dgnc_tty_uninit(brd);
 		pr_err(DRVSTR ": Can't finalize board init (%d)\n", rc);
-		brd->state = BOARD_FAILED;
-		brd->dpastatus = BD_NOFEP;
-
 		goto failed;
 	}
 
 	rc = dgnc_tty_init(brd);
 	if (rc < 0) {
-		dgnc_tty_uninit(brd);
 		pr_err(DRVSTR ": Can't init tty devices (%d)\n", rc);
-		brd->state = BOARD_FAILED;
-		brd->dpastatus = BD_NOFEP;
-
 		goto failed;
 	}
 
@@ -629,6 +618,9 @@ static int dgnc_found_board(struct pci_dev *pdev, int id)
 	return 0;
 
 failed:
+	dgnc_tty_uninit(brd);
+	brd->state = BOARD_FAILED;
+	brd->dpastatus = BD_NOFEP;
 
 	return -ENXIO;
 
diff --git a/drivers/staging/dgnc/dgnc_neo.c b/drivers/staging/dgnc/dgnc_neo.c
index 1268aa9..4deae2d 100644
--- a/drivers/staging/dgnc/dgnc_neo.c
+++ b/drivers/staging/dgnc/dgnc_neo.c
@@ -1436,16 +1436,13 @@ static void neo_copy_data_from_queue_to_uart(struct channel_t *ch)
 	spin_lock_irqsave(&ch->ch_lock, flags);
 
 	/* No data to write to the UART */
-	if (ch->ch_w_tail = ch->ch_w_head) {
-		spin_unlock_irqrestore(&ch->ch_lock, flags);
-		return;
-	}
+	if (ch->ch_w_tail = ch->ch_w_head)
+		goto exit_unlock;
 
 	/* If port is "stopped", don't send any data to the UART */
-	if ((ch->ch_flags & CH_FORCED_STOP) || (ch->ch_flags & CH_BREAK_SENDING)) {
-		spin_unlock_irqrestore(&ch->ch_lock, flags);
-		return;
-	}
+	if ((ch->ch_flags & CH_FORCED_STOP) ||
+		 (ch->ch_flags & CH_BREAK_SENDING))
+		goto exit_unlock;
 
 	/*
 	 * If FIFOs are disabled. Send data directly to txrx register
@@ -1486,27 +1483,23 @@ static void neo_copy_data_from_queue_to_uart(struct channel_t *ch)
 			ch->ch_w_tail &= WQUEUEMASK;
 			ch->ch_txcount++;
 		}
-		spin_unlock_irqrestore(&ch->ch_lock, flags);
-		return;
+
+		goto exit_unlock;
 	}
 
 	/*
 	 * We have to do it this way, because of the EXAR TXFIFO count bug.
 	 */
 	if ((ch->ch_bd->dvid & 0xf0) < UART_XR17E158_DVID) {
-		if (!(ch->ch_flags & (CH_TX_FIFO_EMPTY | CH_TX_FIFO_LWM))) {
-			spin_unlock_irqrestore(&ch->ch_lock, flags);
-			return;
-		}
+		if (!(ch->ch_flags & (CH_TX_FIFO_EMPTY | CH_TX_FIFO_LWM)))
+			goto exit_unlock;
 
 		len_written = 0;
 
 		n = readb(&ch->ch_neo_uart->tfifo);
 
-		if ((unsigned int) n > ch->ch_t_tlevel) {
-			spin_unlock_irqrestore(&ch->ch_lock, flags);
-			return;
-		}
+		if ((unsigned int) n > ch->ch_t_tlevel)
+			goto exit_unlock;
 
 		n = UART_17158_TX_FIFOSIZE - ch->ch_t_tlevel;
 	} else {
@@ -1570,6 +1563,7 @@ static void neo_copy_data_from_queue_to_uart(struct channel_t *ch)
 		ch->ch_flags &= ~(CH_TX_FIFO_EMPTY | CH_TX_FIFO_LWM);
 	}
 
+exit_unlock:
 	spin_unlock_irqrestore(&ch->ch_lock, flags);
 }
 
-- 
1.9.1

