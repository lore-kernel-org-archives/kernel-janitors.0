From: Domen Puncer <domen@coderock.org>
Date: Thu, 19 Aug 2004 11:11:35 +0000
Subject: [Kernel-janitors] [patch 2.6.8.1] list_for_each: net-ipv6-ip6_fib.c
Message-Id: <20040819111135.GA3547@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============75959377141140072=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040819111118.GA3469@masina.coderock.org>
In-Reply-To: <20040819111118.GA3469@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============75959377141140072==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

s/for/list_for_each/
Compile tested.

Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/net/ipv6/ip6_fib.c	Sat Aug 14 10:56:44 2004
+++ list_for_each/net/ipv6/ip6_fib.c	Thu Aug 19 12:58:37 2004
@@ -99,7 +99,7 @@
 	.next	= &fib6_walker_list, 
 };
 
-#define FOR_WALKERS(w) for ((w)=fib6_walker_list.next; (w) != &fib6_walker_list; (w)=(w)->next)
+#define FOR_WALKERS(w) list_for_each((w), &fib6_walker_list)
 
 static __inline__ u32 fib6_new_sernum(void)
 {

--===============75959377141140072==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============75959377141140072==--
