From: Aaron Grothe <ajgrothe@yahoo.com>
Date: Thu, 06 Oct 2005 02:37:54 +0000
Subject: [KJ] Unreachable Code
Message-Id: <20051006023754.35718.qmail@web34205.mail.mud.yahoo.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="0-1282900078-1128566274=:35356"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--0-1282900078-1128566274=:35356
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Id: 
Content-Disposition: inline

Hi,

The following is a small patch against the 2.6.14-rc3
tree.  It removes some code that won't/can't be
reached.  I came across the code while building the
kernel with the Intel C compiler.

I've thrown a couple of quick webpages and a little
project on sourceforge up at http://www.linuxicc.org
with some more of the "interesting" results from using
Intel's compiler.  I think with Intel's compiler
reporting a couple of things than gcc it might lead to
some interesting results.

Regards,

Aaron
=-=-=
"The Journey is the Reward" - Old Zen Buddhist Saying


		
__________________________________ 
Yahoo! Mail - PC Magazine Editors' Choice 2005 
http://mail.yahoo.com
--0-1282900078-1128566274=:35356
Content-Type: text/plain; name="patch26.txt"
Content-Description: 2148707597-patch26.txt
Content-Disposition: inline; filename="patch26.txt"

diff -uprN -X dontdiff linux-2.6.14-rc3/drivers/char/drm/i830_dma.c linux-2.6.14-rc3-patch/drivers/char/drm/i830_dma.c
--- linux-2.6.14-rc3/drivers/char/drm/i830_dma.c	2005-10-04 11:19:44.000000000 +0200
+++ linux-2.6.14-rc3-patch/drivers/char/drm/i830_dma.c	2005-10-06 04:43:58.000000000 +0200
@@ -594,21 +594,6 @@ static void i830EmitTexPalette( drm_devi
 
 	return;
 
-	BEGIN_LP_RING( 258 );
-
-	if(is_shared == 1) {
-		OUT_RING(CMD_OP_MAP_PALETTE_LOAD |
-			 MAP_PALETTE_NUM(0) |
-			 MAP_PALETTE_BOTH);
-	} else {
-		OUT_RING(CMD_OP_MAP_PALETTE_LOAD | MAP_PALETTE_NUM(number));
-	}
-	for(i = 0; i < 256; i++) {
-		OUT_RING(palette[i]);
-	}
-	OUT_RING(0);
-	/* KW:  WHERE IS THE ADVANCE_LP_RING?  This is effectively a noop! 
-	 */
 }
 
 /* Need to do some additional checking when setting the dest buffer.
diff -uprN -X dontdiff linux-2.6.14-rc3/fs/udf/super.c linux-2.6.14-rc3-patch/fs/udf/super.c
--- linux-2.6.14-rc3/fs/udf/super.c	2005-08-29 01:41:01.000000000 +0200
+++ linux-2.6.14-rc3-patch/fs/udf/super.c	2005-10-06 04:45:13.000000000 +0200
@@ -793,55 +793,6 @@ udf_find_fileset(struct super_block *sb,
 		kernel_lb_addr newfileset;
 
 		return 1;
-		
-		for (newfileset.partitionReferenceNum=UDF_SB_NUMPARTS(sb)-1;
-			(newfileset.partitionReferenceNum != 0xFFFF &&
-				fileset->logicalBlockNum == 0xFFFFFFFF &&
-				fileset->partitionReferenceNum == 0xFFFF);
-			newfileset.partitionReferenceNum--)
-		{
-			lastblock = UDF_SB_PARTLEN(sb, newfileset.partitionReferenceNum);
-			newfileset.logicalBlockNum = 0;
-
-			do
-			{
-				bh = udf_read_ptagged(sb, newfileset, 0, &ident);
-				if (!bh)
-				{
-					newfileset.logicalBlockNum ++;
-					continue;
-				}
-
-				switch (ident)
-				{
-					case TAG_IDENT_SBD:
-					{
-						struct spaceBitmapDesc *sp;
-						sp = (struct spaceBitmapDesc *)bh->b_data;
-						newfileset.logicalBlockNum += 1 +
-							((le32_to_cpu(sp->numOfBytes) + sizeof(struct spaceBitmapDesc) - 1)
-								>> sb->s_blocksize_bits);
-						udf_release_data(bh);
-						break;
-					}
-					case TAG_IDENT_FSD:
-					{
-						*fileset = newfileset;
-						break;
-					}
-					default:
-					{
-						newfileset.logicalBlockNum ++;
-						udf_release_data(bh);
-						bh = NULL;
-						break;
-					}
-				}
-			}
-			while (newfileset.logicalBlockNum < lastblock &&
-				fileset->logicalBlockNum == 0xFFFFFFFF &&
-				fileset->partitionReferenceNum == 0xFFFF);
-		}
 	}
 
 	if ((fileset->logicalBlockNum != 0xFFFFFFFF ||
diff -uprN -X dontdiff linux-2.6.14-rc3/net/rxrpc/transport.c linux-2.6.14-rc3-patch/net/rxrpc/transport.c
--- linux-2.6.14-rc3/net/rxrpc/transport.c	2005-10-04 11:20:21.000000000 +0200
+++ linux-2.6.14-rc3-patch/net/rxrpc/transport.c	2005-10-06 04:45:59.000000000 +0200
@@ -563,8 +563,6 @@ void rxrpc_trans_receive_packet(struct r
 		kfree_skb(pkt);
 	}
 
-	_leave("");
-
 } /* end rxrpc_trans_receive_packet() */
 
 /*****************************************************************************/
@@ -848,7 +846,4 @@ static void rxrpc_trans_receive_error_re
 			rxrpc_put_peer(peer);
 		}
 	}
-
-	_leave("");
-	return;
 } /* end rxrpc_trans_receive_error_report() */

--0-1282900078-1128566274=:35356
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--0-1282900078-1128566274=:35356--
