From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 26 Nov 2012 13:17:10 +0000
Subject: Re: build regressions 2012-10-23
Message-Id: <20121126131710.GA2603@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121023170322.GA31879@localhost>
In-Reply-To: <20121023170322.GA31879@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Nov 26, 2012 at 11:57:25AM +0100, Bernd Petrovitsch wrote:
> Hi!
> 
> On Mit, 2012-10-24 at 01:03 +0800, Fengguang Wu wrote:
> [...]
> > This is the first daily summary from the 0day build test system.
> > Ideas on better format/contents are warmly welcome!
> > 
> > [errors]
> > drivers/usb/host/ohci-sm501.c:241:2: error: implicit declaration of function 'ohci_finish_controller_resume' [-Werror=implicit-function-declaration]
> > arch/x86/xen/smp.c:329:7: error: 'struct vcpu_guest_context' has no member named 'u'
> [...]
> 
> Perhaps I miss something but how does one reproduce that?
> 
> Which "version" - in terms of "git-URL" - did you use?
> Which kernel-.config:
> - allymodconfig, allyesconfig or something else)?
> - The $ARCH can probably inferred with the filenames ....
> Which parameters on which tool/program?
> 
> Do you have a page on the web which explains all of this (or at least
> the more static parts).

No, I'm yet to setup such a web page.. However for your first
questions, here is the related internal report:

Subject: [xen:devel/pvh.5 2/8] arch/x86/xen/smp.c:329:7: error: 'struct
 vcpu_guest_context' has no member named 'u'
Reply-To: 
User-Agent: Heirloom mailx 12.5 6/20/10

:::::: GOOD BISECT! error line is exactly introduced by the commit
:::::: bisect time: 0m


rsync kbuild@bee:/tmp/x86_64-allyesconfig-bisect-2012-10-23-04-46.log /tmp/log/x86_64-allyesconfig-bisect-2012-10-23-04-46.log
less /tmp/log/x86_64-allyesconfig-bisect-2012-10-23-04-46.log

/c/kernel-tests/reproduce-build 4d80210f4 dfc557a5c x86_64-allyesconfig arch/x86/xen/smp.c

grep -r . /cc/kernel-tests/kernels/x86_64-allyesconfig/44f3e2b/build-error/
grep -r . /cc/kernel-tests/kernels/x86_64-allyesconfig/4d80210/build-error/
/c/kernel-tests/list-head xen:devel:pvh.5:dfc557a x86_64-allyesconfig

TO: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

Hi Konrad,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/konrad/xen.git devel/pvh.5
head:   dfc557a5c9a519b45b79ad059821db15bad229fa
commit: 4d80210f4948a962c9ecca2773da69c0b2affb62 [2/8] xen/smp: Move the common CPU init code a bit to prep for PVH patch.
config: x86_64-allyesconfig # make ARCH=x86_64 allyesconfig
:::::: branch date: 24 minutes ago
:::::: commit date: 24 minutes ago

Note: the xen/devel/pvh.5 HEAD dfc557a builds fine.
      It only hurts bisectibility.

All error/warnings:

arch/x86/xen/smp.c: In function 'cpu_initialize_context':
arch/x86/xen/smp.c:329:7: error: 'struct vcpu_guest_context' has no member named 'u'
arch/x86/xen/smp.c:330:7: error: 'struct vcpu_guest_context' has no member named 'u'

git remote update xen
git checkout 4d80210f4948a962c9ecca2773da69c0b2affb62
vim +329 arch/x86/xen/smp.c

4d80210f arch/x86/xen/smp.c  Konrad Rzeszutek Wilk 2012-10-22  323  		BUG_ON((unsigned long)gdt & ~PAGE_MASK);
f87e4cac arch/i386/xen/smp.c Jeremy Fitzhardinge   2007-07-17  324  
4d80210f arch/x86/xen/smp.c  Konrad Rzeszutek Wilk 2012-10-22  325  		gdt_mfn = arbitrary_virt_to_mfn(gdt);
4d80210f arch/x86/xen/smp.c  Konrad Rzeszutek Wilk 2012-10-22  326  		make_lowmem_page_readonly(gdt);
4d80210f arch/x86/xen/smp.c  Konrad Rzeszutek Wilk 2012-10-22  327  		make_lowmem_page_readonly(mfn_to_virt(gdt_mfn));
f87e4cac arch/i386/xen/smp.c Jeremy Fitzhardinge   2007-07-17  328  
4d80210f arch/x86/xen/smp.c  Konrad Rzeszutek Wilk 2012-10-22 @329  		ctxt->u.pv.gdt_frames[0] = gdt_mfn;
4d80210f arch/x86/xen/smp.c  Konrad Rzeszutek Wilk 2012-10-22  330  		ctxt->u.pv.gdt_ents      = GDT_ENTRIES;
f87e4cac arch/i386/xen/smp.c Jeremy Fitzhardinge   2007-07-17  331  
4d80210f arch/x86/xen/smp.c  Konrad Rzeszutek Wilk 2012-10-22  332  		ctxt->kernel_ss = __KERNEL_DS;

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
