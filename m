From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 21 Apr 2013 20:19:56 +0000
Subject: build regressions 2013-04-21
Message-Id: <517449ec.BxIn9fvApLirUsdr%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[smatch]
drivers/target/tcm_fc/tfc_io.c:298 ft_recv_write_data() error: potential NULL dereference 'sg'.
drivers/scsi/bfa/bfa_fcpim.c:3227 bfa_tskim_res_recfg() error: potentially dereferencing uninitialized 'qe'.
drivers/scsi/bfa/bfa_fcpim.c:3338 bfa_fcp_res_recfg() error: potentially dereferencing uninitialized 'qe'.
drivers/scsi/bfa/bfa_svc.c:1177 bfa_fcxp_res_recfg() error: potentially dereferencing uninitialized 'qe'.
drivers/scsi/bfa/bfa_svc.c:4661 bfa_rport_res_recfg() error: potentially dereferencing uninitialized 'qe'.
drivers/scsi/bfa/bfa_svc.c:5222 bfa_uf_res_recfg() error: potentially dereferencing uninitialized 'qe'.

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
