From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 19 Sep 2012 11:50:34 +0000
Subject: [cr:crtools-3.6-rc5 5/32] drivers/net/ethernet/qlogic/qlge/qlge.h:353:2: error: expected identifier
Message-Id: <20120919115034.GA14022@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Stanislav,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gorcunov/linux-cr.git crtools-3.6-rc5
head:   36cd0264fd0ce1a3491a59e61c80a990a3107859
commit: d9af6856bd7db9a88136723aeef8837dbbf4e1cf [5/32] ipc: add new SEM_SET command for sys_semctl() call
config: x86_64-allyesdebian

[error]
drivers/net/ethernet/qlogic/qlge/qlge.h:353:2: error: expected identifier before numeric constant
drivers/net/ethernet/qlogic/qlge/qlge_main.c:111:7: error: 'SEM_XGMAC0_MASK' undeclared (first use in this function)
drivers/net/ethernet/qlogic/qlge/qlge_main.c:112:20: error: 'SEM_XGMAC0_SHIFT' undeclared (first use in this function)
drivers/net/ethernet/qlogic/qlge/qlge_main.c:114:7: error: 'SEM_XGMAC1_MASK' undeclared (first use in this function)
drivers/net/ethernet/qlogic/qlge/qlge_main.c:115:20: error: 'SEM_XGMAC1_SHIFT' undeclared (first use in this function)
drivers/net/ethernet/qlogic/qlge/qlge_main.c:117:7: error: 'SEM_ICB_MASK' undeclared (first use in this function)
drivers/net/ethernet/qlogic/qlge/qlge_main.c:118:20: error: 'SEM_ICB_SHIFT' undeclared (first use in this function)
drivers/net/ethernet/qlogic/qlge/qlge_main.c:120:7: error: 'SEM_MAC_ADDR_MASK' undeclared (first use in this function)
drivers/net/ethernet/qlogic/qlge/qlge_main.c:121:20: error: 'SEM_MAC_ADDR_SHIFT' undeclared (first use in this function)
drivers/net/ethernet/qlogic/qlge/qlge_main.c:123:7: error: 'SEM_FLASH_MASK' undeclared (first use in this function)
drivers/net/ethernet/qlogic/qlge/qlge_main.c:124:20: error: 'SEM_FLASH_SHIFT' undeclared (first use in this function)
drivers/net/ethernet/qlogic/qlge/qlge_main.c:126:7: error: 'SEM_PROBE_MASK' undeclared (first use in this function)
drivers/net/ethernet/qlogic/qlge/qlge_main.c:127:20: error: 'SEM_PROBE_SHIFT' undeclared (first use in this function)
drivers/net/ethernet/qlogic/qlge/qlge_main.c:129:7: error: 'SEM_RT_IDX_MASK' undeclared (first use in this function)
drivers/net/ethernet/qlogic/qlge/qlge_main.c:130:20: error: 'SEM_RT_IDX_SHIFT' undeclared (first use in this function)
drivers/net/ethernet/qlogic/qlge/qlge_main.c:132:7: error: 'SEM_PROC_REG_MASK' undeclared (first use in this function)
drivers/net/ethernet/qlogic/qlge/qlge_main.c:133:20: error: 'SEM_PROC_REG_SHIFT' undeclared (first use in this function)
drivers/net/ethernet/qlogic/qlge/qlge_dbg.c:442:33: error: 'SEM_MAC_ADDR_MASK' undeclared (first use in this function)
drivers/net/ethernet/qlogic/qlge/qlge_dbg.c:479:33: error: 'SEM_RT_IDX_MASK' undeclared (first use in this function)
drivers/net/ethernet/qlogic/qlge/qlge_dbg.c:751:24: error: 'SEM_PROC_REG_MASK' undeclared (first use in this function)
drivers/net/ethernet/qlogic/qlge/qlge_mpi.c:130:33: error: 'SEM_PROC_REG_MASK' undeclared (first use in this function)

vim +353 drivers/net/ethernet/qlogic/qlge/qlge.h
   343	
   344	/*
   345	 * Semaphore Register (SEM) bit definitions.
   346	 */
   347	enum {
   348		/*
   349		 * Example:
   350		 * reg = SEM_XGMAC0_MASK | (SEM_SET << SEM_XGMAC0_SHIFT)
   351		 */
   352		SEM_CLEAR = 0,
 > 353		SEM_SET = 1,
   354		SEM_FORCE = 3,
   355		SEM_XGMAC0_SHIFT = 0,
   356		SEM_XGMAC1_SHIFT = 2,
   357		SEM_ICB_SHIFT = 4,
   358		SEM_MAC_ADDR_SHIFT = 6,
   359		SEM_FLASH_SHIFT = 8,
   360		SEM_PROBE_SHIFT = 10,
   361		SEM_RT_IDX_SHIFT = 12,
   362		SEM_PROC_REG_SHIFT = 14,
   363		SEM_XGMAC0_MASK = 0x00030000,

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
