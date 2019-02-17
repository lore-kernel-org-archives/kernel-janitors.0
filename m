From: Colin King <colin.king@canonical.com>
Date: Sun, 17 Feb 2019 22:20:04 +0000
Subject: [PATCH] staging: rtlwifi: fix spelling mistake: "Hightest" -> "Highest"
Message-Id: <20190217222004.15850-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180510150741.20677-1-colin.king@canonical.com>
In-Reply-To: <20180510150741.20677-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in ODM_RT_TRACE message text, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtlwifi/phydm/phydm_rainfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtlwifi/phydm/phydm_rainfo.c b/drivers/staging/rtlwifi/phydm/phydm_rainfo.c
index b46791a727c7..ed740a93c8b6 100644
--- a/drivers/staging/rtlwifi/phydm/phydm_rainfo.c
+++ b/drivers/staging/rtlwifi/phydm/phydm_rainfo.c
@@ -124,7 +124,7 @@ void odm_c2h_ra_para_report_handler(void *dm_void, u8 *cmd_buf, u8 cmd_len)
 			ODM_RT_TRACE(dm, ODM_FW_DEBUG_TRACE, "%5s  %d\n",
 				     "VHT_EN =", cmd_buf[4]);
 			ODM_RT_TRACE(dm, ODM_FW_DEBUG_TRACE, "%5s  %d\n",
-				     "Hightest rate =", cmd_buf[5]);
+				     "Highest rate =", cmd_buf[5]);
 			ODM_RT_TRACE(dm, ODM_FW_DEBUG_TRACE, "%5s  0x%x\n",
 				     "Lowest rate =", cmd_buf[6]);
 			ODM_RT_TRACE(dm, ODM_FW_DEBUG_TRACE, "%5s  0x%x\n",
-- 
2.20.1
