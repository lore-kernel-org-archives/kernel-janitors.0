From: =?ISO-8859-1?Q?Daniel_Marjam=E4ki?= <daniel.marjamaki@comhem.se>
Date: Tue, 29 Nov 2005 06:02:13 +0000
Subject: [KJ] use kzalloc instead of kcalloc(1, ...) in /kernel/kprobes.c
Message-Id: <438BEEE5.6060208@comhem.se>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org



Hello!

I believe you are patching against the wrong version, my friend.

I applied the changes manually and then made a new patch:

--- a/kernel/kprobes.c	2005-11-28 07:17:58.000000000 +0100
+++ b/kernel/kprobes.c	2005-11-29 06:29:15.000000000 +0100
@@ -408,7 +408,7 @@ static inline void add_aggr_kprobe(struc
  /*
   * This is the second or subsequent kprobe at the address - handle
   * the intricacies
- * TODO: Move kcalloc outside the spin_lock
+ * TODO: Move kzalloc outside the spin_lock
   */
  static int __kprobes register_aggr_kprobe(struct kprobe *old_p,
  					  struct kprobe *p)
@@ -420,7 +420,7 @@ static int __kprobes register_aggr_kprob
  		copy_kprobe(old_p, p);
  		ret =3D add_new_kprobe(old_p, p);
  	} else {
-		ap =3D kcalloc(1, sizeof(struct kprobe), GFP_ATOMIC);
+		ap =3D kzalloc(sizeof(struct kprobe), GFP_ATOMIC);
  		if (!ap)
  			return -ENOMEM;
  		add_aggr_kprobe(ap, old_p);


The line numbers are a little different here, compared to your patch.

Regards,
Daniel Marjam=E4ki

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
