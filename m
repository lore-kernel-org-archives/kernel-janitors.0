From: Colin King <colin.king@canonical.com>
Date: Sun, 23 Feb 2020 15:39:54 +0000
Subject: [PATCH] staging: speakup: remove redundant initialization of pointer p_key
Message-Id: <20200223153954.420731-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180711112607.31292-1-colin.king@canonical.com>
In-Reply-To: <20180711112607.31292-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, Kirk Reiser <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, speakup@linux-speakup.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer p_key is being initialized with a value that is never read,
it is assigned a new value later on. The initialization is redundant
and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/speakup/keyhelp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/speakup/keyhelp.c b/drivers/staging/speakup/keyhelp.c
index 5f1bda37f86d..822ceac83068 100644
--- a/drivers/staging/speakup/keyhelp.c
+++ b/drivers/staging/speakup/keyhelp.c
@@ -49,7 +49,7 @@ static int cur_item, nstates;
 static void build_key_data(void)
 {
 	u_char *kp, counters[MAXFUNCS], ch, ch1;
-	u_short *p_key = key_data, key;
+	u_short *p_key, key;
 	int i, offset = 1;
 
 	nstates = (int)(state_tbl[-1]);
-- 
2.25.0
