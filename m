From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 27 Sep 2012 07:46:22 +0000
Subject: [cryptodev:master 38/41] arch/x86/crypto/crc32c-pcl-intel-asm.S:92: Error: bad register name `%rbx'
Message-Id: <20120927074622.GA726@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Tim,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
head:   11c8484924441def7941bdc62ddb03643bc8f989
commit: c4d68f14dfbbf075906a0dcf355e0392347efda9 [38/41] crypto: crc32c- Optimize CRC32C calculation with PCLMULQDQ instruction
config: i386-allmodconfig

All error/warnings:

arch/x86/crypto/crc32c-pcl-intel-asm.S: Assembler messages:
arch/x86/crypto/crc32c-pcl-intel-asm.S:92: Error: bad register name `%rbx'
arch/x86/crypto/crc32c-pcl-intel-asm.S:93: Error: bad register name `%rdi'
arch/x86/crypto/crc32c-pcl-intel-asm.S:94: Error: bad register name `%rsi'
arch/x86/crypto/crc32c-pcl-intel-asm.S:97: Error: bad register name `%rdx'
arch/x86/crypto/crc32c-pcl-intel-asm.S:103: Error: bad register name `%rdi'
arch/x86/crypto/crc32c-pcl-intel-asm.S:104: Error: bad register name `%rdi'
arch/x86/crypto/crc32c-pcl-intel-asm.S:105: Error: bad register name `%rdi'
arch/x86/crypto/crc32c-pcl-intel-asm.S:111: Error: bad register name `%rsi'
arch/x86/crypto/crc32c-pcl-intel-asm.S:120: Error: bad register name `%rcx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:121: Error: bad register name `%rdi'
arch/x86/crypto/crc32c-pcl-intel-asm.S:123: Error: bad register name `%rdi'
arch/x86/crypto/crc32c-pcl-intel-asm.S:125: Error: bad register name `%r8d'
arch/x86/crypto/crc32c-pcl-intel-asm.S:126: Error: bad register name `%rbx'
arch/x86/crypto/crc32c-pcl-intel-asm.S:127: Error: bad register name `%rdi'
arch/x86/crypto/crc32c-pcl-intel-asm.S:137: Error: bad register name `%rsi'
arch/x86/crypto/crc32c-pcl-intel-asm.S:139: Error: bad register name `%rsi'
arch/x86/crypto/crc32c-pcl-intel-asm.S:143: Error: bad register name `%rsi'
arch/x86/crypto/crc32c-pcl-intel-asm.S:147: Error: bad register name `%rax'
arch/x86/crypto/crc32c-pcl-intel-asm.S:149: Error: bad register name `%rax'
arch/x86/crypto/crc32c-pcl-intel-asm.S:159: Error: bad register name `%rcx,%rax,8)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:160: Error: bad register name `%rcx,%rax,8)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:161: Error: bad register name `%rdx,%rax,8)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:163: Error: bad register name `%r9'
arch/x86/crypto/crc32c-pcl-intel-asm.S:164: Error: bad register name `%r10'
arch/x86/crypto/crc32c-pcl-intel-asm.S:167: Error: bad register name `%rip)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:168: Error: bad register name `%rdi,%rax,2)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:170: Error: bad register name `%rdi,%rsi,1)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:171: Error: bad register name `%rdi'
arch/x86/crypto/crc32c-pcl-intel-asm.S:177: Error: bad register name `%rax'
arch/x86/crypto/crc32c-pcl-intel-asm.S:178: Error: bad register name `%rcx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:179: Error: bad register name `%rcx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:180: Error: bad register name `%rcx'
arch/x86/crypto/crc32c-pcl-intel-asm.S:182: Error: bad register name `%r9'
arch/x86/crypto/crc32c-pcl-intel-asm.S:183: Error: bad register name `%r10'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rcx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rdx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%r11)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rcx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rdx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%r11)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rcx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rdx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%r11)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rcx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rdx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%r11)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rcx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rdx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%r11)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rcx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rdx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%r11)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rcx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rdx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%r11)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rcx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rdx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%r11)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rcx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rdx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%r11)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rcx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rdx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%r11)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rcx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rdx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%r11)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rcx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rdx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%r11)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rcx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rdx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%r11)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rcx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rdx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%r11)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rcx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rdx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%r11)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rcx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rdx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%r11)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rcx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rdx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%r11)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rcx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rdx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%r11)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rcx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rdx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%r11)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rcx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rdx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%r11)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rcx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rdx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%r11)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rcx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rdx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%r11)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rcx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rdx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%r11)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rcx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rdx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%r11)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rcx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rdx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%r11)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rcx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rdx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%r11)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rcx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rdx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%r11)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rcx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rdx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%r11)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rcx)'
arch/x86/crypto/crc32c-pcl-intel-asm.S:201: Error: bad register name `%rdx)'

vim +92 arch/x86/crypto/crc32c-pcl-intel-asm.S

c4d68f14 (Tim Chen 2012-09-25  86) #define    tmp		%rbx
c4d68f14 (Tim Chen 2012-09-25  87) #define    crc_init	%r8
c4d68f14 (Tim Chen 2012-09-25  88) #define    crc_init_dw	%r8d
c4d68f14 (Tim Chen 2012-09-25  89) #define    crc1		%r9
c4d68f14 (Tim Chen 2012-09-25  90) #define    crc2		%r10
c4d68f14 (Tim Chen 2012-09-25  91) 
c4d68f14 (Tim Chen 2012-09-25 @92) 	pushq   %rbx
c4d68f14 (Tim Chen 2012-09-25  93) 	pushq   %rdi
c4d68f14 (Tim Chen 2012-09-25  94) 	pushq   %rsi
c4d68f14 (Tim Chen 2012-09-25  95) 

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
