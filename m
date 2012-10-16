From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 16 Oct 2012 03:20:23 +0000
Subject: drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c:31:6: error: redefinition of 'brcmf_debugfs_init'
Message-Id: <20121016032023.GC16754@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121016031708.GA16754@localhost>
In-Reply-To: <20121016031708.GA16754@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Arend,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux master
head:   29bb4cc5e0547a7589556f8629e39016c5d203c0
commit: 80969836a7ddde326d3f289d234e9e2d9ed27272 brcmfmac: expose sdio internal counters in debugfs
date:   4 months ago
config: cris-allyesconfig # make ARCH=cris allyesconfig


All error/warnings:

drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c:31:6: error: redefinition of 'brcmf_debugfs_init'
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.h:123:20: note: previous definition of 'brcmf_debugfs_init' was here
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c:38:6: error: redefinition of 'brcmf_debugfs_exit'
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.h:126:20: note: previous definition of 'brcmf_debugfs_exit' was here
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c:47:5: error: redefinition of 'brcmf_debugfs_attach'
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.h:129:19: note: previous definition of 'brcmf_debugfs_attach' was here
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c: In function 'brcmf_debugfs_attach':
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c:52:6: error: 'struct brcmf_pub' has no member named 'dbgfs_dir'
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c:53:21: error: 'struct brcmf_pub' has no member named 'dbgfs_dir'
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c: At top level:
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c:56:6: error: redefinition of 'brcmf_debugfs_detach'
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.h:133:20: note: previous definition of 'brcmf_debugfs_detach' was here
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c: In function 'brcmf_debugfs_detach':
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c:58:26: error: 'struct brcmf_pub' has no member named 'dbgfs_dir'
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c:59:32: error: 'struct brcmf_pub' has no member named 'dbgfs_dir'
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c: In function 'brcmf_debugfs_get_devdir':
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c:64:13: error: 'struct brcmf_pub' has no member named 'dbgfs_dir'
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c: In function 'brcmf_debugfs_create_sdio_count':
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c:121:30: error: 'struct brcmf_pub' has no member named 'dbgfs_dir'
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c: In function 'brcmf_debugfs_get_devdir':
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c:65:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c: In function 'brcmf_debugfs_attach':
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c:54:1: warning: control reaches end of non-void function [-Wreturn-type]

vim +31 drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c

d319a7cf Arend van Spriel 2012-06-09  25  #include "dhd.h"
d319a7cf Arend van Spriel 2012-06-09  26  #include "dhd_bus.h"
80969836 Arend van Spriel 2012-06-09  27  #include "dhd_dbg.h"
d319a7cf Arend van Spriel 2012-06-09  28  
d319a7cf Arend van Spriel 2012-06-09  29  static struct dentry *root_folder;
d319a7cf Arend van Spriel 2012-06-09  30  
d319a7cf Arend van Spriel 2012-06-09 @31  void brcmf_debugfs_init(void)
d319a7cf Arend van Spriel 2012-06-09  32  {
d319a7cf Arend van Spriel 2012-06-09  33  	root_folder = debugfs_create_dir(KBUILD_MODNAME, NULL);
d319a7cf Arend van Spriel 2012-06-09  34  	if (IS_ERR(root_folder))

The code at line 31 was first introduced by commit:
d319a7c brcmfmac: add debugfs helper functions

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
