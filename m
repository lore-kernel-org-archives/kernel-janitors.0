From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 05 Jun 2015 09:24:06 +0000
Subject: [patch] staging: rtl8192e: fix some confusing indenting
Message-Id: <20150605092406.GC24871@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The indenting here causes a static checker warning:

	drivers/staging/rtl8192e/rtllib_rx.c:626 RxReorderIndicatePacket()
	warn: curly braces intended?

The code is actually correct, it's just that these lines were pushed in
an extra indent level by mistake in 35e33b0468ab ('staging: rtl8192e:
Fix LONG_LINE warnings').

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 6977f04..2bef1f6 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -623,9 +623,9 @@ static void RxReorderIndicatePacket(struct rtllib_device *ieee,
 		else
 			pTS->RxIndicateSeq = 4095 -
 					     (WinSize - (SeqNum + 1)) + 1;
-			netdev_dbg(ieee->dev,
-				   "Window Shift! IndicateSeq: %d, NewSeq: %d\n",
-				   pTS->RxIndicateSeq, SeqNum);
+		netdev_dbg(ieee->dev,
+			   "Window Shift! IndicateSeq: %d, NewSeq: %d\n",
+			   pTS->RxIndicateSeq, SeqNum);
 	}
 
 	/* Indication process.
