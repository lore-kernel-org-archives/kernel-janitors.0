From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 18 Jan 2007 16:12:05 +0000
Subject: [KJ] a quick and dirty doc fixup job, if someone wants it
Message-Id: <Pine.LNX.4.64.0701181101350.21156@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  i was going to take a shot at this but i'm kind of pressed for time
so someone else is welcome to go at it.

  in Documentation/Changes, you see the list of alleged "Current
Minimal Requirements" for building and using the kernel:

o  Gnu C                  3.2                     # gcc --version
o  Gnu make               3.79.1                  # make --version
o  binutils               2.12                    # ld -v
o  util-linux             2.10o                   # fdformat --version
o  module-init-tools      0.9.10                  # depmod -V
o  e2fsprogs              1.29                    # tune2fs
o  jfsutils               1.1.3                   # fsck.jfs -V
o  reiserfsprogs          3.6.3                   # reiserfsck -V 2>&1|grep reiserfsprogs
o  xfsprogs               2.6.0                   # xfs_db -V
o  pcmciautils            004                     # pccardctl -V
o  quota-tools            3.09                    # quota -V
o  PPP                    2.4.0                   # pppd --version
o  isdn4k-utils           3.1pre1                 # isdnctrl 2>&1|grep version
o  nfs-utils              1.0.5                   # showmount --version
o  procps                 3.2.0                   # ps --version
o  oprofile               0.9                     # oprofiled --version
o  udev                   081                     # udevinfo -V

  but that list conflates different categories of software.
certainly, you can't say that something like PPP or isdn4k-utils is a
"minimal requirement" for building a kernel.  (clearly, what some of
those entries mean is that that's the minimal software version of that
package **that will be compatible with the current kernel**.  but
that's obviously not the same as saying that those packages are
necessary for a simple build.)

  it would be nice to break this list up into multiple categories:

1) Absolutely minimal software requirements for building the kernel,
along with their version numbers:

	- gcc
	- GNU make
	- binutils
	- ...

2) Minimal software requirements for building kernel documentation:

	- xmlto
	- docbook stuff and stylesheets
	- jade/openjade
	- ...

3) Minimal requirements for (normally present) basic software:

	- util-linux
	- module-init-tools
	- procps
	- udev
	- ...

4) Additional minimal version requirements, if you choose to use that
software:

	- PPP
	- nfs-utils
	- reiserfsprogs
	- isdn4k-utils
	- ...

i haven't really thought this through very far, i only think that that
list as it is is somewhat misleading as it might mislead someone into
thinking that they need to *install* all that stuff just to build a
new kernel, and i think the actual minimal configuration should be
spelled out more exactly.

  thoughts?

rday
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
