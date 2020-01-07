From: Julia Lawall <julia.lawall@inria.fr>
Date: Tue, 07 Jan 2020 17:00:31 +0000
Subject: Re: [PATCH 2/4] vfio: vfio_pci_nvlink2: use mmgrab
Message-Id: <alpine.DEB.2.21.2001071800090.3004@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577634178-22530-1-git-send-email-Julia.Lawall@inria.fr> <1577634178-22530-3-git-send-email-Julia.Lawall@inria.fr> <20200106160505.2f962d38@w520.home>
In-Reply-To: <20200106160505.2f962d38@w520.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Williamson <alex.williamson@redhat.com>
Cc: kernel-janitors@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org



On Mon, 6 Jan 2020, Alex Williamson wrote:

> On Sun, 29 Dec 2019 16:42:56 +0100
> Julia Lawall <Julia.Lawall@inria.fr> wrote:
>
> > Mmgrab was introduced in commit f1f1007644ff ("mm: add new mmgrab()
> > helper") and most of the kernel was updated to use it. Update a
> > remaining file.
> >
> > The semantic patch that makes this change is as follows:
> > (http://coccinelle.lip6.fr/)
> >
> > <smpl>
> > @@ expression e; @@
> > - atomic_inc(&e->mm_count);
> > + mmgrab(e);
> > </smpl>
> >
> > Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> >
> > ---
> >  drivers/vfio/pci/vfio_pci_nvlink2.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/vfio/pci/vfio_pci_nvlink2.c b/drivers/vfio/pci/vfio_pci_nvlink2.c
> > index f2983f0f84be..43df10af7f66 100644
> > --- a/drivers/vfio/pci/vfio_pci_nvlink2.c
> > +++ b/drivers/vfio/pci/vfio_pci_nvlink2.c
> > @@ -159,7 +159,7 @@ static int vfio_pci_nvgpu_mmap(struct vfio_pci_device *vdev,
> >  	data->useraddr = vma->vm_start;
> >  	data->mm = current->mm;
> >
> > -	atomic_inc(&data->mm->mm_count);
> > +	mmgrab(data->mm);
> >  	ret = (int) mm_iommu_newdev(data->mm, data->useraddr,
> >  			vma_pages(vma), data->gpu_hpa, &data->mem);
> >
> >
>
> Acked-by: Alex Williamson <alex.williamson@redhat.com>
>
> Thanks!  I'm assuming these will be routed via janitors tree, please
> let me know if you intend me to grab these two vfio patches from the
> series.  Thanks,

Please take them directly.

thanks,
julia
