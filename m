From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 21 Sep 2012 11:36:40 +0000
Subject: [next:akpm 340/376] arch/mips/kernel/../../../fs/binfmt_elf.c:1419:2: error: implicit
Message-Id: <20120921113640.GA15444@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Denys,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git akpm
head:   69921c36f9e0e4e7952fa2583bf2d33713835eaf
commit: 0695d4b2814020d99191ba8b441ff8feeb92c878 [340/376] coredump: extend core dump note section to contain file names of mapped files
config: mips-fuloong2e_defconfig

[error]
arch/mips/kernel/../../../fs/binfmt_elf.c:1419:2: error: implicit declaration of function 'vmalloc' [-Werror=implicit-function-declaration]
arch/mips/kernel/../../../fs/binfmt_elf.c:1419:7: error: assignment makes pointer from integer without a cast [-Werror]
arch/mips/kernel/../../../fs/binfmt_elf.c:1437:5: error: implicit declaration of function 'vfree' [-Werror=implicit-function-declaration]

vim +1419 arch/mips/kernel/../../../fs/binfmt_elf.c
  1403	{
  1404		struct vm_area_struct *vma;
  1405		unsigned count, size, names_ofs, remaining, n;
  1406		user_long_t *data;
  1407		user_long_t *start_end_ofs;
  1408		char *name_base, *name_curpos;
  1409	
  1410		/* *Estimated* file count and total data size needed */
  1411		count = current->mm->map_count;
  1412		size = count * 64;
  1413	
  1414		names_ofs = (2 + 3 * count) * sizeof(data[0]);
  1415	 alloc:
  1416		if (size >= MAX_FILE_NOTE_SIZE) /* paranoia check */
  1417			goto err;
  1418		size = round_up(size, PAGE_SIZE);
> 1419		data = vmalloc(size);
  1420		if (!data)
  1421			goto err;
  1422	
  1423		start_end_ofs = data + 2;
  1424		name_base = name_curpos = ((char*)data) + names_ofs;
  1425		remaining = size - names_ofs;
  1426		count = 0;
  1427		for (vma = current->mm->mmap; vma != NULL; vma = vma->vm_next) {

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
