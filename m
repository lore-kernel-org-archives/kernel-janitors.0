From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 11 Sep 2012 09:15:37 +0000
Subject: [wireless:master 39/40] drivers/net/wireless/ath/ath9k/ar9003_eeprom.c:2987
Message-Id: <20120911091537.GA29599@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/linville/wireless.git master
head:   4abd044af91057f7ea661a0f10c00a9673beef6b
commit: 74673db99ca3c09d34ea479f684522ceedb65eb9 [39/40] ath9k: make PA linearization optional, disabled by default and fix checks

All smatch warnings:

+ drivers/net/wireless/ath/ath9k/ar9003_eeprom.c:2987 ath9k_hw_ar9300_get_eeprom() warn: if();
+ drivers/net/wireless/ath/ath9k/ar9003_eeprom.c:2989 ath9k_hw_ar9300_get_eeprom() info: ignoring unreachable code.
+ drivers/net/wireless/ath/ath9k/ar9003_eeprom.c:2989 ath9k_hw_ar9300_get_eeprom() info: ignoring unreachable code.
  drivers/net/wireless/ath/ath9k/ar9003_eeprom.c:3372 ath9k_hw_ar9300_fill_eeprom() Error invalid range 4096 to -1

vim +2987 drivers/net/wireless/ath/ath9k/ar9003_eeprom.c

  2984		case EEP_PAPRD:
  2985			if (AR_SREV_9462(ah))
  2986				return false;
> 2987			if (!ah->config.enable_paprd);
  2988				return false;
  2989			return !!(pBase->featureEnable & BIT(5));

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
