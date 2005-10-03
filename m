From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Mon, 03 Oct 2005 05:42:35 +0000
Subject: [KJ] [PATCH 12/13] selinux: fix gfp flags type
Message-Id: <20051002224235.7e3e4dc2.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============89597926806719164=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============89597926806719164==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

From: Randy Dunlap <rdunlap@xenotime.net>

Fix implicit nocast warnings in selinux/hooks code:
security/selinux/hooks.c:272:32: warning: implicit cast to nocast type

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
---

 include/linux/security.h |    2 +-
 security/selinux/hooks.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff -Naurp linux-2614-rc2-git6/include/linux/security.h~security_gfpmask linux-2614-rc2-git6/include/linux/security.h
--- linux-2614-rc2-git6/include/linux/security.h~security_gfpmask	2005-09-27 21:36:13.000000000 -0700
+++ linux-2614-rc2-git6/include/linux/security.h	2005-10-02 16:19:44.000000000 -0700
@@ -1210,7 +1210,7 @@ struct security_operations {
 	int (*socket_shutdown) (struct socket * sock, int how);
 	int (*socket_sock_rcv_skb) (struct sock * sk, struct sk_buff * skb);
 	int (*socket_getpeersec) (struct socket *sock, char __user *optval, int __user *optlen, unsigned len);
-	int (*sk_alloc_security) (struct sock *sk, int family, int priority);
+	int (*sk_alloc_security) (struct sock *sk, int family, unsigned int priority);
 	void (*sk_free_security) (struct sock *sk);
 #endif	/* CONFIG_SECURITY_NETWORK */
 };
diff -Naurp linux-2614-rc2-git6/security/selinux/hooks.c~security_gfpmask linux-2614-rc2-git6/security/selinux/hooks.c
--- linux-2614-rc2-git6/security/selinux/hooks.c~security_gfpmask	2005-09-27 21:36:14.000000000 -0700
+++ linux-2614-rc2-git6/security/selinux/hooks.c	2005-10-02 20:30:02.000000000 -0700
@@ -262,7 +262,7 @@ static void superblock_free_security(str
 }
 
 #ifdef CONFIG_SECURITY_NETWORK
-static int sk_alloc_security(struct sock *sk, int family, int priority)
+static int sk_alloc_security(struct sock *sk, int family, unsigned int priority)
 {
 	struct sk_security_struct *ssec;
 

--===============89597926806719164==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============89597926806719164==--
