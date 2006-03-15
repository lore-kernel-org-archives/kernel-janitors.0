From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Wed, 15 Mar 2006 12:55:03 +0000
Subject: [KJ] [PATCH] net/bluetooth: Return negative error constant
Message-Id: <20060315125503.GA1198@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============79360192308996103=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============79360192308996103==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Return negative error constant.

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

---

 net/bluetooth/bnep/core.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

--- linux-2.6.16-rc6/net/bluetooth/bnep/core.c	2006-03-13 13:01:59.000000000 +0100
+++ linux-2.6.16-rc6~error_consts/net/bluetooth/bnep/core.c	2006-03-15 13:41:28.000000000 +0100
@@ -532,8 +532,8 @@ int bnep_add_connection(struct bnep_conn
 	dev = alloc_netdev(sizeof(struct bnep_session),
 			   (*req->device) ? req->device : "bnep%d",
 			   bnep_net_setup);
-	if (!dev) 
-		return ENOMEM;
+	if (!dev)
+		return -ENOMEM;
 
 
 	down_write(&bnep_session_sem);

--===============79360192308996103==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============79360192308996103==--
