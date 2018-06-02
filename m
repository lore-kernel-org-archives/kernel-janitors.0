From: Sabin Mihai Rapan <sabin.rapan@gmail.com>
Date: Sat, 02 Jun 2018 09:04:14 +0000
Subject: [PATCH v2 3/3] staging: rtlwifi: Fix "Alwyas"->"Always"
Message-Id: <20180602090414.5208-3-sabin.rapan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180601060740.GA25648@kroah.com>
 <20180602090414.5208-1-sabin.rapan@gmail.com>
In-Reply-To: <20180602090414.5208-1-sabin.rapan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Sabin Mihai Rapan <sabin.rapan@gmail.com>

Trivial fix to spelling mistake in comment text.

Signed-off-by: Sabin Mihai Rapan <sabin.rapan@gmail.com>
---
Changes in v2:
 - Added proper to and cc fields to the patch series.

 drivers/staging/rtlwifi/rtl8822be/sw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtlwifi/rtl8822be/sw.c b/drivers/staging/rtlwifi/rtl8822be/sw.c
index 7825e85ed091..a2ab19fa94f2 100644
--- a/drivers/staging/rtlwifi/rtl8822be/sw.c
+++ b/drivers/staging/rtlwifi/rtl8822be/sw.c
@@ -43,7 +43,7 @@ static void rtl8822be_init_aspm_vars(struct ieee80211_hw *hw)
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

