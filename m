From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 20 Oct 2012 03:44:29 +0000
Subject: [kees:module-fd-syscall 1/4] kernel/module.c:2434:3: warning: passing argument 2 of 'mod_verify_sig'
Message-Id: <50821e1d.dEE58tsKTnbtsR5X%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Kees,

FYI, there are new compile warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git module-fd-syscall
head:   3c560638ca92faf6d258a90f2eb49a8d1095840f
commit: e5596ccd94451baa6cbf4029de06724f5ae32185 [1/4] module: add syscall to load module from fd
config: x86_64-allmodconfig # make ARCH=x86_64 allmodconfig

All warnings:

kernel/module.c: In function 'module_sig_check':
kernel/module.c:2434:3: warning: passing argument 2 of 'mod_verify_sig' makes pointer from integer without a cast [enabled by default]
In file included from kernel/module.c:63:0:
kernel/module-internal.h:14:12: note: expected 'long unsigned int *' but argument is of type 'long unsigned int'

vim +2434 kernel/module.c

49668688 Rusty Russell   2010-08-05  2418  					const struct load_info *info)
4f2294b6 Catalin Marinas 2009-06-11  2419  {
4f2294b6 Catalin Marinas 2009-06-11  2420  }
4f2294b6 Catalin Marinas 2009-06-11  2421  #endif
4f2294b6 Catalin Marinas 2009-06-11  2422  
106a4ee2 Rusty Russell   2012-09-26  2423  #ifdef CONFIG_MODULE_SIG
e5596ccd Kees Cook       2012-08-29  2424  static int module_sig_check(struct load_info *info)
106a4ee2 Rusty Russell   2012-09-26  2425  {
106a4ee2 Rusty Russell   2012-09-26  2426  	int err = -ENOKEY;
caabe240 David Howells   2012-10-20  2427  	unsigned long markerlen = sizeof(MODULE_SIG_STRING) - 1;
caabe240 David Howells   2012-10-20  2428  
e5596ccd Kees Cook       2012-08-29  2429  	if (info->len > markerlen &&
e5596ccd Kees Cook       2012-08-29  2430  	    memcmp(info->hdr + info->len - markerlen,
e5596ccd Kees Cook       2012-08-29  2431  		   MODULE_SIG_STRING, markerlen) = 0) {
caabe240 David Howells   2012-10-20  2432  		/* We truncate the module to discard the signature */
e5596ccd Kees Cook       2012-08-29  2433  		info->len -= markerlen;
e5596ccd Kees Cook       2012-08-29 @2434  		err = mod_verify_sig(info->hdr, info->len);
106a4ee2 Rusty Russell   2012-09-26  2435  	}
106a4ee2 Rusty Russell   2012-09-26  2436  
106a4ee2 Rusty Russell   2012-09-26  2437  	if (!err) {
106a4ee2 Rusty Russell   2012-09-26  2438  		info->sig_ok = true;
106a4ee2 Rusty Russell   2012-09-26  2439  		return 0;
106a4ee2 Rusty Russell   2012-09-26  2440  	}
106a4ee2 Rusty Russell   2012-09-26  2441  
106a4ee2 Rusty Russell   2012-09-26  2442  	/* Not having a signature is only an error if we're strict. */

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
