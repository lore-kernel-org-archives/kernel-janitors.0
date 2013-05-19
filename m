From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 19 May 2013 13:16:52 +0000
Subject: build regressions 2013-05-18
Message-Id: <5198d0c4.X2ND682txa82XPFU%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c:50:6: error: 'struct brcmf_pub' has no member named 'dbgfs_dir'
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c:51:21: error: 'struct brcmf_pub' has no member named 'dbgfs_dir'
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c:56:26: error: 'struct brcmf_pub' has no member named 'dbgfs_dir'
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c:57:32: error: 'struct brcmf_pub' has no member named 'dbgfs_dir'
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c:62:13: error: 'struct brcmf_pub' has no member named 'dbgfs_dir'
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c:31:6: error: redefinition of 'brcmf_debugfs_init'
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c:38:6: error: redefinition of 'brcmf_debugfs_exit'
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c:47:5: error: redefinition of 'brcmf_debugfs_attach'
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c:56:6: error: redefinition of 'brcmf_debugfs_detach'
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c:159:6: error: redefinition of 'brcmf_debugfs_create_fws_stats'

[warnings]
drivers/gpu/drm/i915/intel_pm.c:4372:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/staging/speakup/main.c:1895:2: warning: passing argument 2 of 'kstrtol' makes integer from pointer without a cast [enabled by default]
drivers/staging/speakup/main.c:1895:2: warning: passing argument 3 of 'kstrtol' makes pointer from integer without a cast [enabled by default]
drivers/mfd/arizona-core.c:528:1: warning: no return statement in function returning non-void [-Wreturn-type]

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
