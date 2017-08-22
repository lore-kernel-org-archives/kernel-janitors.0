From: Colin King <colin.king@canonical.com>
Date: Tue, 22 Aug 2017 16:02:18 +0000
Subject: [PATCH][staging-next] staging: typec: tcpm: make function tcpm_get_pwr_opmode
Message-Id: <20170822160218.32316-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, Badhri Jagan Sridharan <badhri@google.com>, Thomas Gardner <tmg@fastmail.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The function pointer tcpm_get_pwr_opmode is local to the source and does
not need to be in global scope, so make it static.

Cleans up sparse warning:
symbol 'tcpm_get_pwr_opmode' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/typec/tcpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/typec/tcpm.c b/drivers/staging/typec/tcpm.c
index 7b5ba27dd935..a911cad41a59 100644
--- a/drivers/staging/typec/tcpm.c
+++ b/drivers/staging/typec/tcpm.c
@@ -2131,7 +2131,7 @@ static void tcpm_swap_complete(struct tcpm_port *port, int result)
 	}
 }
 
-enum typec_pwr_opmode tcpm_get_pwr_opmode(enum typec_cc_status cc)
+static enum typec_pwr_opmode tcpm_get_pwr_opmode(enum typec_cc_status cc)
 {
 	switch (cc) {
 	case TYPEC_CC_RP_1_5:
-- 
2.14.1

