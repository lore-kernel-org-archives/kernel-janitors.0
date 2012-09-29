From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 29 Sep 2012 01:28:25 +0000
Subject: lib/dynamic_debug.c:1036:6: warning: passing argument 7 of 'parse_args' from incompatible pointer ty
Message-Id: <20120929012825.GB10871@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Andy,

FYI, there are new compile warnings show up in

commit: 84925a91b2fb2b0ee48736fac94e08ece70f4169  UBUNTU: SAUCE: add option to hand off all kernel parameters to init
config: mips-allmodconfig

All warnings:

lib/dynamic_debug.c: In function 'dynamic_debug_init':
lib/dynamic_debug.c:1036:6: warning: passing argument 7 of 'parse_args' from incompatible pointer type [enabled by default]
In file included from include/linux/module.h:17:0,
                 from lib/dynamic_debug.c:16:
include/linux/moduleparam.h:317:12: note: expected 'int (*)(char *, char *, const char *, int)' but argument is of type 'int (*)(char *, char *, const char *)'

vim +1036 lib/dynamic_debug.c

85f7f6c0 (Jim Cromie       2011-12-19  1020) 		if (ret < 0)
4ad275e5 (Joe Perches      2011-08-11  1021) 			pr_warn("Invalid ddebug boot param %s",
4ad275e5 (Joe Perches      2011-08-11  1022) 				ddebug_setup_string);
a648ec05 (Thomas Renninger 2010-08-06  1023) 		else
85f7f6c0 (Jim Cromie       2011-12-19  1024) 			pr_info("%d changes by ddebug_query\n", ret);
a648ec05 (Thomas Renninger 2010-08-06  1025) 	}
b48420c1 (Jim Cromie       2012-04-27  1026) 	/* now that ddebug tables are loaded, process all boot args
b48420c1 (Jim Cromie       2012-04-27  1027) 	 * again to find and activate queries given in dyndbg params.
b48420c1 (Jim Cromie       2012-04-27  1028) 	 * While this has already been done for known boot params, it
b48420c1 (Jim Cromie       2012-04-27  1029) 	 * ignored the unknown ones (dyndbg in particular).  Reusing
b48420c1 (Jim Cromie       2012-04-27  1030) 	 * parse_args avoids ad-hoc parsing.  This will also attempt
b48420c1 (Jim Cromie       2012-04-27  1031) 	 * to activate queries for not-yet-loaded modules, which is
b48420c1 (Jim Cromie       2012-04-27  1032) 	 * slightly noisy if verbose, but harmless.
b48420c1 (Jim Cromie       2012-04-27  1033) 	 */
b48420c1 (Jim Cromie       2012-04-27  1034) 	cmdline = kstrdup(saved_command_line, GFP_KERNEL);
b48420c1 (Jim Cromie       2012-04-27  1035) 	parse_args("dyndbg params", cmdline, NULL,
b48420c1 (Jim Cromie       2012-04-27 @1036) 		   0, 0, 0, &ddebug_dyndbg_boot_param_cb);
b48420c1 (Jim Cromie       2012-04-27  1037) 	kfree(cmdline);
af442399 (Jim Cromie       2012-04-27  1038) 	return 0;
a648ec05 (Thomas Renninger 2010-08-06  1039) 
af442399 (Jim Cromie       2012-04-27  1040) out_err:
af442399 (Jim Cromie       2012-04-27  1041) 	ddebug_remove_all_tables();
e9d376f0 (Jason Baron      2009-02-05  1042) 	return 0;
e9d376f0 (Jason Baron      2009-02-05  1043) }
6a5c083d (Thomas Renninger 2010-08-06  1044) /* Allow early initialization for boot messages via boot param */

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
