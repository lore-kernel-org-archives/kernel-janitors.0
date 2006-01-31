From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Tue, 31 Jan 2006 13:03:26 +0000
Subject: [KJ] [Patch 6/7] BUG_ON() Conversion in mm/swap_state.c
Message-Id: <1138712606.11570.20.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============57067276369356978=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============57067276369356978==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,  

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/mm/swap_state.c.orig	2006-01-30 23:20:38.000000000 +0100
+++ linux-2.6.16-rc1-git4/mm/swap_state.c	2006-01-30 23:21:46.000000000 +0100
@@ -146,8 +146,7 @@ int add_to_swap(struct page * page, gfp_
 	swp_entry_t entry;
 	int err;
 
-	if (!PageLocked(page))
-		BUG();
+	BUG_ON(!PageLocked(page));
 
 	for (;;) {
 		entry = get_swap_page();



--===============57067276369356978==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============57067276369356978==--
