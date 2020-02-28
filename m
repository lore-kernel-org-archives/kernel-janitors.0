From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 28 Feb 2020 22:12:45 +0000
Subject: Re: [PATCH][next] drm/amdkfd: fix indentation issue
Message-Id: <CADnq5_NU-GFbj0pTkzjGeMh_J5KM_mNV_NJ_gMFsjt0-Xi=vZw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200228130821.64695-1-colin.king@canonical.com>
In-Reply-To: <20200228130821.64695-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

Applied.  Thanks!

On Fri, Feb 28, 2020 at 8:08 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a statement that is indented with spaces instead of a tab.
> Replace spaces with a tab.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> index f547e4769831..5db42814dd51 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> @@ -490,7 +490,7 @@ static ssize_t node_show(struct kobject *kobj, struct attribute *attr,
>                         dev->node_props.num_sdma_queues_per_engine);
>         sysfs_show_32bit_prop(buffer, "num_cp_queues",
>                         dev->node_props.num_cp_queues);
> -    sysfs_show_64bit_prop(buffer, "unique_id",
> +       sysfs_show_64bit_prop(buffer, "unique_id",
>                         dev->node_props.unique_id);
>
>         if (dev->gpu) {
> --
> 2.25.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
