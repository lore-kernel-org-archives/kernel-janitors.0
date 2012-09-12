From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 12 Sep 2012 03:15:17 +0000
Subject: prism2_scan() warn: variable dereferenced before check 'request'
Message-Id: <20120912031517.GB22076@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Emil,

FYI, there are new sparse warnings show up in

commit 01f8a27e3c9109c0187f473e593fa7b45cdb65e8 staging: wlan-ng: Fix problem with wrong arguments

drivers/staging/wlan-ng/cfg80211.c:345 prism2_scan() warn: variable dereferenced before check 'request' (see line 332)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
