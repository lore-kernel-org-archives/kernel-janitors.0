From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:45:24 +0000
Subject: [KJ] [PATCH] 00/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214524.15055.59908.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This set of patches put appropriate KERN_ constants iin all the printk()s in
arch/alpha/kernel.

 core_apecs.c    |   27 ++----
 core_cia.c      |  132 +++++++++++++++---------------
 core_irongate.c |   31 +++----
 core_lca.c      |   57 ++++++-------
 core_marvel.c   |   57 ++++++-------
 core_mcpcia.c   |  122 ++++++++++++++--------------
 core_polaris.c  |   11 +-
 core_t2.c       |   58 ++++++-------
 core_titan.c    |   68 +++++++--------
 core_tsunami.c  |   55 ++++++------
 core_wildfire.c |  157 +++++++++++++++---------------------
 err_common.c    |   66 ++++++---------
 err_ev6.c       |   46 ++++------
 err_ev7.c       |   18 +---
 err_marvel.c    |  243 ++++++++++++++++++++++++++------------------------------
 err_titan.c     |  144 ++++++++++++++++-----------------
 osf_sys.c       |    4
 pci.c           |    8 -
 pci_iommu.c     |   12 +-
 ptrace.c        |    2
 semaphore.c     |   38 +++-----
 setup.c         |   30 +++---
 signal.c        |    4
 smc37c669.c     |   26 ++---
 smc37c93x.c     |   33 +++----
 smp.c           |   58 ++++++-------
 sys_dp264.c     |    2
 sys_eb64p.c     |    2
 sys_jensen.c    |    8 +
 sys_marvel.c    |   14 +--
 sys_nautilus.c  |    4
 sys_sable.c     |    6 -
 sys_sio.c       |    6 -
 sys_titan.c     |    2
 sys_wildfire.c  |    2
 time.c          |    4
 traps.c         |   75 ++++++++---------
 37 files changed, 786 insertions(+), 846 deletions(-)
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
