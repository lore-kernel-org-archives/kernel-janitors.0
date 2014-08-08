From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 08 Aug 2014 10:07:49 +0000
Subject: =?UTF-8?q?=5BPATCH=208/14=5D=20ASoC=3A=20rsnd=3A=20delete=20unneeded=20test=20before=20of=5Fnode=5Fp
Message-Id: <1407492475-26283-8-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>

From: Julia Lawall <Julia.Lawall@lip6.fr>

Of_node_put supports NULL as its argument, so the initial test is not
necessary.

Suggested by Uwe Kleine-K=C3=B6nig.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e;
@@

-if (e)
   of_node_put(e);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 sound/soc/sh/rcar/core.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 19f7896..1922ec5 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -798,10 +798,8 @@ if (name##_node) {							\
 			mod_parse(src);
 			mod_parse(dvc);
=20
-			if (playback)
-				of_node_put(playback);
-			if (capture)
-				of_node_put(capture);
+			of_node_put(playback);
+			of_node_put(capture);
 		}
=20
 		dai_i++;

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
