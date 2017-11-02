From: Colin King <colin.king@canonical.com>
Date: Thu, 02 Nov 2017 16:49:08 +0000
Subject: [PATCH] media: drxd: make const array fastIncrDecLUT static
Message-Id: <20171102164908.12651-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Markus Elfring <elfring@users.sourceforge.net>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate array fastIncrDecLUT on the stack but instead make it
static. Makes the object code smaller by over 360 bytes:

   text	   data	    bss	    dec	    hex	filename
  32680	    944	     64	  33688	   8398	drxd_hard.o

   text	   data	    bss	    dec	    hex	filename
  32223	   1040	     64	  33327	   822f	drxd_hard.o

(gcc version 7.2.0 x86_64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/dvb-frontends/drxd_hard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/drxd_hard.c b/drivers/media/dvb-frontends/drxd_hard.c
index 3bdf9b1f4e7c..0696bc62dcc9 100644
--- a/drivers/media/dvb-frontends/drxd_hard.c
+++ b/drivers/media/dvb-frontends/drxd_hard.c
@@ -640,7 +640,7 @@ static int SetCfgIfAgc(struct drxd_state *state, struct SCfgAgc *cfg)
 				const u16 maxRur = 8;
 				static const u16 slowIncrDecLUT[] = {
 					3, 4, 4, 5, 6 };
-				const u16 fastIncrDecLUT[] = {
+				static const u16 fastIncrDecLUT[] = {
 					14, 15, 15, 16,
 					17, 18, 18, 19,
 					20, 21, 22, 23,
-- 
2.14.1

