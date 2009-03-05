From: Hannes Eder <hannes@hanneseder.net>
Date: Thu, 05 Mar 2009 19:14:39 +0000
Subject: [PATCH v2 05/15] NULL noise: drivers/media/dvb/frontends/drx397xD_fw.h
Message-Id: <20090305191435.30062.72139.stgit@f10box.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090305190954.30062.44759.stgit@f10box.hanneseder.net>
In-Reply-To: <20090305190954.30062.44759.stgit@f10box.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>

Fix this sparse warnings:
  drivers/media/dvb/frontends/drx397xD_fw.h:21:2: warning: Using plain integer as NULL pointer
  drivers/media/dvb/frontends/drx397xD_fw.h:22:2: warning: Using plain integer as NULL pointer

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
v2: other subject, as suggested by Al Viro

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

