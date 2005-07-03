From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 03 Jul 2005 19:08:09 +0000
Subject: [KJ] [PATCH 2.6.13-rc1 17/17] fix sparse warnings (__nocast type)
Message-Id: <200507031908.09433.victor@cetuc.puc-rio.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_ZeDyCr6RCbmamkY"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--Boundary-00=_ZeDyCr6RCbmamkY
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Description:
	Fix the sparse warning "implicit cast to nocast type"
 
File/Subsystem: include/net/bluetooth/bluetooth.h

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>
 

--Boundary-00=_ZeDyCr6RCbmamkY
Content-Type: text/x-diff; charset="iso-8859-1"; name="net_bluetooth.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="net_bluetooth.patch"

 include/net/bluetooth/bluetooth.h |    3 ++-
 1 files changed, 2 insertions(+), 1 deletion(-)

Index: linux-2.6-git/include/net/bluetooth/bluetooth.h
===================================================================
--- linux-2.6-git.orig/include/net/bluetooth/bluetooth.h	2005-07-01 17:48:51.000000000 +0000
+++ linux-2.6-git/include/net/bluetooth/bluetooth.h	2005-07-03 18:13:37.000000000 +0000
@@ -141,7 +141,8 @@
 };
 #define bt_cb(skb) ((struct bt_skb_cb *)(skb->cb)) 
 
-static inline struct sk_buff *bt_skb_alloc(unsigned int len, int how)
+static inline struct sk_buff *bt_skb_alloc(unsigned int len,
+                                           unsigned int __nocast how)
 {
 	struct sk_buff *skb;
 

--Boundary-00=_ZeDyCr6RCbmamkY
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_ZeDyCr6RCbmamkY--
