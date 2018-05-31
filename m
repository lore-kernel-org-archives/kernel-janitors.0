From: Sabin Mihai Rapan <sabin.rapan@gmail.com>
Date: Thu, 31 May 2018 11:03:14 +0000
Subject: [PATCH 3/3] staging: rtlwifi: Fix "Alwyas"->"Always"
Message-Id: <20180531110314.3760-3-sabin.rapan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180531110314.3760-1-sabin.rapan@gmail.com>
In-Reply-To: <20180531110314.3760-1-sabin.rapan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Sabin Mihai Rapan <sabin.rapan@gmail.com>

Trivial fix to spelling mistake in comment text.

Signed-off-by: Sabin Mihai Rapan <sabin.rapan@gmail.com>
---
 drivers/staging/rtlwifi/rtl8822be/sw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtlwifi/rtl8822be/sw.c b/drivers/staging/rtlwifi/rtl8822be/sw.c
index 91b784b6d1c5..68629728ec4b 100644
--- a/drivers/staging/rtlwifi/rtl8822be/sw.c
+++ b/drivers/staging/rtlwifi/rtl8822be/sw.c
@@ -54,7 +54,7 @@ static void rtl8822be_init_aspm_vars(struct ieee80211_hw *hw)
 	 * 0 - Disable ASPM,
 	 * 1 - Enable ASPM without Clock Req,
 	 * 2 - Enable ASPM with Clock Req,
-	 * 3 - Alwyas Enable ASPM with Clock Req,
+	 * 3 - Always Enable ASPM with Clock Req,
 	 * 4 - Always Enable ASPM without Clock Req.
 	 * set default to RTL8822BE:3 RTL8822B:2
 	 *
-- 
2.17.0

