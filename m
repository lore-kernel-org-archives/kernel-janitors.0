From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 12 Sep 2012 02:16:47 +0000
Subject: [integrity:next-ima-new-check-module-syscall 32/34] kernel/module.c:2450 copy_module_from_user() war
Message-Id: <20120912021647.GA17485@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Kees,

FYI, there are new smatch warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git next-ima-new-check-module-syscall
head:   3167cf7685efd4855ed9e52e8b2470e8d2dcbf9c
commit: e0eb8f8fe012a54af6d00e0d1573cf1c824023d4 [32/34] module: add syscall to load module from fd

All smatch warnings:

  arch/x86/include/asm/stacktrace.h:112 caller_frame_pointer() error: potentially derefencing uninitialized 'frame'.
  arch/x86/include/asm/jump_label.h:25 arch_static_branch() info: ignoring unreachable code.
+ kernel/module.c:2450 copy_module_from_user() warn: maybe return -EFAULT instead of the bytes remaining?

vim +2450 kernel/module.c
  2440			goto free_hdr;
  2441	
  2442		err = check_info(info);
  2443		if (err)
  2444			goto free_hdr;
  2445	
  2446		return err;
  2447	
  2448	free_hdr:
  2449		vfree(info->hdr);
> 2450		return err;
  2451	}
  2452	
  2453	/* Sets info->hdr and info->len. */
  2454	int copy_module_from_fd(int fd, struct load_info *info)
  2455	{
  2456		struct file *file;
  2457		int err;
  2458		struct kstat stat;
  2459		unsigned long size;
  2460		off_t pos;

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
