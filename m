From: Michal Hocko <mhocko@suse.cz>
Date: Fri, 05 Oct 2012 06:58:36 +0000
Subject: Re: [glommer-memcg:kmemcg-stack 33/221] drivers/vfio/pci/vfio_pci.c:464:28: error: 'VM_RESERVED' und
Message-Id: <20121005065836.GA27757@dhcp22.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121005011757.GC6635@localhost>
In-Reply-To: <20121005011757.GC6635@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I have already posted fixup
http://www.spinics.net/lists/linux-mm/msg42993.html

On Fri 05-10-12 09:17:57, Wu Fengguang wrote:
> Hi Konstantin,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/glommer/memcg.git kmemcg-stack
> head:   5ef649339ef370c1858f5471fd8b38a7a82c3b60
> commit: aa011e456e6bd7e4179b03289d7501f8c8444809 [33/221] mm: kill vma flag VM_RESERVED and mm->reserved_vm counter
> config: x86_64-allmodconfig
> 
> Note: the HEAD commit builds fine. It only hurts bisectibility.
> 
> All error/warnings:
> 
> drivers/vfio/pci/vfio_pci.c: In function 'vfio_pci_mmap':
> drivers/vfio/pci/vfio_pci.c:464:28: error: 'VM_RESERVED' undeclared (first use in this function)
> drivers/vfio/pci/vfio_pci.c:464:28: note: each undeclared identifier is reported only once for each function it appears in
> --
> drivers/media/video/videobuf-dma-sg.c: In function '__videobuf_mmap_mapper':
> drivers/media/video/videobuf-dma-sg.c:585:35: error: 'VM_RESERVED' undeclared (first use in this function)
> drivers/media/video/videobuf-dma-sg.c:585:35: note: each undeclared identifier is reported only once for each function it appears in
> --
> drivers/media/video/videobuf2-memops.c: In function 'vb2_mmap_pfn_range':
> drivers/media/video/videobuf2-memops.c:166:36: error: 'VM_RESERVED' undeclared (first use in this function)
> drivers/media/video/videobuf2-memops.c:166:36: note: each undeclared identifier is reported only once for each function it appears in
> 
> vim +464 drivers/vfio/pci/vfio_pci.c
> 
> 89e1f7d4 (Alex Williamson 2012-07-31  458) 			return ret;
> 89e1f7d4 (Alex Williamson 2012-07-31  459) 
> 89e1f7d4 (Alex Williamson 2012-07-31  460) 		vdev->barmap[index] = pci_iomap(pdev, index, 0);
> 89e1f7d4 (Alex Williamson 2012-07-31  461) 	}
> 89e1f7d4 (Alex Williamson 2012-07-31  462) 
> 89e1f7d4 (Alex Williamson 2012-07-31  463) 	vma->vm_private_data = vdev;
> 89e1f7d4 (Alex Williamson 2012-07-31 @464) 	vma->vm_flags |= (VM_IO | VM_RESERVED);
> 89e1f7d4 (Alex Williamson 2012-07-31  465) 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> 89e1f7d4 (Alex Williamson 2012-07-31  466) 
> 89e1f7d4 (Alex Williamson 2012-07-31  467) 	phys = (pci_resource_start(pdev, index) >> PAGE_SHIFT) + pgoff;
> 
> ---
> 0-DAY kernel build testing backend         Open Source Technology Center
> Fengguang Wu, Yuanhan Liu                              Intel Corporation

-- 
Michal Hocko
SUSE Labs
