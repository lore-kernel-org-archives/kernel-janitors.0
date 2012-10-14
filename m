From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 14 Oct 2012 02:34:20 +0000
Subject: [uapi:disintegrate-main 3/4] fs/binfmt_elf_fdpic.c:123:12: error: conflicting types for 'elf_fdpic_f
Message-Id: <20121014023420.GE6795@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi David,

FYI, kernel build failed on

tree:   git://git.infradead.org/users/dhowells/linux-headers.git disintegrate-main
head:   5921e6f8809b1616932ca4afd40fe449faa8fd88
commit: 607ca46e97a1b6594b29647d98a32d545c24bdff [3/4] UAPI: (Scripted) Disintegrate include/linux
config: blackfin-BF533-EZKIT_defconfig # make ARCH=blackfin BF533-EZKIT_defconfig

All error/warnings:

fs/binfmt_elf_fdpic.c:60:68: warning: 'struct elf_fdpic_params' declared inside parameter list [enabled by default]
fs/binfmt_elf_fdpic.c:60:68: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
fs/binfmt_elf_fdpic.c:62:17: warning: 'struct elf_fdpic_params' declared inside parameter list [enabled by default]
fs/binfmt_elf_fdpic.c:66:15: warning: 'struct elf_fdpic_params' declared inside parameter list [enabled by default]
fs/binfmt_elf_fdpic.c:73:17: warning: 'struct elf_fdpic_params' declared inside parameter list [enabled by default]
fs/binfmt_elf_fdpic.c:77:33: warning: 'struct elf_fdpic_params' declared inside parameter list [enabled by default]
fs/binfmt_elf_fdpic.c:124:13: warning: 'struct elf_fdpic_params' declared inside parameter list [enabled by default]
fs/binfmt_elf_fdpic.c:123:12: error: conflicting types for 'elf_fdpic_fetch_phdrs'
fs/binfmt_elf_fdpic.c:60:12: note: previous declaration of 'elf_fdpic_fetch_phdrs' was here
fs/binfmt_elf_fdpic.c: In function 'elf_fdpic_fetch_phdrs':
fs/binfmt_elf_fdpic.c:130:12: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:132:12: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:135:15: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:136:8: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:137:13: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:140:35: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:141:24: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:146:15: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:147:30: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:152:10: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:152:21: error: 'ELF_FDPIC_FLAG_EXEC_STACK' undeclared (first use in this function)
fs/binfmt_elf_fdpic.c:152:21: note: each undeclared identifier is reported only once for each function it appears in
fs/binfmt_elf_fdpic.c:154:10: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:154:21: error: 'ELF_FDPIC_FLAG_NOEXEC_STACK' undeclared (first use in this function)
fs/binfmt_elf_fdpic.c:156:9: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c: In function 'load_elf_fdpic_binary':
fs/binfmt_elf_fdpic.c:170:26: error: storage size of 'exec_params' isn't known
fs/binfmt_elf_fdpic.c:170:39: error: storage size of 'interp_params' isn't known
fs/binfmt_elf_fdpic.c:190:22: error: 'ELF_FDPIC_FLAG_PRESENT' undeclared (first use in this function)
fs/binfmt_elf_fdpic.c:190:47: error: 'ELF_FDPIC_FLAG_EXECUTABLE' undeclared (first use in this function)
fs/binfmt_elf_fdpic.c:273:24: error: 'ELF_FDPIC_FLAG_CONSTDISP' undeclared (first use in this function)
fs/binfmt_elf_fdpic.c:290:26: error: 'ELF_FDPIC_FLAG_EXEC_STACK' undeclared (first use in this function)
fs/binfmt_elf_fdpic.c:292:31: error: 'ELF_FDPIC_FLAG_NOEXEC_STACK' undeclared (first use in this function)
fs/binfmt_elf_fdpic.c:170:39: warning: unused variable 'interp_params' [-Wunused-variable]
fs/binfmt_elf_fdpic.c:170:26: warning: unused variable 'exec_params' [-Wunused-variable]
fs/binfmt_elf_fdpic.c: At top level:
fs/binfmt_elf_fdpic.c:478:15: warning: 'struct elf_fdpic_params' declared inside parameter list [enabled by default]
fs/binfmt_elf_fdpic.c:475:12: error: conflicting types for 'create_elf_fdpic_tables'
fs/binfmt_elf_fdpic.c:64:12: note: previous declaration of 'create_elf_fdpic_tables' was here
fs/binfmt_elf_fdpic.c: In function 'create_elf_fdpic_tables':
fs/binfmt_elf_fdpic.c:543:57: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:545:13: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:547:50: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:552:19: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:555:17: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:557:16: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:559:53: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:623:2: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:625:2: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:626:2: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:628:2: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c: At top level:
fs/binfmt_elf_fdpic.c:741:10: warning: 'struct elf_fdpic_params' declared inside parameter list [enabled by default]
fs/binfmt_elf_fdpic.c:738:12: error: conflicting types for 'elf_fdpic_map_file'
fs/binfmt_elf_fdpic.c:61:12: note: previous declaration of 'elf_fdpic_map_file' was here
fs/binfmt_elf_fdpic.c: In function 'elf_fdpic_map_file':
fs/binfmt_elf_fdpic.c:756:30: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:757:13: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:768:8: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:773:20: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:777:16: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:777:26: error: 'ELF_FDPIC_FLAG_ARRANGEMENT' undeclared (first use in this function)
fs/binfmt_elf_fdpic.c:778:7: error: 'ELF_FDPIC_FLAG_CONSTDISP' undeclared (first use in this function)
fs/binfmt_elf_fdpic.c:779:7: error: 'ELF_FDPIC_FLAG_CONTIGUOUS' undeclared (first use in this function)
fs/binfmt_elf_fdpic.c:781:3: warning: passing argument 1 of 'elf_fdpic_map_file_constdisp_on_uclinux' from incompatible pointer type [enabled by default]
fs/binfmt_elf_fdpic.c:71:12: note: expected 'struct elf_fdpic_params *' but argument is of type 'struct elf_fdpic_params *'
fs/binfmt_elf_fdpic.c:787:3: warning: passing argument 1 of 'elf_fdpic_map_file_by_direct_mmap' from incompatible pointer type [enabled by default]
fs/binfmt_elf_fdpic.c:76:12: note: expected 'struct elf_fdpic_params *' but argument is of type 'struct elf_fdpic_params *'
fs/binfmt_elf_fdpic.c:794:12: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:797:14: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:798:14: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:799:11: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:800:13: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:808:15: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:809:16: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:810:15: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:812:30: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:816:30: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:825:11: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:828:12: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:836:15: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:837:30: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:846:11: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:859:16: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c: At top level:
fs/binfmt_elf_fdpic.c:924:9: warning: 'struct elf_fdpic_params' declared inside parameter list [enabled by default]
fs/binfmt_elf_fdpic.c:921:12: error: conflicting types for 'elf_fdpic_map_file_constdisp_on_uclinux'
fs/binfmt_elf_fdpic.c:71:12: note: previous declaration of 'elf_fdpic_map_file_constdisp_on_uclinux' was here
fs/binfmt_elf_fdpic.c: In function 'elf_fdpic_map_file_constdisp_on_uclinux':
fs/binfmt_elf_fdpic.c:932:20: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:933:14: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:937:15: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:938:30: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:939:13: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:950:12: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:950:22: error: 'ELF_FDPIC_FLAG_EXECUTABLE' undeclared (first use in this function)
fs/binfmt_elf_fdpic.c:962:15: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:963:30: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:964:13: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:980:10: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c: At top level:
fs/binfmt_elf_fdpic.c:1015:18: warning: 'struct elf_fdpic_params' declared inside parameter list [enabled by default]
fs/binfmt_elf_fdpic.c:1013:12: error: conflicting types for 'elf_fdpic_map_file_by_direct_mmap'
fs/binfmt_elf_fdpic.c:76:12: note: previous declaration of 'elf_fdpic_map_file_by_direct_mmap' was here
fs/binfmt_elf_fdpic.c: In function 'elf_fdpic_map_file_by_direct_mmap':
fs/binfmt_elf_fdpic.c:1022:20: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:1026:14: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:1029:15: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:1030:30: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:1049:13: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:1049:23: error: 'ELF_FDPIC_FLAG_EXECUTABLE' undeclared (first use in this function)
fs/binfmt_elf_fdpic.c:1054:17: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:1054:27: error: 'ELF_FDPIC_FLAG_ARRANGEMENT' undeclared (first use in this function)
fs/binfmt_elf_fdpic.c:1055:8: error: 'ELF_FDPIC_FLAG_INDEPENDENT' undeclared (first use in this function)
fs/binfmt_elf_fdpic.c:1059:8: error: 'ELF_FDPIC_FLAG_HONOURVADDR' undeclared (first use in this function)
fs/binfmt_elf_fdpic.c:1065:8: error: 'ELF_FDPIC_FLAG_CONSTDISP' undeclared (first use in this function)
fs/binfmt_elf_fdpic.c:1080:8: error: 'ELF_FDPIC_FLAG_CONTIGUOUS' undeclared (first use in this function)
fs/binfmt_elf_fdpic.c:1102:14: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c:1112:10: error: dereferencing pointer to incomplete type
fs/binfmt_elf_fdpic.c: At top level:
fs/binfmt_elf_fdpic.c:61:12: warning: 'elf_fdpic_map_file' used but never defined [enabled by default]
fs/binfmt_elf_fdpic.c:64:12: warning: 'create_elf_fdpic_tables' used but never defined [enabled by default]
fs/binfmt_elf_fdpic.c:71:12: warning: 'elf_fdpic_map_file_constdisp_on_uclinux' used but never defined [enabled by default]
fs/binfmt_elf_fdpic.c:76:12: warning: 'elf_fdpic_map_file_by_direct_mmap' used but never defined [enabled by default]
fs/binfmt_elf_fdpic.c:475:12: warning: 'create_elf_fdpic_tables' defined but not used [-Wunused-function]
fs/binfmt_elf_fdpic.c:738:12: warning: 'elf_fdpic_map_file' defined but not used [-Wunused-function]
fs/binfmt_elf_fdpic.c:921:12: warning: 'elf_fdpic_map_file_constdisp_on_uclinux' defined but not used [-Wunused-function]
fs/binfmt_elf_fdpic.c:1013:12: warning: 'elf_fdpic_map_file_by_direct_mmap' defined but not used [-Wunused-function]

