From: Domen Puncer <domen@coderock.org>
Date: Thu, 29 Jul 2004 11:46:46 +0000
Subject: [Kernel-janitors] [patch 2.6.8-rc2] list_for_each_entry:
Message-Id: <20040729114646.GJ2294@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============55364017614662497=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040729114250.GB2294@masina.coderock.org>
In-Reply-To: <20040729114250.GB2294@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============55364017614662497==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Make code more readable with list_for_each_entry_safe.
(Is this a non i386? I can't compile it.)


Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/drivers/usb/host/hc_sl811.c	Wed Jun 16 07:19:43 2004
+++ list_for_each/drivers/usb/host/hc_sl811.c	Wed Jul 28 18:53:01 2004
@@ -1343,15 +1343,11 @@
  *****************************************************************/
 static void __exit hci_hcd_cleanup (void)
 {
-	struct list_head *hci_l;
-	hci_t *hci;
+	hci_t *hci, *tmp;
 
 	DBGFUNC ("Enter hci_hcd_cleanup\n");
-	for (hci_l = hci_hcd_list.next; hci_l != &hci_hcd_list;) {
-		hci = list_entry (hci_l, hci_t, hci_hcd_list);
-		hci_l = hci_l->next;
+	list_for_each_entry_safe(hci, tmp, &hci_hcd_list, hci_hcd_list)
 		hc_release_hci (hci);
-	}
 }
 
 module_init (hci_hcd_init);

--===============55364017614662497==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============55364017614662497==--
