From: Domen Puncer <domen@coderock.org>
Date: Thu, 29 Jul 2004 11:43:26 +0000
Subject: [Kernel-janitors] [patch 2.6.8-rc2] list_for_each_entry:
Message-Id: <20040729114326.GC2294@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============38946762292971804=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040729114250.GB2294@masina.coderock.org>
In-Reply-To: <20040729114250.GB2294@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============38946762292971804==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Make code more readable with list_for_each_reverse.


Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/arch/um/drivers/chan_kern.c	Wed Jun 16 07:20:21 2004
+++ list_for_each/arch/um/drivers/chan_kern.c	Wed Jul 28 18:15:01 2004
@@ -166,7 +166,6 @@
 
 void close_chan(struct list_head *chans)
 {
-	struct list_head *ele;
 	struct chan *chan;
 
 	/* Close in reverse order as open in case more than one of them
@@ -174,8 +173,7 @@
 	 * state.  Then, the first one opened will have the original state,
 	 * so it must be the last closed.
 	 */
-        for(ele = chans->prev; ele != chans; ele = ele->prev){
-                chan = list_entry(ele, struct chan, list);
+	list_for_each_entry_reverse(chan, chans, list) {
 		if(!chan->opened) continue;
 		if(chan->ops->close != NULL)
 			(*chan->ops->close)(chan->fd, chan->data);

--===============38946762292971804==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============38946762292971804==--
