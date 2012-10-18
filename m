From: Yuanhan Liu <yuanhan.liu@intel.com>
Date: Thu, 18 Oct 2012 03:32:47 +0000
Subject: [uapi:uapi-fixes 7/10] arch/s390/include/asm/kvm_para.h:147:28: error: redefinition of 'kvm_arch_par
Message-Id: <20121018033247.GO21995@yliu-dev.sh.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi David,

FYI, kernel build failed on

tree:   git://git.infradead.org/users/dhowells/linux-headers.git uapi-fixes
head:   bb2bab177408e44079ba6bd37242fa8b26dfc2a7
commit: 0420c87e648a3b623ad925038a0bcff2ef5a4bc9 [7/10] UAPI: Put a comment into uapi/asm-generic/kvm_para.h and use it from arches
config: s390-allmodconfig # make ARCH=s390 allmodconfig

All error/warnings:

In file included from drivers/s390/kvm/kvm_virtio.c:26:0:
arch/s390/include/asm/kvm_para.h:147:28: error: redefinition of 'kvm_arch_para_features'
In file included from arch/s390/include/generated/uapi/asm/kvm_para.h:1:0,
                 from arch/s390/include/asm/kvm_para.h:29,
                 from drivers/s390/kvm/kvm_virtio.c:26:
include/asm-generic/kvm_para.h:16:28: note: previous definition of 'kvm_arch_para_features' was here
In file included from drivers/s390/kvm/kvm_virtio.c:26:0:
arch/s390/include/asm/kvm_para.h:152:20: error: redefinition of 'kvm_check_and_clear_guest_paused'
In file included from arch/s390/include/generated/uapi/asm/kvm_para.h:1:0,
                 from arch/s390/include/asm/kvm_para.h:29,
                 from drivers/s390/kvm/kvm_virtio.c:26:
include/asm-generic/kvm_para.h:11:20: note: previous definition of 'kvm_check_and_clear_guest_paused' was here

vim +147 arch/s390/include/asm/kvm_para.h

e976a2b9 include/asm-s390/kvm_para.h      Christian Borntraeger 2008-03-25  131  	register long __rc asm("2");
e976a2b9 include/asm-s390/kvm_para.h      Christian Borntraeger 2008-03-25  132  
e976a2b9 include/asm-s390/kvm_para.h      Christian Borntraeger 2008-03-25  133  	asm volatile ("diag 2,4,0x500\n"
e976a2b9 include/asm-s390/kvm_para.h      Christian Borntraeger 2008-03-25  134  		      : "=d" (__rc) : "d" (__nr), "0" (__p1), "d" (__p2),
e976a2b9 include/asm-s390/kvm_para.h      Christian Borntraeger 2008-03-25  135  			"d" (__p3), "d" (__p4), "d" (__p5), "d" (__p6)
e976a2b9 include/asm-s390/kvm_para.h      Christian Borntraeger 2008-03-25  136  		      : "memory", "cc");
e976a2b9 include/asm-s390/kvm_para.h      Christian Borntraeger 2008-03-25  137  	return __rc;
e976a2b9 include/asm-s390/kvm_para.h      Christian Borntraeger 2008-03-25  138  }
e976a2b9 include/asm-s390/kvm_para.h      Christian Borntraeger 2008-03-25  139  
e976a2b9 include/asm-s390/kvm_para.h      Christian Borntraeger 2008-03-25  140  /* kvm on s390 is always paravirtualization enabled */
b0c632db include/asm-s390/kvm_para.h      Heiko Carstens        2008-03-25  141  static inline int kvm_para_available(void)
b0c632db include/asm-s390/kvm_para.h      Heiko Carstens        2008-03-25  142  {
e976a2b9 include/asm-s390/kvm_para.h      Christian Borntraeger 2008-03-25  143  	return 1;
b0c632db include/asm-s390/kvm_para.h      Heiko Carstens        2008-03-25  144  }
b0c632db include/asm-s390/kvm_para.h      Heiko Carstens        2008-03-25  145  
e976a2b9 include/asm-s390/kvm_para.h      Christian Borntraeger 2008-03-25  146  /* No feature bits are currently assigned for kvm on s390 */
b0c632db include/asm-s390/kvm_para.h      Heiko Carstens        2008-03-25 @147  static inline unsigned int kvm_arch_para_features(void)
b0c632db include/asm-s390/kvm_para.h      Heiko Carstens        2008-03-25  148  {
b0c632db include/asm-s390/kvm_para.h      Heiko Carstens        2008-03-25  149  	return 0;
b0c632db include/asm-s390/kvm_para.h      Heiko Carstens        2008-03-25  150  }
b0c632db include/asm-s390/kvm_para.h      Heiko Carstens        2008-03-25  151  
3b5d56b9 arch/s390/include/asm/kvm_para.h Eric B Munson         2012-03-10  152  static inline bool kvm_check_and_clear_guest_paused(void)
3b5d56b9 arch/s390/include/asm/kvm_para.h Eric B Munson         2012-03-10  153  {
3b5d56b9 arch/s390/include/asm/kvm_para.h Eric B Munson         2012-03-10  154  	return false;
3b5d56b9 arch/s390/include/asm/kvm_para.h Eric B Munson         2012-03-10  155  }

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
