From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 10 Oct 2018 19:11:38 +0000
Subject: Re: [PATCH -next] drm/amdkfd: Remove set but not used variable 'preempt_all_queues'
Message-Id: <CADnq5_MdvZ0DHJ+fRWqw2V595f_kGYRAV1_790OAAiFAsu8hCg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539049980-186978-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1539049980-186978-1-git-send-email-yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
Cc: Oded Gabbay <oded.gabbay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chunming Zhou <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "Deucher,
 Alexander" <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Christian Koenig <christian.koenig-5C7GfCeVMHo@public.gmane.org>

On Tue, Oct 9, 2018 at 3:37 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c: In function 'destroy_queue_cpsch':
> drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c:1366:7: warning:
>  variable 'preempt_all_queues' set but not used [-Wunused-but-set-variable]
>
> It never used since introduct in
> commit 992839ad64f2 ("drm/amdkfd: Add static user-mode queues support")
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index 4f22e74..06d38b7 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -1363,9 +1363,6 @@ static int destroy_queue_cpsch(struct device_queue_manager *dqm,
>  {
>         int retval;
>         struct mqd_manager *mqd_mgr;
> -       bool preempt_all_queues;
> -
> -       preempt_all_queues = false;
>
>         retval = 0;
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
