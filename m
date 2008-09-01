From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 01 Sep 2008 12:12:34 +0000
Subject: Re: [PATCH] sound/arm: Bad NULL test
Message-Id: <s5hsksk12vh.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200809011059.54939.brunel@diku.dk>
In-Reply-To: <200809011059.54939.brunel@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julien Brunel <brunel@diku.dk>
Cc: perex@perex.cz, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

At Mon, 1 Sep 2008 10:59:54 +0200,
Julien Brunel wrote:
> 
> From: Julien Brunel <brunel@diku.dk>
> 
> In case of error, the function aaci_init_card returns an ERR pointer,
> but never returns a NULL pointer. We have noticed a bad NULL test,
> which comes after a call to this function. Rather than doing an IS_ERR
> test, we suggest to duplicate the label out: one label for the case where
> aaci_init_card returns a valid pointer, and another for the case where
> aaci_init_card returns an ERR pointer.
> 
> The semantic match that finds this problem is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @match_bad_null_test@
> expression x, E;
> statement S1,S2;
> @@
> x =  aaci_init_card(...)
> ... when != x = E
> *  if (x != NULL) 
> S1 else S2
> // </smpl>
> 
> Signed-off-by:  Julien Brunel <brunel@diku.dk>
> Signed-off-by:  Julia Lawall <julia@diku.dk>

The fix below is simpler.  Could you check whether it's OK?

thanks,

Takashi


diff --git a/sound/arm/aaci.c b/sound/arm/aaci.c
index b0a4744..e46b7cb 100644
--- a/sound/arm/aaci.c
+++ b/sound/arm/aaci.c
@@ -1085,6 +1085,7 @@ static int __devinit aaci_probe(struct amba_device *dev, void *id)
 	aaci = aaci_init_card(dev);
 	if (IS_ERR(aaci)) {
 		ret = PTR_ERR(aaci);
+		aaci = NULL;
 		goto out;
 	}
 
