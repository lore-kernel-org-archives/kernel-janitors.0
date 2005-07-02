From: Jesse Millan <jessem@cs.pdx.edu>
Date: Sat, 02 Jul 2005 00:03:02 +0000
Subject: [KJ] [PATCH] [RESEND] GCC4 audit.c warning: no return statement in
Message-Id: <42C5D9B6.3000208@cs.pdx.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------000304050608090802000802"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------000304050608090802000802
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit




--------------000304050608090802000802
Content-Type: text/x-diff; x-mac-type="0"; x-mac-creator="0";
	name="audit-patch.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="audit-patch.patch"



The function kauditd_thread() did not return an integer as the declaration
says it should. Now, the function returns an integer 'err' initialized to 0,
which was previously used for error checking but was not returned.

Signed-off-by: Jesse Millan <jessem@cs.pdx.edu>
---


diff -puN kernel/audit.c~audit-patch kernel/audit.c
--- linux-2.6.13-rc1.kj.jm.gcc4/kernel/audit.c~audit-patch	2005-07-01 15:35:29.391515688 -0700
+++ linux-2.6.13-rc1.kj.jm.gcc4-jessem/kernel/audit.c	2005-07-01 16:43:39.987650552 -0700
@@ -278,12 +278,13 @@ static int audit_set_failure(int state, 
 int kauditd_thread(void *dummy)
 {
 	struct sk_buff *skb;
+	int err = 0;
 
 	while (1) {
 		skb = skb_dequeue(&audit_skb_queue);
 		if (skb) {
 			if (audit_pid) {
-				int err = netlink_unicast(audit_sock, skb, audit_pid, 0);
+				err = netlink_unicast(audit_sock, skb, audit_pid, 0);
 				if (err < 0) {
 					BUG_ON(err != -ECONNREFUSED); /* Shoudn't happen */
 					printk(KERN_ERR "audit: *NO* daemon at audit_pid=%d\n", audit_pid);
@@ -305,6 +306,7 @@ int kauditd_thread(void *dummy)
 			remove_wait_queue(&kauditd_wait, &wait);
 		}
 	}
+	return err;
 }
 
 void audit_send_reply(int pid, int seq, int type, int done, int multi,
_


--------------000304050608090802000802
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------000304050608090802000802--
