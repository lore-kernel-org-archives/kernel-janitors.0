From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Thu, 17 Jul 2014 16:29:39 +0000
Subject: [PATCH 4/4] drivers/pinctrl/qcom/pinctrl-msm.c: drop negativity check on unsigned value
Message-Id: <1405614579-4652-1-git-send-email-andrey.krieger.utkin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: sboyd@codeaurora.org, bjorn.andersson@sonymobile.com, linus.walleij@linaro.org, Andrey Utkin <andrey.krieger.utkin@gmail.com>

[linux-3.16-rc5/drivers/pinctrl/pinctrl-msm.c:145]: (style) Checking if
unsigned variable 'mux_bit' is less than zero.

    if (WARN_ON(g->mux_bit < 0))
        return -EINVAL;

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=80491
Reported-by: David Binderman <dcb314@hotmail.com>
Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinc=
trl-msm.c
index 90d383d..2738108 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -142,9 +142,6 @@ static int msm_pinmux_enable(struct pinctrl_dev *pctlde=
v,
=20
 	g =3D &pctrl->soc->groups[group];
=20
-	if (WARN_ON(g->mux_bit < 0))
-		return -EINVAL;
-
 	for (i =3D 0; i < g->nfuncs; i++) {
 		if (g->funcs[i] =3D function)
 			break;
--=20
1.8.5.5

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
