From: Shalin Mehta <shalinmehta85@gmail.com>
Date: Thu, 03 Oct 2013 08:08:42 +0000
Subject: [PATCH] staging: speakup: str initialization replaced with NULL where it was initialized with int
Message-Id: <1380787722-27736-1-git-send-email-shalinmehta85@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, lisa@xenapiadmin.com, sachin.kamat@linaro.org, andriy.shevchenko@linux.intel.com, w.d.hubbs@gmail.com, dan.carpenter@oracle.com
Cc: speakup@braille.uwo.ca, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kirk@reisers.ca, chris@the-brannons.com, kernel-janitors@vger.kernel.org, Shalin Mehta <shalinmehta85@gmail.com>

Fixed warnings in all of three files where the string was initilized with an integer instead of NULL

Signed-off-by: Shalin Mehta <shalinmehta85@gmail.com>
---
 drivers/staging/speakup/main.c           | 2 +-
 drivers/staging/speakup/speakup_audptr.c | 2 +-
 drivers/staging/speakup/varhandlers.c    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/speakup/main.c b/drivers/staging/speakup/main.c
index 14079c4..47502fa 100644
--- a/drivers/staging/speakup/main.c
+++ b/drivers/staging/speakup/main.c
@@ -90,7 +90,7 @@ const struct st_bits_data spk_punc_info[] = {
 	{"repeats", "()", CH_RPT},
 	{"extended numeric", "", B_EXNUM},
 	{"symbols", "", B_SYM},
-	{0, 0}
+	{NULL, NULL}
 };
 
 static char mark_cut_flag;
diff --git a/drivers/staging/speakup/speakup_audptr.c b/drivers/staging/speakup/speakup_audptr.c
index 3508aee..61a3cee 100644
--- a/drivers/staging/speakup/speakup_audptr.c
+++ b/drivers/staging/speakup/speakup_audptr.c
@@ -39,7 +39,7 @@ static struct var_t vars[] = {
 	{ RATE, .u.n = {"\x05[r%d]", 10, 0, 20, 100, -10, NULL } },
 	{ PITCH, .u.n = {"\x05[f%d]", 80, 39, 4500, 0, 0, NULL } },
 	{ VOL, .u.n = {"\x05[g%d]", 21, 0, 40, 0, 0, NULL } },
-	{ TONE, .u.n = {"\x05[s%d]", 9, 0, 63, 0, 0, 0 } },
+	{ TONE, .u.n = {"\x05[s%d]", 9, 0, 63, 0, 0, NULL } },
 	{ PUNCT, .u.n = {"\x05[A%c]", 0, 0, 3, 0, 0, "nmsa" } },
 	{ DIRECT, .u.n = {NULL, 0, 0, 1, 0, 0, NULL } },
 	V_LAST_VAR
diff --git a/drivers/staging/speakup/varhandlers.c b/drivers/staging/speakup/varhandlers.c
index 9aa2a78..70231b6 100644
--- a/drivers/staging/speakup/varhandlers.c
+++ b/drivers/staging/speakup/varhandlers.c
@@ -46,7 +46,7 @@ static struct st_var_header var_headers[] = {
 	{ "direct", DIRECT, VAR_NUM, NULL, NULL },
 };
 
-static struct st_var_header *var_ptrs[MAXVARS] = { 0, 0, 0 };
+static struct st_var_header *var_ptrs[MAXVARS] = { NULL, NULL, NULL };
 
 static struct punc_var_t punc_vars[] = {
 	{ PUNC_SOME, 1 },
-- 
1.8.1.2

