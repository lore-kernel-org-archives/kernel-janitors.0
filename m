From: Julia Lawall <julia@diku.dk>
Date: Thu, 28 Jul 2011 12:46:05 +0000
Subject: [PATCH 5/6] sound/core/pcm_compat.c: adjust array index
Message-Id: <1311857165-14780-6-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1311857165-14780-1-git-send-email-julia@diku.dk>
In-Reply-To: <1311857165-14780-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Convert array index from the loop bound to the loop index.

A simplified version of the semantic patch that fixes this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e1,e2,ar;
@@

for(e1 = 0; e1 < e2; e1++) { <...
  ar[
- e2
+ e1
  ]
  ...> }
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
Not tested.

 sound/core/pcm_compat.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/sound/core/pcm_compat.c b/sound/core/pcm_compat.c
--- a/sound/core/pcm_compat.c
+++ b/sound/core/pcm_compat.c
@@ -342,7 +342,7 @@ static int snd_pcm_ioctl_xfern_compat(st
 			kfree(bufs);
 			return -EFAULT;
 		}
-		bufs[ch] = compat_ptr(ptr);
+		bufs[i] = compat_ptr(ptr);
 		bufptr++;
 	}
 	if (dir = SNDRV_PCM_STREAM_PLAYBACK)

