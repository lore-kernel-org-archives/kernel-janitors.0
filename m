From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Thu, 19 Feb 2004 02:23:13 +0000
Subject: [Kernel-janitors] reference_init.pl for Linux 2.6
Message-Id: <20040218182313.7b7b915e.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kjo <kernel-janitors@osdl.org>
Cc: lkml <linux-kernel@vger.kernel.org>, kaos@ocs.com.au


I have updated Keith Owens "reference_init.pl" script for
Linux 2.6.  It searches for code that refers to other code
sections that they should not reference, such as init code
calling exit code or v.v.

The script searches all .o (non-MODULE) files in the current
directory and sub-directories.  To restrict its scope, just
'cd drivers/video', e.g., to run it.

Notes:  __devinit and __devexit don't mean/do anything if
CONFIG_HOTPLUG=y, so setting CONFIG_HOTPLUG=n and doing a
'make allyesconfig && make all' finds the most possible
problems.  I say 'possible' because there are probably some
false positives reported.

script for Linux 2.6 is at:
http://developer.osdl.org/rddunlap/scripts/reference_init26.pl

and output from Linux 2.6.3 is at:
http://developer.osdl.org/rddunlap/scripts/badrefs.out

Comments/corrections welcome.

--
~Randy
kernel-janitors project:  http://janitor.kernelnewbies.org/
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
