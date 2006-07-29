From: Neil Horman <nhorman@tuxdriver.com>
Date: Sat, 29 Jul 2006 20:11:39 +0000
Subject: [KJ]  (re) audit return code handling for kernel_thread [0/3]
Message-Id: <20060729201139.GA8574@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org, nhorman@tuxdriver.com, torvalds@osdl.org, akpm@osdl.org, marcel@holtman.org, fpavlic@de.ibm.com, paulus@au.ibm.com, bcollins@debian.org, tony.luck@intel.com

Hello all-
	I recently posted 11 patches to audit the handling of return codes for
calls made to kernel_thread.  I'd like to rescind those patches, in favor of the
following three, which take into account the feedback I've recieved on them.
Specifically these patches are redistributed to only be three patches rather
than 11, so that each patch fixes a class of problem that I found.  Also the
changes for delayed checks of return codes that don't consider negative returns
now properly check for >= 0 codes.  Finally added printks, all have the same
string format, to save space in the string table.

Thanks & Regards
Neil

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
