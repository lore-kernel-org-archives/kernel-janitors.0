From: Julia Lawall <julia@diku.dk>
Date: Fri, 27 Aug 2010 05:57:20 +0000
Subject: [PATCH 3/3] drivers/staging/tm6000: Remove potential NULL dereference
Message-Id: <1282888640-27042-4-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1282888640-27042-1-git-send-email-julia@diku.dk>
In-Reply-To: <1282888640-27042-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

If the NULL test is necessary, the initialization involving a dereference of
the tested value should be moved after the NULL test.

The sematic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
type T;
expression E;
identifier i,fld;
statement S;
@@

- T i = E->fld;
+ T i;
  ... when != E
      when != i
  if (E = NULL) S
+ i = E->fld;
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/staging/tm6000/tm6000-alsa.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/tm6000/tm6000-alsa.c b/drivers/staging/tm6000/tm6000-alsa.c
index 087137d..a06b3c6 100644
--- a/drivers/staging/tm6000/tm6000-alsa.c
+++ b/drivers/staging/tm6000/tm6000-alsa.c
@@ -426,11 +426,12 @@ error:
 
 static int tm6000_audio_fini(struct tm6000_core *dev)
 {
-	struct snd_tm6000_card	*chip = dev->adev;
+	struct snd_tm6000_card	*chip;
 
 	if (!dev)
 		return 0;
 
+	chip = dev->adev;
 	if (!chip)
 		return 0;
 

