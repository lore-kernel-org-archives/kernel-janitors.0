From: Avi Kivity <avi@redhat.com>
Date: Wed, 18 Jul 2012 08:51:18 +0000
Subject: Re: [kvm:auto-next 47/61] (.init.rodata+0x830): undefined reference to `x86_hyper_kvm'
Message-Id: <50067906.7050807@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120717175252.GB5545@localhost>
In-Reply-To: <20120717175252.GB5545@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 07/17/2012 08:52 PM, Fengguang Wu wrote:
> Hi Prarit,
> 
> Kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/virt/kvm/kvm.git auto-next
> head:   e08b6fd502fcf6f4a03ca56983f97edb6ea6fef8
> commit: fc73373b33f5f965f2f82bfbc40ef8e6072e986d [47/61] KVM: Add x86_hyper_kvm to complete detect_hypervisor_platform check
> config: x86_64-allyesdebian (attached as .config)
> 
> All related error/warning messages:
> 
> arch/x86/built-in.o: In function `interrupt':
> (.init.rodata+0x830): undefined reference to `x86_hyper_kvm'

I just saw buildbot complaining about the same thing, and posted a patch.


-- 
error compiling committee.c: too many arguments to function


