From: Dan Carpenter <error27@gmail.com>
Date: Fri, 02 Apr 2010 11:29:23 +0000
Subject: [patch] i2c: cleanup: change parameter to pointer
Message-Id: <20100402112923.GJ5265@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We actually pass an array of 7 chars not 5.
This silences a smatch warning.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Compile tested only.  :/

diff --git a/sound/i2c/other/ak4113.c b/sound/i2c/other/ak4113.c
index fff62cc..971a84a 100644
--- a/sound/i2c/other/ak4113.c
+++ b/sound/i2c/other/ak4113.c
@@ -70,7 +70,7 @@ static int snd_ak4113_dev_free(struct snd_device *device)
 }
 
 int snd_ak4113_create(struct snd_card *card, ak4113_read_t *read,
-		ak4113_write_t *write, const unsigned char pgm[5],
+		ak4113_write_t *write, const unsigned char *pgm,
 		void *private_data, struct ak4113 **r_ak4113)
 {
 	struct ak4113 *chip;
