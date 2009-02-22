From: Hannes Eder <hannes@hanneseder.net>
Date: Sun, 22 Feb 2009 00:02:08 +0000
Subject: [PATCH 05/16] dvb: fix sparse warnings: Using plain integer as NULL
Message-Id: <20090222000204.17557.99725.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warnings:
  drivers/media/dvb/frontends/drx397xD_fw.h:21:2: warning: Using plain integer as NULL pointer
  drivers/media/dvb/frontends/drx397xD_fw.h:22:2: warning: Using plain integer as NULL pointer

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/media/dvb/frontends/drx397xD.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/media/dvb/frontends/drx397xD.c b/drivers/media/dvb/frontends/drx397xD.c
index 1e81e71..172f1f9 100644
--- a/drivers/media/dvb/frontends/drx397xD.c
+++ b/drivers/media/dvb/frontends/drx397xD.c
@@ -74,7 +74,7 @@ static struct {
 } fw[] = {
 #define _FW_ENTRY(a, b, c)	{					\
 			.name	= a,					\
-			.file	= 0,					\
+			.file	= NULL,					\
 			.lock	= __RW_LOCK_UNLOCKED(fw[c].lock),	\
 			.refcnt = 0,					\
 			.data	= { }		}

