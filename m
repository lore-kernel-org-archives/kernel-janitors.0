From: Christophe Lucas <clucas@rotomalug.org>
Date: Tue, 08 Mar 2005 11:56:18 +0000
Subject: [KJ] [PATCH] drivers/isdn/i4l/isdn_v110.c : fix warning
Message-Id: <20050308115618.GY9952@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="0ntfKIWw70PvrIHh"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--0ntfKIWw70PvrIHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
Fix compile warning on drivers/isdn/i4l/isdn_v110.c


It refers to:
http://developer.osdl.org/cherry/compile/2.6/linux-2.6.11.results/2.6.11.allyesconfig.bzImage.txt
drivers/isdn/i4l/isdn_v110.c: In function `isdn_v110_stat_callback': 
drivers/isdn/i4l/isdn_v110.c:523: warning: 'ret' might be used uninitialized in this function

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

--0ntfKIWw70PvrIHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="patch-fix-warning-isdn-i4l-isdn_v110.diff"

diff -urpN -X dontdiff linux-2.6.11-vanilla/drivers/isdn/i4l/isdn_v110.c linux-2.6.11/drivers/isdn/i4l/isdn_v110.c
--- linux-2.6.11-vanilla/drivers/isdn/i4l/isdn_v110.c	2005-03-02 08:38:33.000000000 +0100
+++ linux-2.6.11/drivers/isdn/i4l/isdn_v110.c	2005-03-08 12:37:57.000000000 +0100
@@ -520,7 +520,7 @@ isdn_v110_stat_callback(int idx, isdn_ct
 {
 	isdn_v110_stream *v = NULL;
 	int i;
-	int ret;
+	int ret = 0 ;
 
 	if (idx < 0)
 		return 0;

--0ntfKIWw70PvrIHh
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--0ntfKIWw70PvrIHh--
