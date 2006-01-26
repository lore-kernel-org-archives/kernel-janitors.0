From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Thu, 26 Jan 2006 17:20:25 +0000
Subject: [KJ] [Patch 4/8] BUG_ON() Conversion in fs/direct-io.c
Message-Id: <1138296025.9170.23.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============34592711582621072=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============34592711582621072==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes if() BUG(); constructs to BUG_ON() which is
cleaner and can better optimized away

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/fs/direct-io.c.orig	2006-01-26 17:55:23.000000000 +0100
+++ linux-2.6.16-rc1-git4/fs/direct-io.c	2006-01-26 17:55:37.000000000 +0100
@@ -915,8 +915,7 @@ do_holes:
 			block_in_page += this_chunk_blocks;
 			dio->blocks_available -= this_chunk_blocks;
 next_block:
-			if (dio->block_in_file > dio->final_block_in_request)
-				BUG();
+			BUG_ON(dio->block_in_file > dio->final_block_in_request);
 			if (dio->block_in_file == dio->final_block_in_request)
 				break;
 		}



--===============34592711582621072==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============34592711582621072==--
