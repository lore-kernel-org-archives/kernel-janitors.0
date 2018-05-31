From: Sabin Mihai Rapan <sabin.rapan@gmail.com>
Date: Thu, 31 May 2018 11:03:13 +0000
Subject: [PATCH 2/3] staging: rtlwifi: Fix "writen"->"written"
Message-Id: <20180531110314.3760-2-sabin.rapan@gmail.com>
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
 drivers/staging/rtlwifi/rtl8822be/fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtlwifi/rtl8822be/fw.c b/drivers/staging/rtlwifi/rtl8822be/fw.c
index 483ea85943c3..55b5c9df9d81 100644
--- a/drivers/staging/rtlwifi/rtl8822be/fw.c
+++ b/drivers/staging/rtlwifi/rtl8822be/fw.c
@@ -93,7 +93,7 @@ static void _rtl8822be_fill_h2c_command(struct ieee80211_hw *hw, u8 element_id,
 	}
 
 	while (!bwrite_success) {
-		/* 2. Find the last BOX number which has been writen. */
+		/* 2. Find the last BOX number which has been written. */
 		boxnum = rtlhal->last_hmeboxnum;
 		switch (boxnum) {
 		case 0:
-- 
2.17.0

