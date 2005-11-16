From: Nicolas Kaiser <nikai@nikai.net>
Date: Wed, 16 Nov 2005 23:52:43 +0000
Subject: [KJ] [PATCH] netfilter_ipv4: remove ARRAY_SIZE duplicate
Message-Id: <20051117005243.4b6b29ff@lucky.kitzblitz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============9504758634458117=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============9504758634458117==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Remove ARRAY_SIZE duplicate

Signed-off-by: Nicolas Kaiser <nikai@nikai.net>

---

--- linux.orig/include/linux/netfilter_ipv4/ipt_sctp.h	2005-10-02 15:53:52.000000000 +0200
+++ linux/include/linux/netfilter_ipv4/ipt_sctp.h	2005-11-17 00:23:59.000000000 +0100
@@ -7,8 +7,6 @@
 
 #define IPT_SCTP_VALID_FLAGS		0x07
 
-#define ELEMCOUNT(x) (sizeof(x)/sizeof(x[0]))
-
 
 struct ipt_sctp_flag_info {
 	u_int8_t chunktype;
@@ -59,21 +57,21 @@ struct ipt_sctp_info {
 #define SCTP_CHUNKMAP_RESET(chunkmap) 				\
 	do {							\
 		int i; 						\
-		for (i = 0; i < ELEMCOUNT(chunkmap); i++)	\
+		for (i = 0; i < ARRAY_SIZE(chunkmap); i++)	\
 			chunkmap[i] = 0;			\
 	} while (0)
 
 #define SCTP_CHUNKMAP_SET_ALL(chunkmap) 			\
 	do {							\
 		int i; 						\
-		for (i = 0; i < ELEMCOUNT(chunkmap); i++) 	\
+		for (i = 0; i < ARRAY_SIZE(chunkmap); i++)	\
 			chunkmap[i] = ~0;			\
 	} while (0)
 
 #define SCTP_CHUNKMAP_COPY(destmap, srcmap) 			\
 	do {							\
 		int i; 						\
-		for (i = 0; i < ELEMCOUNT(chunkmap); i++) 	\
+		for (i = 0; i < ARRAY_SIZE(chunkmap); i++)	\
 			destmap[i] = srcmap[i];			\
 	} while (0)
 
@@ -81,7 +79,7 @@ struct ipt_sctp_info {
 ({							\
 	int i; 						\
 	int flag = 1;					\
-	for (i = 0; i < ELEMCOUNT(chunkmap); i++) {	\
+	for (i = 0; i < ARRAY_SIZE(chunkmap); i++) {	\
 		if (chunkmap[i]) {			\
 			flag = 0;			\
 			break;				\
@@ -94,7 +92,7 @@ struct ipt_sctp_info {
 ({							\
 	int i; 						\
 	int flag = 1;					\
-	for (i = 0; i < ELEMCOUNT(chunkmap); i++) {	\
+	for (i = 0; i < ARRAY_SIZE(chunkmap); i++) {	\
 		if (chunkmap[i] != ~0) {		\
 			flag = 0;			\
 				break;			\

--===============9504758634458117==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============9504758634458117==--
