From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 02 Oct 2012 12:19:21 +0000
Subject: lib/mpi/generic_mpih-mul1.c:50:3: error: impossible constraint in 'asm'
Message-Id: <20121002121921.GA690@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dmitry,

FYI, kernel build failed on

commit: d9c46b184fcfd33c85a7dc48a653435a08e21f56  crypto: GnuPG based MPI lib - make files (part 3)
config: mips-allmodconfig

All error/warnings:

lib/mpi/generic_mpih-mul1.c: In function 'mpihelp_mul_1':
lib/mpi/generic_mpih-mul1.c:50:3: error: impossible constraint in 'asm'

The code at line 50 (and possibly the error) was first introduced by commit:

cdec9cb crypto: GnuPG based MPI lib - source files (part 1)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
