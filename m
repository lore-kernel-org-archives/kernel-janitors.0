From: Joerg Roedel <joerg.roedel@amd.com>
Date: Wed, 08 Aug 2012 12:29:44 +0000
Subject: Re: [iommu:ioapic-cleanups 17/19] arch/x86/built-in.o:(.data+0x288): undefined reference to `native_
Message-Id: <20120808122944.GS1996@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120807192751.GA5762@localhost>
In-Reply-To: <20120807192751.GA5762@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Aug 08, 2012 at 06:53:46PM +0800, Fengguang Wu wrote:
> You are welcome. Yeah I'm a bit afraid of flooding you with all the
> below emails which look like the same class of errors. So you should
> (and proved to) be smart enough to figure out the others :)
> 
>  796   F Aug 08 To wfg@linux.in (1806:1) [iommu:ioapic-cleanups 3/19] arch/x86/kernel/x86_init.c:127:14: error: 'native_disable_io_apic' undeclared here
>  797   F Aug 08 To wfg@linux.in (1807:1) [iommu:ioapic-cleanups 4/19] arch/x86/kernel/x86_init.c:128:20: error: 'native_io_apic_print_entries' undeclared
>  798   F Aug 08 To wfg@linux.in (1808:1) [iommu:ioapic-cleanups 8/19] arch/x86/kernel/x86_init.c:132:18: error: 'native_setup_ioapic_entry' undeclared he
>  799   F Aug 08 To wfg@linux.in (1809:1) [iommu:ioapic-cleanups 10/19] arch/x86/kernel/x86_init.c:133:21: error: 'native_setup_timer_pin' undeclared here
>  800   F Aug 08 To wfg@linux.in (1812:1) [iommu:ioapic-cleanups 17/19] arch/x86/kernel/x86_init.c:118:21: error: 'native_compose_msi_msg' undeclared here
>  801   F Aug 08 To wfg@linux.in (1694:1) [iommu:ioapic-cleanups 17/19] arch/x86/built-in.o:(.data+0x288): undefined reference to `native_compose_msi_msg'
>  804   F Aug 08 To wfg@linux.in (2194:1) [iommu:ioapic-cleanups 18/19] arch/x86/kernel/x86_init.c:135:21: error: 'native_eoi_ioapic_pin' undeclared here
>  824   F Aug 08 To wfg@linux.in (1657:1) [iommu:ioapic-cleanups 5/19] arch/x86/kernel/x86_init.c:121:21: error: 'default_setup_hpet_msi' undeclared here

Yeah, this looks like a complete list of the issues I fixed :)

Thanks again,

       Joerg

-- 
AMD Operating System Research Center

Advanced Micro Devices GmbH Einsteinring 24 85609 Dornach
General Managers: Alberto Bozzo
Registration: Dornach, Landkr. Muenchen; Registerger. Muenchen, HRB Nr. 43632

