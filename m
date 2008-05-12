From: Julia Lawall <julia@diku.dk>
Date: Mon, 12 May 2008 13:39:11 +0000
Subject: [PATCH 6/6] drivers/net/pppol2tp.c: remove null pointer dereference
Message-Id: <Pine.LNX.4.64.0805121538510.3694@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jchapman@katalix.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

If session is NULL, it is not possible to access its name field.  So I have
split apart the printing of the error message to drop the printing of the
name field in this case.


This problem was found using the following semantic match
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
expression E, E1;
identifier f;
statement S1,S2,S3;
@@

* if (E = NULL)
{
  ... when != if (E = NULL) S1 else S2
      when != E = E1
* E->f
  ... when any
  return ...;
}
else S3
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---

diff -u -p a/drivers/net/pppol2tp.c b/drivers/net/pppol2tp.c
--- linux-2.6/drivers/net/pppol2tp.c	2008-05-09 16:46:57.000000000 +0200
+++ linuxcopy/drivers/net/pppol2tp.c	2008-05-12 15:30:52.000000000 +0200
@@ -1621,9 +1621,16 @@ out_no_ppp:
 end:
 	release_sock(sk);
 
-	if (error != 0)
-		PRINTK(session ? session->debug : -1, PPPOL2TP_MSG_CONTROL, KERN_WARNING,
-		       "%s: connect failed: %d\n", session->name, error);
+	if (error != 0) {
+		if (session)
+			PRINTK(session->debug,
+				PPPOL2TP_MSG_CONTROL, KERN_WARNING,
+				"%s: connect failed: %d\n",
+				session->name, error);
+		else
+			PRINTK(-1, PPPOL2TP_MSG_CONTROL, KERN_WARNING,
+				"connect failed: %d\n", error);
+	}
 
 	return error;
 }
