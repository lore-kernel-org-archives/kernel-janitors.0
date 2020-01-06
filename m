From: Alex Williamson <alex.williamson@redhat.com>
Date: Mon, 06 Jan 2020 23:05:07 +0000
Subject: Re: [PATCH 3/4] vfio/spapr_tce: use mmgrab
Message-Id: <20200106160507.3fc1712a@w520.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577634178-22530-1-git-send-email-Julia.Lawall@inria.fr>
        <1577634178-22530-4-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577634178-22530-4-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 29 Dec 2019 16:42:57 +0100
Julia Lawall <Julia.Lawall@inria.fr> wrote:

> Mmgrab was introduced in commit f1f1007644ff ("mm: add new mmgrab()
> helper") and most of the kernel was updated to use it. Update a
> remaining file.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> <smpl>
> @@ expression e; @@
> - atomic_inc(&e->mm_count);
> + mmgrab(e);
> </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
>  drivers/vfio/vfio_iommu_spapr_tce.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/vfio/vfio_iommu_spapr_tce.c b/drivers/vfio/vfio_iommu_spapr_tce.c
> index 26cef65b41e7..16b3adc508db 100644
> --- a/drivers/vfio/vfio_iommu_spapr_tce.c
> +++ b/drivers/vfio/vfio_iommu_spapr_tce.c
> @@ -79,7 +79,7 @@ static long tce_iommu_mm_set(struct tce_container *container)
>  	}
>  	BUG_ON(!current->mm);
>  	container->mm = current->mm;
> -	atomic_inc(&container->mm->mm_count);
> +	mmgrab(container->mm);
>  
>  	return 0;
>  }
> 

Acked-by: Alex Williamson <alex.williamson@redhat.com>
