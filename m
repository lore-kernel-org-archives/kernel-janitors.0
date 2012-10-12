From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 12 Oct 2012 16:51:45 +0000
Subject: [xen:stable/for-linus-3.7 35/35] drivers/xen/xenbus/xenbus_xs.c:628:13: warning: function declaratio
Message-Id: <20121012165145.GA19889@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Konrad,

FYI, there are new compile warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/konrad/xen.git stable/for-linus-3.7
head:   cb6b6df111e46b9d0f79eb971575fd50555f43f4
commit: cb6b6df111e46b9d0f79eb971575fd50555f43f4 [35/35] xen/pv-on-hvm kexec: add quirk for Xen 3.4 and shutdown watches.
config: x86_64-allyesconfig # make ARCH=x86_64 allyesconfig

All warnings:

drivers/xen/xenbus/xenbus_xs.c:628:13: warning: function declaration isn't a prototype [-Wstrict-prototypes]

vim +628 drivers/xen/xenbus/xenbus_xs.c

4bac07c9 Jeremy Fitzhardinge   2007-07-17  612  	struct xenbus_watch *i, *cmp;
4bac07c9 Jeremy Fitzhardinge   2007-07-17  613  
4bac07c9 Jeremy Fitzhardinge   2007-07-17  614  	cmp = (void *)simple_strtoul(token, NULL, 16);
4bac07c9 Jeremy Fitzhardinge   2007-07-17  615  
4bac07c9 Jeremy Fitzhardinge   2007-07-17  616  	list_for_each_entry(i, &watches, list)
4bac07c9 Jeremy Fitzhardinge   2007-07-17  617  		if (i = cmp)
4bac07c9 Jeremy Fitzhardinge   2007-07-17  618  			return i;
4bac07c9 Jeremy Fitzhardinge   2007-07-17  619  
4bac07c9 Jeremy Fitzhardinge   2007-07-17  620  	return NULL;
4bac07c9 Jeremy Fitzhardinge   2007-07-17  621  }
cb6b6df1 Konrad Rzeszutek Wilk 2012-10-10  622  /*
cb6b6df1 Konrad Rzeszutek Wilk 2012-10-10  623   * Certain older XenBus toolstack cannot handle reading values that are
cb6b6df1 Konrad Rzeszutek Wilk 2012-10-10  624   * not populated. Some Xen 3.4 installation are incapable of doing this
cb6b6df1 Konrad Rzeszutek Wilk 2012-10-10  625   * so if we are running on anything older than 4 do not attempt to read
cb6b6df1 Konrad Rzeszutek Wilk 2012-10-10  626   * control/platform-feature-xs_reset_watches.
cb6b6df1 Konrad Rzeszutek Wilk 2012-10-10  627   */
cb6b6df1 Konrad Rzeszutek Wilk 2012-10-10 @628  static bool xen_strict_xenbus_quirk()
cb6b6df1 Konrad Rzeszutek Wilk 2012-10-10  629  {
cb6b6df1 Konrad Rzeszutek Wilk 2012-10-10  630  	uint32_t eax, ebx, ecx, edx, base;
cb6b6df1 Konrad Rzeszutek Wilk 2012-10-10  631  
cb6b6df1 Konrad Rzeszutek Wilk 2012-10-10  632  	base = xen_cpuid_base();
cb6b6df1 Konrad Rzeszutek Wilk 2012-10-10  633  	cpuid(base + 1, &eax, &ebx, &ecx, &edx);
4bac07c9 Jeremy Fitzhardinge   2007-07-17  634  
cb6b6df1 Konrad Rzeszutek Wilk 2012-10-10  635  	if ((eax >> 16) < 4)
cb6b6df1 Konrad Rzeszutek Wilk 2012-10-10  636  		return true;

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
