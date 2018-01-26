From: Colin King <colin.king@canonical.com>
Date: Fri, 26 Jan 2018 11:54:14 +0000
Subject: [PATCH] staging: rtl8723bs: remove a couple of redundant initializations
Message-Id: <20180126115414.16922-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, Larry Finger <Larry.Finger@lwfinger.net>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The initialization of PwrCfgCmd is redundant as the value is never read
and it is being re-assigned to PwrSeqCmd[AryIdx] inside a loop, hence
it can be removed.  Also, the initialization of ie_ptr is redundant as
the value is never read and it is being re-assigned in either path of
an if statement, hence it can be removed too.

Cleans up clang warnings:
drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c:53:15: warning: Value
stored to 'PwrCfgCmd' during its initialization is never read
drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:374:7: warning: Value
stored to 'ie_ptr' during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c   | 2 +-
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c b/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c
index f4619768a99f..334d680b9b1c 100644
--- a/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c
+++ b/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c
@@ -50,7 +50,7 @@ u8 HalPwrSeqCmdParsing(
 	WLAN_PWR_CFG PwrSeqCmd[]
 )
 {
-	WLAN_PWR_CFG PwrCfgCmd = {0};
+	WLAN_PWR_CFG PwrCfgCmd;
 	u8 bPollingBit = false;
 	u32 AryIdx = 0;
 	u8 value = 0;
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index da59496f6e04..cc18d0ad7d7b 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -371,7 +371,7 @@ static char *translate_scan(struct adapter *padapter,
 		u8 *wpsie_ptr = NULL;
 		uint wps_ielen = 0;
 
-		u8 *ie_ptr = pnetwork->network.IEs + ie_offset;
+		u8 *ie_ptr;
 		total_ielen = pnetwork->network.IELength - ie_offset;
 
 		if (pnetwork->network.Reserved[0] = 2) { /*  Probe Request */
-- 
2.15.1

