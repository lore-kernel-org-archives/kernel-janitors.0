From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 29 Nov 2018 14:24:06 +0000
Subject: [PATCH] ath10k: remove an unnecessary NULL check
Message-Id: <20181129142406.GV3073@unbuntlaptop>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20181129103214.5tudci6izlfaasqx@kili.mountain>
References: <20181129103214.5tudci6izlfaasqx@kili.mountain>
In-Reply-To: <20181129103214.5tudci6izlfaasqx@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, Rakesh Pillai <pillair@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, ath10k@lists.infradead.org

The "survey" pointer is the address of an array element.  We know that
it can't be NULL so this check can be removed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Resending with linux-wireless Cc for patchwork.

 drivers/net/wireless/ath/ath10k/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 659513bf4ddc..6a04727b63ce 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -2578,7 +2578,7 @@ static void ath10k_wmi_event_chan_info_unpaired(struct ath10k *ar,
 
 	survey = &ar->survey[idx];
 
-	if (!params->mac_clk_mhz || !survey)
+	if (!params->mac_clk_mhz)
 		return;
 
 	memset(survey, 0, sizeof(*survey));
-- 
2.11.0
