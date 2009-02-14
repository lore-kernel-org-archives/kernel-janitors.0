From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 21:36:20 +0000
Subject: [PATCH 22/43] drivers/net/hamradio: fix sparse warnings: fix
Message-Id: <20090214213543.24377.50515.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warnings:
  drivers/net/hamradio/hdlcdrv.c:274:34: warning: incorrect type in argument 2 (different signedness)
  drivers/net/hamradio/hdlcdrv.c:279:47: warning: incorrect type in argument 2 (different signedness)
  drivers/net/hamradio/hdlcdrv.c:288:39: warning: incorrect type in argument 2 (different signedness)
  drivers/net/hamradio/hdlcdrv.c:300:47: warning: incorrect type in argument 2 (different signedness)

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 include/linux/hdlcdrv.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/linux/hdlcdrv.h b/include/linux/hdlcdrv.h
index 0821bac..c010b4a 100644
--- a/include/linux/hdlcdrv.h
+++ b/include/linux/hdlcdrv.h
@@ -215,7 +215,7 @@ struct hdlcdrv_state {
 
 	struct hdlcdrv_hdlctx {
 		struct hdlcdrv_hdlcbuffer hbuf;
-		long in_hdlc_tx;
+		unsigned long in_hdlc_tx;
 		/*
 		 * 0 = send flags
 		 * 1 = send txtail (flags)

