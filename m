From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 28 Oct 2018 05:56:08 +0000
Subject: [PATCH] ASoC: AMD: constify regulator_desc structure
Message-Id: <1540706168-30601-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>

The regulator_desc structure can be const as it is only passed as the
second argument of devm_regulator_register and the corresponding
parameter is declared as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 sound/soc/amd/acp-da7219-max98357a.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index 3f813ea5210a..a5daad973ce5 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -403,7 +403,7 @@ static struct regulator_config acp_da7219_cfg = {
 static struct regulator_ops acp_da7219_ops = {
 };
 
-static struct regulator_desc acp_da7219_desc = {
+static const struct regulator_desc acp_da7219_desc = {
 	.name = "reg-fixed-1.8V",
 	.type = REGULATOR_VOLTAGE,
 	.owner = THIS_MODULE,
