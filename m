From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 21 Sep 2012 11:27:40 +0000
Subject: [can:master 118/170] ERROR: "sysctl_llc_station_ack_timeout" [net/llc/llc2.ko] undefined!
Message-Id: <20120921112740.GA15164@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Hutchings <ben@decadent.org.uk>
Cc: kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, linux-can@vger.kernel.org

Hi Ben,

FYI, kernel build failed on

tree:   git://gitorious.org/linux-can/linux-can-next master
head:   029d8ada9150a1177f09148284b5cd27a30d4db7
commit: 025e36332573177ecd7c12730e18a4390f994f05 [118/170] llc2: Remove dead code for state machine
config: x86_64-allmodconfig

All related error/warning messages:

ERROR: "sysctl_llc_station_ack_timeout" [net/llc/llc2.ko] undefined!

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
