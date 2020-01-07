From: Cornelia Huck <cohuck@redhat.com>
Date: Tue, 07 Jan 2020 09:14:04 +0000
Subject: Re: [PATCH 2/4] vfio: vfio_pci_nvlink2: use mmgrab
Message-Id: <20200107101404.340a3442.cohuck@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577634178-22530-1-git-send-email-Julia.Lawall@inria.fr>
        <1577634178-22530-3-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577634178-22530-3-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: Alex Williamson <alex.williamson@redhat.com>, kernel-janitors@vger.kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 29 Dec 2019 16:42:56 +0100
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
>  drivers/vfio/pci/vfio_pci_nvlink2.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