vim +123 fs/binfmt_elf_fdpic.c

^1da177e Linus Torvalds 2005-04-16  107  {
^1da177e Linus Torvalds 2005-04-16  108  	if (memcmp(hdr->e_ident, ELFMAG, SELFMAG) != 0)
^1da177e Linus Torvalds 2005-04-16  109  		return 0;
^1da177e Linus Torvalds 2005-04-16  110  	if (hdr->e_type != ET_EXEC && hdr->e_type != ET_DYN)
^1da177e Linus Torvalds 2005-04-16  111  		return 0;
^1da177e Linus Torvalds 2005-04-16  112  	if (!elf_check_arch(hdr) || !elf_check_fdpic(hdr))
^1da177e Linus Torvalds 2005-04-16  113  		return 0;
^1da177e Linus Torvalds 2005-04-16  114  	if (!file->f_op || !file->f_op->mmap)
^1da177e Linus Torvalds 2005-04-16  115  		return 0;
^1da177e Linus Torvalds 2005-04-16  116  	return 1;
^1da177e Linus Torvalds 2005-04-16  117  }
^1da177e Linus Torvalds 2005-04-16  118  
^1da177e Linus Torvalds 2005-04-16  119  /*****************************************************************************/
^1da177e Linus Torvalds 2005-04-16  120  /*
^1da177e Linus Torvalds 2005-04-16  121   * read the program headers table into memory
^1da177e Linus Torvalds 2005-04-16  122   */
8a2ab7f5 David Howells  2006-07-10 @123  static int elf_fdpic_fetch_phdrs(struct elf_fdpic_params *params,
8a2ab7f5 David Howells  2006-07-10  124  				 struct file *file)
^1da177e Linus Torvalds 2005-04-16  125  {
^1da177e Linus Torvalds 2005-04-16  126  	struct elf32_phdr *phdr;
^1da177e Linus Torvalds 2005-04-16  127  	unsigned long size;
^1da177e Linus Torvalds 2005-04-16  128  	int retval, loop;
^1da177e Linus Torvalds 2005-04-16  129  
^1da177e Linus Torvalds 2005-04-16  130  	if (params->hdr.e_phentsize != sizeof(struct elf_phdr))
^1da177e Linus Torvalds 2005-04-16  131  		return -ENOMEM;

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
