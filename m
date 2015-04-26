From: Oded Gabbay <oded.gabbay@amd.com>
Date: Sun, 26 Apr 2015 09:20:26 +0000
Subject: Re: [PATCH] amdkfd: Remove unessary void pointer cast
Message-Id: <553CADDA.7050800@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1429783085-6875-1-git-send-email-firogm@gmail.com>
In-Reply-To: <1429783085-6875-1-git-send-email-firogm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Firo Yang <firogm@gmail.com>, airlied@linux.ie
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org



On 04/23/2015 12:58 PM, Firo Yang wrote:
> kmalloc() returns a void pointer - no need to cast it in
> drivers/gpu/drm/amd/amdkfd/kfd_process.c::kfd_process_destroy_delayed()
>
> Signed-off-by: Firo Yang <firogm@gmail.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_process.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index 945d622..4d7bc95 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -203,8 +203,7 @@ static void kfd_process_destroy_delayed(struct rcu_head *rcu)
>
>   	mmdrop(p->mm);
>
> -	work = (struct kfd_process_release_work *)
> -		kmalloc(sizeof(struct kfd_process_release_work), GFP_ATOMIC);
> +	work = kmalloc(sizeof(struct kfd_process_release_work), GFP_ATOMIC);
>
>   	if (work) {
>   		INIT_WORK((struct work_struct *) work, kfd_process_wq_release);
>
Thanks!
Applied to my -next tree

	Oded
