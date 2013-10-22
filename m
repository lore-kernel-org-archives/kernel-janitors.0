From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 22 Oct 2013 09:06:36 +0000
Subject: build regressions 2013-10-21
Message-Id: <5266401c.ZEtB9od8yxa1yrr9%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
sound/pci/hda/patch_hdmi.c:1955:3: error: implicit declaration of function 'eld_proc_new' [-Werror=implicit-function-declaration]
sound/pci/hda/patch_hdmi.c:1998:3: error: implicit declaration of function 'eld_proc_free' [-Werror=implicit-function-declaration]

[warnings]
net/mac80211/cfg.c:3017:28: warning: unused variable 'ifmsh' [-Wunused-variable]

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
