From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 16 Oct 2012 03:17:08 +0000
Subject: drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c:50:6: error: 'struct brcmf_pub' has no member name
Message-Id: <20121016031708.GA16754@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Arend,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux master
head:   29bb4cc5e0547a7589556f8629e39016c5d203c0
commit: d319a7cfd9d80a2e2359e978ba88991531312ee6 brcmfmac: add debugfs helper functions
config: cris-allyesconfig # make ARCH=cris allyesconfig
date:   4 months ago

All error/warnings:

drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c: In function 'brcmf_debugfs_attach':
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c:50:6: error: 'struct brcmf_pub' has no member named 'dbgfs_dir'
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c:51:21: error: 'struct brcmf_pub' has no member named 'dbgfs_dir'
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c: In function 'brcmf_debugfs_detach':
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c:56:26: error: 'struct brcmf_pub' has no member named 'dbgfs_dir'
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c:57:32: error: 'struct brcmf_pub' has no member named 'dbgfs_dir'
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c: In function 'brcmf_debugfs_get_devdir':
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c:62:13: error: 'struct brcmf_pub' has no member named 'dbgfs_dir'
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c:63:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c: In function 'brcmf_debugfs_attach':
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c:52:1: warning: control reaches end of non-void function [-Wreturn-type]

vim +50 drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c

d319a7cf Arend van Spriel 2012-06-09  44  
d319a7cf Arend van Spriel 2012-06-09  45  int brcmf_debugfs_attach(struct brcmf_pub *drvr)
d319a7cf Arend van Spriel 2012-06-09  46  {
d319a7cf Arend van Spriel 2012-06-09  47  	if (!root_folder)
d319a7cf Arend van Spriel 2012-06-09  48  		return -ENODEV;
d319a7cf Arend van Spriel 2012-06-09  49  
d319a7cf Arend van Spriel 2012-06-09 @50  	drvr->dbgfs_dir = debugfs_create_dir(dev_name(drvr->dev), root_folder);
d319a7cf Arend van Spriel 2012-06-09  51  	return PTR_RET(drvr->dbgfs_dir);
d319a7cf Arend van Spriel 2012-06-09  52  }
d319a7cf Arend van Spriel 2012-06-09  53  

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
