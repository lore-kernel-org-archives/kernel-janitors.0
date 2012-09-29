From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 29 Sep 2012 01:22:22 +0000
Subject: init/main.c:302: warning: 'pass_all_bootoptions' defined but not used
Message-Id: <20120929012222.GA10871@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Mathieu,

FYI, there are new compile warnings show up in

84925a9 UBUNTU: SAUCE: add option to hand off all kernel parameters to init
config: avr32-atngw100_defconfig

All warnings:

init/main.c:302: warning: 'pass_all_bootoptions' defined but not used

vim +302 init/main.c

^1da177e (Linus Torvalds 2005-04-16  286) 			if (i = MAX_INIT_ARGS) {
^1da177e (Linus Torvalds 2005-04-16  287) 				panic_later = "Too many boot init vars at `%s'";
^1da177e (Linus Torvalds 2005-04-16  288) 				panic_param = param;
^1da177e (Linus Torvalds 2005-04-16  289) 			}
^1da177e (Linus Torvalds 2005-04-16  290) 		}
^1da177e (Linus Torvalds 2005-04-16  291) 		argv_init[i] = param;
^1da177e (Linus Torvalds 2005-04-16  292) 	}
^1da177e (Linus Torvalds 2005-04-16  293) 	return 0;
^1da177e (Linus Torvalds 2005-04-16  294) }
84925a91 (Andy Whitcroft 2010-06-17  295) static int __init pass_unknown_bootoptions(char *param, char *val, const char *unused, int known)
84925a91 (Andy Whitcroft 2010-06-17  296) {
84925a91 (Andy Whitcroft 2010-06-17  297) 	if (known)
84925a91 (Andy Whitcroft 2010-06-17  298) 		return 0;
84925a91 (Andy Whitcroft 2010-06-17  299) 	return pass_bootoption(param, val, unused, 0);
84925a91 (Andy Whitcroft 2010-06-17  300) }
84925a91 (Andy Whitcroft 2010-06-17  301) static int __init pass_all_bootoptions(char *param, char *val, const char *unused, int known)
84925a91 (Andy Whitcroft 2010-06-17 @302) {
84925a91 (Andy Whitcroft 2010-06-17  303) 	return pass_bootoption(param, val, unused, 1);
84925a91 (Andy Whitcroft 2010-06-17  304) }
^1da177e (Linus Torvalds 2005-04-16  305) 
^1da177e (Linus Torvalds 2005-04-16  306) static int __init init_setup(char *str)
^1da177e (Linus Torvalds 2005-04-16  307) {
^1da177e (Linus Torvalds 2005-04-16  308) 	unsigned int i;
^1da177e (Linus Torvalds 2005-04-16  309) 
^1da177e (Linus Torvalds 2005-04-16  310) 	execute_command = str;

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
