From: Avi Kivity <avi@redhat.com>
Date: Thu, 26 Jul 2012 13:58:35 +0000
Subject: Re: [kvm:auto-next 24/39] (.init.rodata+0x830): undefined reference to `x86_hyper_kvm'
Message-Id: <50114D0B.7080302@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120726132624.GA20454@localhost>
In-Reply-To: <20120726132624.GA20454@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: Raghavendra K T <raghavendra.kt@linux.vnet.ibm.com>, kernel-janitors@vger.kernel.org, kvm@vger.kernel.org

On 07/26/2012 04:26 PM, Fengguang Wu wrote:
> Hi Raghavendra,
> 
> Kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/virt/kvm/kvm.git auto-next
> head:   12938728e8145ecd49dce97c52f10b713bcdfc94
> commit: f2a743473194a1ad44a85f8b63aeef9d63e5bf47 [24/39] KVM: Add config to support ple or cpu relax optimzation
> config: x86_64-alldefconfig (attached as .config)
> 
> All related error/warning messages:
> 
> arch/x86/built-in.o: In function `interrupt':
> (.init.rodata+0x830): undefined reference to `x86_hyper_kvm'

Fixed by d63d3e6217c4.


-- 
error compiling committee.c: too many arguments to function


