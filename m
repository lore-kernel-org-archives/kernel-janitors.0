From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 26 Jul 2012 14:17:51 +0000
Subject: Re: [kvm:auto-next 24/39] (.init.rodata+0x830): undefined reference to `x86_hyper_kvm'
Message-Id: <20120726141751.GA21252@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120726132624.GA20454@localhost>
 <50114D0B.7080302@redhat.com>
 <20120726140312.GA21081@localhost>
 <50115099.1040008@redhat.com>
In-Reply-To: <50115099.1040008@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Avi Kivity <avi@redhat.com>
Cc: Raghavendra K T <raghavendra.kt@linux.vnet.ibm.com>, kernel-janitors@vger.kernel.org, kvm@vger.kernel.org

On Thu, Jul 26, 2012 at 05:13:45PM +0300, Avi Kivity wrote:
> On 07/26/2012 05:03 PM, Fengguang Wu wrote:
> > Hi Avi,
> > 
> > On Thu, Jul 26, 2012 at 04:58:35PM +0300, Avi Kivity wrote:
> >> On 07/26/2012 04:26 PM, Fengguang Wu wrote:
> >> > Hi Raghavendra,
> >> > 
> >> > Kernel build failed on
> >> > 
> >> > tree:   git://git.kernel.org/pub/scm/virt/kvm/kvm.git auto-next
> >> > head:   12938728e8145ecd49dce97c52f10b713bcdfc94
> >> > commit: f2a743473194a1ad44a85f8b63aeef9d63e5bf47 [24/39] KVM: Add config to support ple or cpu relax optimzation
> >> > config: x86_64-alldefconfig (attached as .config)
> >> > 
> >> > All related error/warning messages:
> >> > 
> >> > arch/x86/built-in.o: In function `interrupt':
> >> > (.init.rodata+0x830): undefined reference to `x86_hyper_kvm'
> >> 
> >> Fixed by d63d3e6217c4.
> > 
> > OK, sorry for the noise! Perhaps your tree is not rebaseable? With
> > that knowledge I can arrange to not report transient errors in the
> > tree, and avoid sending unnecessary noises to you.
> 
> 'next' is not rebased, 'auto-next' is.  Please do keep testing, if we
> get too much noise we'll find a way to reduce it.

Got it! I actually do per-branch control policies :-) I've set it up
to report every build error in kvm/auto-next and to only report errors
that still remain at kvm/next/HEAD.

Thanks,
Fengguang
