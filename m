From: Domen Puncer <domen@coderock.org>
Date: Thu, 29 Jul 2004 11:44:45 +0000
Subject: [Kernel-janitors] [patch 2.6.8-rc2] list_for_each_entry:
Message-Id: <20040729114445.GF2294@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1220737259587823=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040729114250.GB2294@masina.coderock.org>
In-Reply-To: <20040729114250.GB2294@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============1220737259587823==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Make code more readable with list_for_each_entry.
Compile tested.


Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/drivers/net/ppp_generic.c	Wed Jul 14 19:14:59 2004
+++ list_for_each/drivers/net/ppp_generic.c	Wed Jul 28 18:34:36 2004
@@ -1213,8 +1213,7 @@
 
 	nch = 0;
 	hdrlen = (ppp->flags & SC_MP_XSHORTSEQ)? MPHDRLEN_SSN: MPHDRLEN;
-	list = &ppp->channels;
-	while ((list = list->next) != &ppp->channels) {
+	list_for_each(list, &ppp->channels) {
 		pch = list_entry(list, struct channel, clist);
 		nch += pch->avail = (skb_queue_len(&pch->file.xq) == 0);
 		/*
@@ -1676,7 +1675,7 @@
 ppp_receive_mp_frame(struct ppp *ppp, struct sk_buff *skb, struct channel *pch)
 {
 	u32 mask, seq;
-	struct list_head *l;
+	struct channel *ch;
 	int mphdrlen = (ppp->flags & SC_MP_SHORTSEQ)? MPHDRLEN_SSN: MPHDRLEN;
 
 	if (!pskb_may_pull(skb, mphdrlen + 1) || ppp->mrru == 0)
@@ -1730,8 +1729,7 @@
 	 * The list of channels can't change because we have the receive
 	 * side of the ppp unit locked.
 	 */
-	for (l = ppp->channels.next; l != &ppp->channels; l = l->next) {
-		struct channel *ch = list_entry(l, struct channel, clist);
+	list_for_each_entry(ch, &ppp->channels, clist) {
 		if (seq_before(ch->lastseq, seq))
 			seq = ch->lastseq;
 	}
@@ -2217,10 +2215,8 @@
 find_comp_entry(int proto)
 {
 	struct compressor_entry *ce;
-	struct list_head *list = &compressor_list;
 
-	while ((list = list->next) != &compressor_list) {
-		ce = list_entry(list, struct compressor_entry, list);
+	list_for_each_entry(ce, &compressor_list, list) {
 		if (ce->comp->compress_proto == proto)
 			return ce;
 	}
@@ -2490,20 +2486,15 @@
 ppp_find_channel(int unit)
 {
 	struct channel *pch;
-	struct list_head *list;
 
-	list = &new_channels;
-	while ((list = list->next) != &new_channels) {
-		pch = list_entry(list, struct channel, list);
+	list_for_each_entry(pch, &new_channels, list) {
 		if (pch->file.index == unit) {
 			list_del(&pch->list);
 			list_add(&pch->list, &all_channels);
 			return pch;
 		}
 	}
-	list = &all_channels;
-	while ((list = list->next) != &all_channels) {
-		pch = list_entry(list, struct channel, list);
+	list_for_each_entry(pch, &all_channels, list) {
 		if (pch->file.index == unit)
 			return pch;
 	}

--===============1220737259587823==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============1220737259587823==--
