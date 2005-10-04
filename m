From: Masoud Sharbiani <masouds@masoud.ir>
Date: Tue, 04 Oct 2005 19:20:32 +0000
Subject: [KJ] [PATCH] kernel/audit.c char *foo="bar" -> char foo[]="bar"
Message-Id: <20051004192032.GA10626@masoud.ir>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============47064853357806902=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============47064853357806902==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello, 
The patch below, converts the only instance of char *foo="constant" to char *foo[]="constant"
cheers, 
Masoud

Signed-off-by: Masoud A Sharbiani <masouds@masoud.ir>

diff --git a/kernel/audit.c b/kernel/audit.c
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -787,7 +787,7 @@ void audit_log_hex(struct audit_buffer *
 	int i, avail, new_len;
 	unsigned char *ptr;
 	struct sk_buff *skb;
-	static const unsigned char *hex = "0123456789ABCDEF";
+	static const unsigned char hex[] = "0123456789ABCDEF";
 
 	BUG_ON(!ab->skb);
 	skb = ab->skb;


--===============47064853357806902==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============47064853357806902==--
