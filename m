From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 15 Mar 2013 20:00:14 +0000
Subject: build regressions 2013-03-15
Message-Id: <51437dce.WRjJFjq894unThn0%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
kernel/trace/trace.c:2959:34: error: 'struct trace_array' has no member named 'max_buffer'
drivers/vhost/vringh.c:83:3: error: implicit declaration of function 'vring_iov_consume' [-Werror=implicit-function-declaration]
arch/mips/include/asm/mach-generic/dma-coherence.h:66:9: error: 'coherentio' undeclared (first use in this function)
arch/mips/include/asm/mach-generic/dma-coherence.h:66:9: error: 'coherentio' undeclared (first use in this function)
arch/mips/include/asm/mach-generic/dma-coherence.h:66:9: error: 'coherentio' undeclared (first use in this function)
arch/mips/include/asm/mach-generic/dma-coherence.h:66:9: error: 'coherentio' undeclared (first use in this function)
arch/mips/include/asm/mach-generic/dma-coherence.h:66:9: error: 'coherentio' undeclared (first use in this function)
arch/mips/include/asm/mach-generic/dma-coherence.h:66:9: error: 'coherentio' undeclared (first use in this function)
arch/mips/include/asm/mach-generic/dma-coherence.h:66:9: error: 'coherentio' undeclared (first use in this function)
arch/mips/include/asm/mach-generic/dma-coherence.h:66:9: error: 'coherentio' undeclared (first use in this function)
arch/mips/include/asm/mach-generic/dma-coherence.h:66:9: error: 'coherentio' undeclared (first use in this function)
arch/mips/include/asm/mach-generic/dma-coherence.h:66:9: error: 'coherentio' undeclared (first use in this function)
arch/mips/kernel/unaligned.c:748:14: error: 'union mips_instruction' has no member named 'mm_i_format'
arch/mips/kernel/unaligned.c:751:15: error: 'union mips_instruction' has no member named 'mm_x_format'
arch/mips/kernel/unaligned.c:753:14: error: 'union mips_instruction' has no member named 'mm_x_format'
arch/mips/kernel/unaligned.c:760:15: error: 'union mips_instruction' has no member named 'mm_m_format'
arch/mips/kernel/unaligned.c:762:14: error: 'union mips_instruction' has no member named 'mm_m_format'
arch/mips/kernel/unaligned.c:781:14: error: 'union mips_instruction' has no member named 'mm_m_format'
arch/mips/kernel/unaligned.c:846:14: error: 'union mips_instruction' has no member named 'mm_m_format'
arch/mips/kernel/unaligned.c:883:14: error: 'union mips_instruction' has no member named 'mm_m_format'
arch/mips/kernel/unaligned.c:1009:15: error: 'union mips_instruction' has no member named 'mm_m_format'
arch/mips/kernel/unaligned.c:1011:14: error: 'union mips_instruction' has no member named 'mm_m_format'
arch/mips/kernel/unaligned.c:1019:15: error: 'union mips_instruction' has no member named 'mm_x_format'
arch/mips/kernel/unaligned.c:1055:13: error: 'union mips_instruction' has no member named 'mm_i_format'
arch/mips/kernel/unaligned.c:1059:13: error: 'union mips_instruction' has no member named 'mm_i_format'
ima_queue.c:(.text+0x10): multiple definition of `ima_read_xattr'
ima_init.c:(.text+0x10): multiple definition of `ima_read_xattr'
ima_main.c:(.text+0x470): multiple definition of `ima_read_xattr'
ima_crypto.c:(.text+0x10): multiple definition of `ima_read_xattr'
ima_api.c:(.text+0x10): multiple definition of `ima_read_xattr'

[warnings]
drivers/infiniband/hw/cxgb4/mem.c:79:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/vhost/net.c:249:20: warning: unused variable 's' [-Wunused-variable]
drivers/vhost/net.c:249:11: warning: unused variable 'out' [-Wunused-variable]
drivers/misc/vmw_vmci/vmci_context.h:131:14: warning: 'src_priv_flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/net/can/janz-ican3.c:994:2: warning: '*((void *)&msg+4)' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/cifs/smb2transport.c:147:11: warning: 'mid' may be used uninitialized in this function [-Wmaybe-uninitialized]
arch/mips/include/asm/mach-generic/dma-coherence.h:68:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/vhost/net.c:331:4: warning: 'len' may be used uninitialized in this function [-Wmaybe-uninitialized]

[sparse]
net/batman-adv/network-coding.c:242:53: sparse: restricted __be32 degrades to integer
net/batman-adv/network-coding.c:946:33: sparse: incorrect type in assignment (different base types)
net/batman-adv/network-coding.c:1557:22: sparse: cast to restricted __be16
net/batman-adv/network-coding.c:1557:22: sparse: cast to restricted __be16
net/batman-adv/network-coding.c:1557:22: sparse: cast to restricted __be16
net/batman-adv/network-coding.c:1557:22: sparse: cast to restricted __be16

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
