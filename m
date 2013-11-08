From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 Nov 2013 09:46:10 +0000
Subject: [patch] ASoC: rcar: off by one in rsnd_scu_set_route()
Message-Id: <20131108094610.GE27977@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, Mark Brown <broonie@kernel.org>

If "id = ARRAY_SIZE(routes)" then we read one space beyond the end of
the routes[] array.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/soc/sh/rcar/scu.c b/sound/soc/sh/rcar/scu.c
index 1ab1bce..5e46ef2 100644
--- a/sound/soc/sh/rcar/scu.c
+++ b/sound/soc/sh/rcar/scu.c
@@ -68,7 +68,7 @@ static int rsnd_scu_set_route(struct rsnd_priv *priv,
 		return 0;
 
 	id = rsnd_mod_id(mod);
-	if (id < 0 || id > ARRAY_SIZE(routes))
+	if (id < 0 || id >= ARRAY_SIZE(routes))
 		return -EIO;
 
 	/*
