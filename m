From: Domen Puncer <domen@coderock.org>
Date: Thu, 29 Jul 2004 11:47:12 +0000
Subject: [Kernel-janitors] [patch 2.6.8-rc2] list_for_each_entry:
Message-Id: <20040729114712.GK2294@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============75325043513874546=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040729114250.GB2294@masina.coderock.org>
In-Reply-To: <20040729114250.GB2294@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============75325043513874546==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Make code more readable with list_for_each_entry.
Compile tested.


Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/drivers/usb/host/uhci-hcd.c	Fri Jul 23 16:00:25 2004
+++ list_for_each/drivers/usb/host/uhci-hcd.c	Wed Jul 28 23:43:05 2004
@@ -330,7 +330,7 @@
 static void uhci_insert_qh(struct uhci_hcd *uhci, struct uhci_qh *skelqh, struct urb *urb)
 {
 	struct urb_priv *urbp = (struct urb_priv *)urb->hcpriv;
-	struct list_head *tmp;
+	struct urb_priv *turbp;
 	struct uhci_qh *lqh;
 
 	/* Grab the last QH */
@@ -358,12 +358,8 @@
 	 */
 	lqh->link = cpu_to_le32(urbp->qh->dma_handle) | UHCI_PTR_QH;
 	if (lqh->urbp) {
-		list_for_each (tmp, &lqh->urbp->queue_list) {
-			struct urb_priv *turbp =
-				list_entry(tmp, struct urb_priv, queue_list);
-
+		list_for_each_entry(turbp, &lqh->urbp->queue_list, queue_list)
 			turbp->qh->link = lqh->link;
-		}
 	}
 
 	list_add_tail(&urbp->qh->list, &skelqh->list);
@@ -405,18 +401,11 @@
 		pqh = list_entry(qh->list.prev, struct uhci_qh, list);
 		pqh->link = newlink;
 		if (pqh->urbp) {
-			struct list_head *head, *tmp;
-
-			head = &pqh->urbp->queue_list;
-			tmp = head->next;
-			while (head != tmp) {
-				struct urb_priv *turbp =
-					list_entry(tmp, struct urb_priv, queue_list);
-
-				tmp = tmp->next;
+			struct urb_priv *turbp;
 
+			list_for_each_entry(turbp, &pqh->urbp->queue_list,
+					queue_list)
 				turbp->qh->link = newlink;
-			}
 		}
 		wmb();
 
@@ -447,21 +436,14 @@
 static int uhci_fixup_toggle(struct urb *urb, unsigned int toggle)
 {
 	struct urb_priv *urbp = (struct urb_priv *)urb->hcpriv;
-	struct list_head *head, *tmp;
-
-	head = &urbp->td_list;
-	tmp = head->next;
-	while (head != tmp) {
-		struct uhci_td *td = list_entry(tmp, struct uhci_td, list);
-
-		tmp = tmp->next;
+	struct uhci_td *td;
 
+	list_for_each_entry(td, &urbp->td_list, list) {
 		if (toggle)
 			td->token |= cpu_to_le32(TD_TOKEN_TOGGLE);
 		else
 			td->token &= ~cpu_to_le32(TD_TOKEN_TOGGLE);
 
-
 		toggle ^= 1;
 	}
 
@@ -481,17 +463,12 @@
 
 	/* Find the first URB in the queue */
 	if (eurbp->queued) {
-		struct list_head *head = &eurbp->queue_list;
-
-		tmp = head->next;
-		while (tmp != head) {
+		list_for_each(tmp, &eurbp->queue_list) {
 			struct urb_priv *turbp =
 				list_entry(tmp, struct urb_priv, queue_list);
 
 			if (!turbp->queued)
 				break;
-
-			tmp = tmp->next;
 		}
 	} else
 		tmp = &eurbp->queue_list;
@@ -522,9 +499,7 @@
 
 static void uhci_delete_queued_urb(struct uhci_hcd *uhci, struct urb *urb)
 {
-	struct urb_priv *urbp, *nurbp;
-	struct list_head *head, *tmp;
-	struct urb_priv *purbp;
+	struct urb_priv *urbp, *nurbp, *purbp, *turbp;
 	struct uhci_td *pltd;
 	unsigned int toggle;
 
@@ -556,14 +531,7 @@
 			toggle = uhci_toggle(td_token(pltd)) ^ 1;
 		}
 
-		head = &urbp->queue_list;
-		tmp = head->next;
-		while (head != tmp) {
-			struct urb_priv *turbp;
-
-			turbp = list_entry(tmp, struct urb_priv, queue_list);
-			tmp = tmp->next;
-
+		list_for_each_entry(turbp, &urbp->queue_list, queue_list) {
 			if (!turbp->queued)
 				break;
 			toggle = uhci_fixup_toggle(turbp->urb, toggle);
@@ -637,7 +605,7 @@
 
 static void uhci_destroy_urb_priv(struct uhci_hcd *uhci, struct urb *urb)
 {
-	struct list_head *head, *tmp;
+	struct uhci_td *td, *tmp;
 	struct urb_priv *urbp;
 	unsigned int age;
 
@@ -660,13 +628,7 @@
 	if (list_empty(&uhci->td_remove_list))
 		uhci_set_next_interrupt(uhci);
 
-	head = &urbp->td_list;
-	tmp = head->next;
-	while (tmp != head) {
-		struct uhci_td *td = list_entry(tmp, struct uhci_td, list);
-
-		tmp = tmp->next;
-
+	list_for_each_entry_safe(td, tmp, &urbp->td_list, list) {
 		uhci_remove_td_from_urb(td);
 		uhci_remove_td(uhci, td);
 		list_add(&td->remove_list, &uhci->td_remove_list);
@@ -1083,21 +1045,14 @@
  */
 static int uhci_result_common(struct uhci_hcd *uhci, struct urb *urb)
 {
-	struct list_head *tmp, *head;
 	struct urb_priv *urbp = urb->hcpriv;
-	struct uhci_td *td;
+	struct uhci_td *td, *tmp;
 	unsigned int status = 0;
 	int ret = 0;
 
 	urb->actual_length = 0;
 
-	head = &urbp->td_list;
-	tmp = head->next;
-	while (tmp != head) {
-		td = list_entry(tmp, struct uhci_td, list);
-
-		tmp = tmp->next;
-
+	list_for_each_entry_safe(td, tmp, &urbp->td_list, list) {
 		status = uhci_status_bits(td_status(td));
 		if (status & TD_CTRL_ACTIVE)
 			return -EINPROGRESS;
@@ -1180,17 +1135,12 @@
 static int isochronous_find_limits(struct uhci_hcd *uhci, struct urb *urb, unsigned int *start, unsigned int *end)
 {
 	struct urb *last_urb = NULL;
-	struct list_head *tmp, *head;
+	struct urb_priv *up;
 	int ret = 0;
 
-	head = &uhci->urb_list;
-	tmp = head->next;
-	while (tmp != head) {
-		struct urb_priv *up = list_entry(tmp, struct urb_priv, urb_list);
+	list_for_each_entry(up, &uhci->urb_list, urb_list) {
 		struct urb *u = up->urb;
 
-		tmp = tmp->next;
-
 		/* look for pending URB's with identical pipe handle */
 		if ((urb->pipe == u->pipe) && (urb->dev == u->dev) &&
 		    (u->status == -EINPROGRESS) && (u != urb)) {
@@ -1276,7 +1226,7 @@
 
 static int uhci_result_isochronous(struct uhci_hcd *uhci, struct urb *urb)
 {
-	struct list_head *tmp, *head;
+	struct uhci_td *td, *tmp;
 	struct urb_priv *urbp = (struct urb_priv *)urb->hcpriv;
 	int status;
 	int i, ret = 0;
@@ -1284,14 +1234,9 @@
 	urb->actual_length = 0;
 
 	i = 0;
-	head = &urbp->td_list;
-	tmp = head->next;
-	while (tmp != head) {
-		struct uhci_td *td = list_entry(tmp, struct uhci_td, list);
+	list_for_each_entry_safe(td, tmp, &urbp->td_list, list) {
 		int actlength;
 
-		tmp = tmp->next;
-
 		if (td_status(td) & TD_CTRL_ACTIVE)
 			return -EINPROGRESS;
 
@@ -1315,20 +1260,15 @@
 
 static struct urb *uhci_find_urb_ep(struct uhci_hcd *uhci, struct urb *urb)
 {
-	struct list_head *tmp, *head;
+	struct urb_priv *up, *tmp;
 
 	/* We don't match Isoc transfers since they are special */
 	if (usb_pipeisoc(urb->pipe))
 		return NULL;
 
-	head = &uhci->urb_list;
-	tmp = head->next;
-	while (tmp != head) {
-		struct urb_priv *up = list_entry(tmp, struct urb_priv, urb_list);
+	list_for_each_entry_safe(up, tmp, &uhci->urb_list, urb_list) {
 		struct urb *u = up->urb;
 
-		tmp = tmp->next;
-
 		if (u->dev == urb->dev && u->status == -EINPROGRESS) {
 			/* For control, ignore the direction */
 			if (usb_pipecontrol(urb->pipe) &&
@@ -1478,7 +1418,7 @@
 
 static void uhci_unlink_generic(struct uhci_hcd *uhci, struct urb *urb)
 {
-	struct list_head *head, *tmp;
+	struct list_head *head, *tmp, *next;
 	struct urb_priv *urbp = (struct urb_priv *)urb->hcpriv;
 	int prevactive = 1;
 
@@ -1498,15 +1438,12 @@
 	 * for all types
 	 */
 	head = &urbp->td_list;
-	tmp = head->next;
-	while (tmp != head) {
+	list_for_each_safe(tmp, next, head) {
 		struct uhci_td *td = list_entry(tmp, struct uhci_td, list);
 
-		tmp = tmp->next;
-
 		if (!(td_status(td) & TD_CTRL_ACTIVE) &&
 		    (uhci_actual_length(td_status(td)) < uhci_expected_length(td_token(td)) ||
-		    tmp == head))
+		    next == head))
 			usb_settoggle(urb->dev, uhci_endpoint(td_token(td)),
 				uhci_packetout(td_token(td)),
 				uhci_toggle(td_token(td)) ^ 1);
@@ -1573,18 +1510,15 @@
 	 */
 
 	head = &urbp->td_list;
-	tmp = head->next;
-	while (tmp != head) {
+	list_for_each(tmp, head) {
 		struct uhci_td *td = list_entry(tmp, struct uhci_td, list);
 
-		tmp = tmp->next;
-
 		/*
 		 * Make sure we don't do the last one (since it'll have the
 		 * TERM bit set) as well as we skip every so many TD's to
 		 * make sure it doesn't hog the bandwidth
 		 */
-		if (tmp != head && (count % DEPTH_INTERVAL) == (DEPTH_INTERVAL - 1))
+		if (tmp->next != head && (count % DEPTH_INTERVAL) == (DEPTH_INTERVAL - 1))
 			td->link |= UHCI_PTR_DEPTH;
 
 		count++;
@@ -1609,7 +1543,8 @@
 {
 	struct usb_hcd *hcd = (struct usb_hcd *)ptr;
 	struct uhci_hcd *uhci = hcd_to_uhci(hcd);
-	struct list_head list, *tmp, *head;
+	struct urb_priv *up, *tmp;
+	struct list_head list;
 	unsigned long flags;
 	int called_uhci_finish_completion = 0;
 
@@ -1623,14 +1558,9 @@
 		called_uhci_finish_completion = 1;
 	}
 
-	head = &uhci->urb_list;
-	tmp = head->next;
-	while (tmp != head) {
-		struct urb_priv *up = list_entry(tmp, struct urb_priv, urb_list);
+	list_for_each_entry_safe(up, tmp, &uhci->urb_list, urb_list) {
 		struct urb *u = up->urb;
 
-		tmp = tmp->next;
-
 		spin_lock(&u->lock);
 
 		/* Check if the FSBR timed out */
@@ -1652,14 +1582,9 @@
 	if (called_uhci_finish_completion)
 		wake_up_all(&uhci->waitqh);
 
-	head = &list;
-	tmp = head->next;
-	while (tmp != head) {
-		struct urb_priv *up = list_entry(tmp, struct urb_priv, urb_list);
+	list_for_each_entry_safe(up, tmp, &list, urb_list) {
 		struct urb *u = up->urb;
 
-		tmp = tmp->next;
-
 		uhci_urb_dequeue(hcd, u);
 	}
 
@@ -1690,15 +1615,9 @@
 
 static void uhci_free_pending_qhs(struct uhci_hcd *uhci)
 {
-	struct list_head *tmp, *head;
-
-	head = &uhci->qh_remove_list;
-	tmp = head->next;
-	while (tmp != head) {
-		struct uhci_qh *qh = list_entry(tmp, struct uhci_qh, remove_list);
-
-		tmp = tmp->next;
+	struct uhci_qh *qh, *tmp;
 
+	list_for_each_entry_safe(qh, tmp, &uhci->qh_remove_list, remove_list) {
 		list_del_init(&qh->remove_list);
 
 		uhci_free_qh(uhci, qh);
@@ -1707,15 +1626,9 @@
 
 static void uhci_free_pending_tds(struct uhci_hcd *uhci)
 {
-	struct list_head *tmp, *head;
-
-	head = &uhci->td_remove_list;
-	tmp = head->next;
-	while (tmp != head) {
-		struct uhci_td *td = list_entry(tmp, struct uhci_td, remove_list);
-
-		tmp = tmp->next;
+	struct uhci_td *td, *tmp;
 
+	list_for_each_entry_safe(td, tmp, &uhci->td_remove_list, remove_list) {
 		list_del_init(&td->remove_list);
 
 		uhci_free_td(uhci, td);
@@ -1736,19 +1649,13 @@
 static void uhci_finish_completion(struct usb_hcd *hcd, struct pt_regs *regs)
 {
 	struct uhci_hcd *uhci = hcd_to_uhci(hcd);
-	struct list_head *tmp, *head;
+	struct urb_priv *urbp, *tmp;
 
-	head = &uhci->complete_list;
-	tmp = head->next;
-	while (tmp != head) {
-		struct urb_priv *urbp = list_entry(tmp, struct urb_priv, urb_list);
+	list_for_each_entry_safe(urbp, tmp, &uhci->complete_list, urb_list) {
 		struct urb *urb = urbp->urb;
 
 		list_del_init(&urbp->urb_list);
 		uhci_finish_urb(hcd, urb, regs);
-
-		head = &uhci->complete_list;
-		tmp = head->next;
 	}
 }
 
@@ -1764,7 +1671,7 @@
 	struct uhci_hcd *uhci = hcd_to_uhci(hcd);
 	unsigned long io_addr = uhci->io_addr;
 	unsigned short status;
-	struct list_head *tmp, *head;
+	struct urb_priv *urbp;
 	unsigned int age;
 
 	/*
@@ -1812,13 +1719,8 @@
 		uhci_set_next_interrupt(uhci);
 
 	/* Walk the list of pending URB's to see which ones completed */
-	head = &uhci->urb_list;
-	tmp = head->next;
-	while (tmp != head) {
-		struct urb_priv *urbp = list_entry(tmp, struct urb_priv, urb_list);
+	list_for_each_entry(urbp, &uhci->urb_list, urb_list) {
 		struct urb *urb = urbp->urb;
-
-		tmp = tmp->next;
 
 		/* Checks the status and does all of the magic necessary */
 		uhci_transfer_result(uhci, urb);

--===============75325043513874546==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============75325043513874546==--
