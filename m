From: Julien Brunel <brunel@diku.dk>
Date: Mon, 01 Sep 2008 08:59:54 +0000
Subject: [PATCH] sound/arm: Bad NULL test
Message-Id: <200809011059.54939.brunel@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: perex@perex.cz, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julien Brunel <brunel@diku.dk>

In case of error, the function aaci_init_card returns an ERR pointer,
but never returns a NULL pointer. We have noticed a bad NULL test,
which comes after a call to this function. Rather than doing an IS_ERR
test, we suggest to duplicate the label out: one label for the case where
aaci_init_card returns a valid pointer, and another for the case where
aaci_init_card returns an ERR pointer.

The semantic match that finds this problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@match_bad_null_test@
expression x, E;
statement S1,S2;
@@
x =  aaci_init_card(...)
... when != x = E
*  if (x != NULL) 
S1 else S2
// </smpl>

Signed-off-by:  Julien Brunel <brunel@diku.dk>
Signed-off-by:  Julia Lawall <julia@diku.dk>

---
 sound/arm/aaci.c |    13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff -u -p a/sound/arm/aaci.c b/sound/arm/aaci.c
--- a/sound/arm/aaci.c
+++ b/sound/arm/aaci.c
@@ -1091,7 +1091,7 @@ static int __devinit aaci_probe(struct a
 	aaci->base = ioremap(dev->res.start, SZ_4K);
 	if (!aaci->base) {
 		ret = -ENOMEM;
-		goto out;
+		goto out_free_aaci;
 	}
 
 	/*
@@ -1119,7 +1119,7 @@ static int __devinit aaci_probe(struct a
 
 	ret = aaci_probe_ac97(aaci);
 	if (ret)
-		goto out;
+		goto out_free_aaci;
 
 	/*
 	 * Size the FIFOs (must be multiple of 16).
@@ -1129,12 +1129,12 @@ static int __devinit aaci_probe(struct a
 		printk(KERN_WARNING "AACI: fifosize = %d not supported\n",
 		       aaci->fifosize);
 		ret = -ENODEV;
-		goto out;
+		goto out_free_aaci;
 	}
 
 	ret = aaci_init_pcm(aaci);
 	if (ret)
-		goto out;
+		goto out_free_aaci;
 
 	snd_card_set_dev(aaci->card, &dev->dev);
 
@@ -1145,10 +1145,9 @@ static int __devinit aaci_probe(struct a
 		amba_set_drvdata(dev, aaci->card);
 		return ret;
 	}
-
+ out_free_aaci:
+	snd_card_free(aaci->card);
  out:
-	if (aaci)
-		snd_card_free(aaci->card);
 	amba_release_regions(dev);
 	return ret;
 }
