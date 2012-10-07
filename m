From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 07 Oct 2012 00:20:16 +0000
Subject: kernel/sys.c:1868:2: warning: passing argument 2 of 'access_ok' makes pointer from integer without a
Message-Id: <20121007002016.GA5678@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Cyrill,

FYI, there are new compile warnings show up in

commit: 20e61e149ba9a4fe4c4867a76e399879d802e669  prctl: use access_ok() instead of TASK_SIZE in prctl_set_mm()
config: m68k-allmodconfig

All warnings:

kernel/sys.c: In function 'prctl_set_mm':
kernel/sys.c:1868:2: warning: passing argument 2 of 'access_ok' makes pointer from integer without a cast [enabled by default]
arch/m68k/include/asm/uaccess_mm.h:17:19: note: expected 'const void *' but argument is of type 'long unsigned int'

vim +1868 kernel/sys.c

028ee4be (Cyrill Gorcunov 2012-01-12  1852) 			unsigned long arg4, unsigned long arg5)
028ee4be (Cyrill Gorcunov 2012-01-12  1853) {
028ee4be (Cyrill Gorcunov 2012-01-12  1854) 	unsigned long rlim = rlimit(RLIMIT_DATA);
028ee4be (Cyrill Gorcunov 2012-01-12  1855) 	struct mm_struct *mm = current->mm;
fe8c7f5c (Cyrill Gorcunov 2012-05-31  1856) 	struct vm_area_struct *vma;
fe8c7f5c (Cyrill Gorcunov 2012-05-31  1857) 	int error;
028ee4be (Cyrill Gorcunov 2012-01-12  1858) 
fe8c7f5c (Cyrill Gorcunov 2012-05-31  1859) 	if (arg5 || (arg4 && opt != PR_SET_MM_AUXV))
028ee4be (Cyrill Gorcunov 2012-01-12  1860) 		return -EINVAL;
028ee4be (Cyrill Gorcunov 2012-01-12  1861) 
79f0713d (Cyrill Gorcunov 2012-03-15  1862) 	if (!capable(CAP_SYS_RESOURCE))
028ee4be (Cyrill Gorcunov 2012-01-12  1863) 		return -EPERM;
028ee4be (Cyrill Gorcunov 2012-01-12  1864) 
b32dfe37 (Cyrill Gorcunov 2012-05-31  1865) 	if (opt = PR_SET_MM_EXE_FILE)
b32dfe37 (Cyrill Gorcunov 2012-05-31  1866) 		return prctl_set_mm_exe_file(mm, (unsigned int)addr);
b32dfe37 (Cyrill Gorcunov 2012-05-31  1867) 
20e61e14 (Cyrill Gorcunov 2012-09-26 @1868) 	if (!access_ok(VERIFY_READ, addr, sizeof(addr)) || addr < mmap_min_addr)
028ee4be (Cyrill Gorcunov 2012-01-12  1869) 		return -EINVAL;
028ee4be (Cyrill Gorcunov 2012-01-12  1870) 
fe8c7f5c (Cyrill Gorcunov 2012-05-31  1871) 	error = -EINVAL;
fe8c7f5c (Cyrill Gorcunov 2012-05-31  1872) 
028ee4be (Cyrill Gorcunov 2012-01-12  1873) 	down_read(&mm->mmap_sem);
028ee4be (Cyrill Gorcunov 2012-01-12  1874) 	vma = find_vma(mm, addr);
028ee4be (Cyrill Gorcunov 2012-01-12  1875) 
028ee4be (Cyrill Gorcunov 2012-01-12  1876) 	switch (opt) {

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
