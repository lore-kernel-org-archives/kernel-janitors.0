From: Joerg Roedel <joerg.roedel@amd.com>
Date: Wed, 08 Aug 2012 10:44:12 +0000
Subject: Re: [iommu:ioapic-cleanups 17/19] arch/x86/built-in.o:(.data+0x288): undefined reference to `native_
Message-Id: <20120808104412.GR1996@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120807192751.GA5762@localhost>
In-Reply-To: <20120807192751.GA5762@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Fengguang,

On Wed, Aug 08, 2012 at 03:27:51AM +0800, Fengguang Wu wrote:
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git ioapic-cleanups
> head:   25b140f9d56483def20a4a6cd54766a55508c132
> commit: 3f3c5417231f180b2f0fba968caa91979cb6e3f0 [17/19] x86, msi: Introduce x86_msi.compose_msi_msg call-back
> config: i386-randconfig-b732 (attached as .config)
> 
> All related error/warning messages:
> 
> arch/x86/built-in.o:(.data+0x288): undefined reference to `native_compose_msi_msg'
> 
> i386-randconfig-b731 all accumulated errors:
> 
> arch/x86/kernel/x86_init.c:118:21: error: 'native_compose_msi_msg' undeclared here (not in a function)
> arch/x86/kernel/x86_init.c:130:14: error: 'native_disable_io_apic' undeclared here (not in a function)
> arch/x86/kernel/x86_init.c:131:20: error: 'native_io_apic_print_entries' undeclared here (not in a function)
> arch/x86/kernel/x86_init.c:133:18: error: 'native_setup_ioapic_entry' undeclared here (not in a function)
> arch/x86/kernel/x86_init.c:134:21: error: 'native_setup_timer_pin' undeclared here (not in a function)

Thanks a lot for your build-testing :) I fixed the issues you sent me and
found a couple more of them which I fixed too.

Thanks again,

       Joerg


