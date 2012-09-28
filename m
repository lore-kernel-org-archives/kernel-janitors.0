From: Josh Triplett <josh@joshtriplett.org>
Date: Fri, 28 Sep 2012 18:59:13 +0000
Subject: Re: [tip:x86/efi 9/11] arch/x86/platform/efi/efi.c:801:11: warning: cast to pointer from integer of
Message-Id: <20120928185912.GC5202@jtriplet-mobl1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120928023439.GA9155@localhost>
In-Reply-To: <20120928023439.GA9155@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Sep 28, 2012 at 10:34:39AM +0800, Fengguang Wu wrote:
> Hi Josh,
> 
> FYI, there are new compile warnings show up in
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/efi
> head:   ba49efa14f97ca6fe57390539e70a359aea779cd
> commit: 429c5a7fa9294e9792116d6ba1016b2cf39572e4 [9/11] efi: Add a function to look up existing IO memory mappings
> config: i386-randconfig-b084 (attached as .config)
> 
> All warnings:
> 
> arch/x86/platform/efi/efi.c: In function 'efi_lookup_mapped_addr':
> arch/x86/platform/efi/efi.c:801:11: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
> 
> vim +801 arch/x86/platform/efi/efi.c
> 
> 429c5a7f (Josh Triplett 2012-09-08  785) {
> 429c5a7f (Josh Triplett 2012-09-08  786) 	void *p;
> 429c5a7f (Josh Triplett 2012-09-08  787) 	if (WARN_ON(!memmap.map))
> 429c5a7f (Josh Triplett 2012-09-08  788) 		return NULL;
> 429c5a7f (Josh Triplett 2012-09-08  789) 	for (p = memmap.map; p < memmap.map_end; p += memmap.desc_size) {
> 429c5a7f (Josh Triplett 2012-09-08  790) 		efi_memory_desc_t *md = p;
> 429c5a7f (Josh Triplett 2012-09-08  791) 		u64 size = md->num_pages << EFI_PAGE_SHIFT;
> 429c5a7f (Josh Triplett 2012-09-08  792) 		u64 end = md->phys_addr + size;
> 429c5a7f (Josh Triplett 2012-09-08  793) 		if (!(md->attribute & EFI_MEMORY_RUNTIME) &&
> 429c5a7f (Josh Triplett 2012-09-08  794) 		    md->type != EFI_BOOT_SERVICES_CODE &&
> 429c5a7f (Josh Triplett 2012-09-08  795) 		    md->type != EFI_BOOT_SERVICES_DATA)
> 429c5a7f (Josh Triplett 2012-09-08  796) 			continue;
> 429c5a7f (Josh Triplett 2012-09-08  797) 		if (!md->virt_addr)
> 429c5a7f (Josh Triplett 2012-09-08  798) 			continue;
> 429c5a7f (Josh Triplett 2012-09-08  799) 		if (phys_addr >= md->phys_addr && phys_addr < end) {
> 429c5a7f (Josh Triplett 2012-09-08  800) 			phys_addr += md->virt_addr - md->phys_addr;
> 429c5a7f (Josh Triplett 2012-09-08 @801) 			return (__force void __iomem *)phys_addr;
> 429c5a7f (Josh Triplett 2012-09-08  802) 		}
> 429c5a7f (Josh Triplett 2012-09-08  803) 	}
> 429c5a7f (Josh Triplett 2012-09-08  804) 	return NULL;
> 429c5a7f (Josh Triplett 2012-09-08  805) }
> 429c5a7f (Josh Triplett 2012-09-08  806) 
> 429c5a7f (Josh Triplett 2012-09-08  807) /*
> 5b83683f (Huang, Ying   2008-01-30  808)  * This function will switch the EFI runtime services to virtual mode.
> 5b83683f (Huang, Ying   2008-01-30  809)  * Essentially, look through the EFI memmap and map every region that

Ah; I hadn't tried compiling this for 32-bit x86, and I'd forgotten the
ridiculous need for a double cast.  Line 801 needs a cast to (unsigned
long) before the cast to (__force void __iomem *).

- Josh Triplett
