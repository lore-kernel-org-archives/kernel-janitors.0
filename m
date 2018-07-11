From: Colin King <colin.king@canonical.com>
Date: Wed, 11 Jul 2018 11:26:07 +0000
Subject: [PATCH] staging: speakup: remove redundant variable l
Message-Id: <20180711112607.31292-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, Kirk Reiser <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, speakup@linux-speakup.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable l is being assigned but is never used hence it is redundant
and can be removed.

Cleans up clang warning:
warning: variable 'l' set but not used [-Wunused-but-set-variable

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/speakup/varhandlers.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/speakup/varhandlers.c b/drivers/staging/speakup/varhandlers.c
index 54a76b6752ad..1b545152cc49 100644
--- a/drivers/staging/speakup/varhandlers.c
+++ b/drivers/staging/speakup/varhandlers.c
@@ -179,7 +179,6 @@ int spk_set_num_var(int input, struct st_var_header *var, int how)
 {
 	int val;
 	int *p_val = var->p_val;
-	int l;
 	char buf[32];
 	char *cp;
 	struct var_t *var_data = var->data;
@@ -237,9 +236,9 @@ int spk_set_num_var(int input, struct st_var_header *var, int how)
 	else
 		cp = buf;
 	if (!var_data->u.n.out_str)
-		l = sprintf(cp, var_data->u.n.synth_fmt, (int)val);
+		sprintf(cp, var_data->u.n.synth_fmt, (int)val);
 	else
-		l = sprintf(cp,	var_data->u.n.synth_fmt, var_data->u.n.out_str[val]);
+		sprintf(cp, var_data->u.n.synth_fmt, var_data->u.n.out_str[val]);
 	synth_printf("%s", cp);
 	return 0;
 }
-- 
2.17.1

