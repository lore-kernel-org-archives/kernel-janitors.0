From: Dan Carpenter <error27@gmail.com>
Date: Tue, 10 Aug 2010 06:09:05 +0000
Subject: [patch] Staging: solo6x10: return -EFAULT on copy_to_user errors
Message-Id: <20100810060905.GA18431@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

copy_to_user() returns the number of bytes remaining to be copied, but
we want to return a negative error code here.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/solo6x10/solo6010-g723.c b/drivers/staging/solo6x10/solo6010-g723.c
index e82846c..82fbcb8 100644
--- a/drivers/staging/solo6x10/solo6010-g723.c
+++ b/drivers/staging/solo6x10/solo6010-g723.c
@@ -233,7 +233,7 @@ static int snd_solo_pcm_copy(struct snd_pcm_substream *ss, int channel,
 				   solo_pcm->g723_buf, G723_PERIOD_BYTES);
 
 		if (err)
-			return err; 
+			return -EFAULT;
 	}
 
 	return 0;
