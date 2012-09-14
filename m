From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 14 Sep 2012 16:50:01 +0000
Subject: [scsi:misc 49/55] drivers/scsi/mvumi.c:1880:3: error: implicit declaration of function 'virt_to_bus'
Message-Id: <20120914165001.GB22939@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shun Fu <fushun@gmail.com>
Cc: kernel-janitors@vger.kernel.org, James Bottomley <JBottomley@Parallels.com>, linux-scsi@vger.kernel.org

Hi Shun,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git misc
head:   e1daec5547bdb8a53b023852d578409005c69ea7
commit: 8b3fa849abc2b62920d7e4fc4f8e6ce3d0783623 [49/55] [SCSI] mvumi: Add support for Marvell SAS/SATA RAID-on-Chip(ROC) 88RC9580
config: powerpc-allmodconfig

All related error/warning messages:

drivers/scsi/mvumi.c: In function 'mvumi_send_command':
drivers/scsi/mvumi.c:1880:3: error: implicit declaration of function 'virt_to_bus' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors

vim +1880 drivers/scsi/mvumi.c
  1875		frame_len = sizeof(*ib_frame) - 4 +
  1876					ib_frame->sg_counts * sizeof(struct mvumi_sgl);
  1877		if (mhba->hba_capability & HS_CAPABILITY_SUPPORT_DYN_SRC) {
  1878			struct mvumi_dyn_list_entry *dle;
  1879			dle = ib_entry;
> 1880			dle->src_low_addr = virt_to_bus(ib_frame) & 0xFFFFFFFF;
  1881			dle->src_high_addr   1882				((virt_to_bus(ib_frame) >> 16) >> 16) & 0xFFFFFFFF;
  1883			dle->if_length = (frame_len >> 2) & 0xFFF;
  1884		} else {
  1885			memcpy(ib_entry, ib_frame, frame_len);

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
