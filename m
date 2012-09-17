From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 17 Sep 2012 23:55:37 +0000
Subject: [target:for-next 5/17] drivers/target/target_core_transport.c:582:22: error: 'struct
Message-Id: <20120917235537.GA9080@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Roland,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/nab/target-pending.git for-next
head:   0b79bb0e7b960c6a4347d7c7a3afeea67e28e51e
commit: 3537078956521a5dd79a413da4342fbcd3e30e9d [5/17] target: Simplify fabric sense data length handling
config: x86_64-allmodconfig

All related error/warning messages:

drivers/target/target_core_transport.c: In function 'transport_get_sense_buffer':
drivers/target/target_core_transport.c:582:22: error: 'struct target_core_fabric_ops' has no member named 'set_fabric_sense_len'

vim +582 drivers/target/target_core_transport.c
   577			return NULL;
   578	
   579		if (cmd->se_cmd_flags & SCF_SENT_CHECK_CONDITION)
   580			return NULL;
   581	
 > 582		offset = cmd->se_tfo->set_fabric_sense_len(cmd, TRANSPORT_SENSE_BUFFER);
   583	
   584		/* Automatically padded */
   585		cmd->scsi_sense_length = TRANSPORT_SENSE_BUFFER + offset;
   586	
   587		pr_debug("HBA_[%u]_PLUG[%s]: Requesting sense for SAM STATUS: 0x%02x\n",

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
