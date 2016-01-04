From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 04 Jan 2016 21:17:58 +0000
Subject: Re: [patch] drm/amd/powerplay: fix a reversed condition
Message-Id: <CADnq5_Ma47TnhKTUcFD7SncUp=4nwqj7-yjrxEiGs8U79v75CA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160104204255.GB19867@mwanda>
In-Reply-To: <20160104204255.GB19867@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jammy Zhou <Jammy.Zhou@amd.com>, kernel-janitors@vger.kernel.org, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, Rex Zhu <Rex.Zhu@amd.com>

On Mon, Jan 4, 2016 at 3:42 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> This test was reversed so it would end up leading to a NULL dereference.
>
> Fixes: 4630f0faae80 ('drm/amd/powerplay: add Carrizo smu support')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  thanks!

Alex

>
> diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/cz_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/cz_smumgr.c
> index e74023b..873a8d2 100644
> --- a/drivers/gpu/drm/amd/powerplay/smumgr/cz_smumgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/smumgr/cz_smumgr.c
> @@ -818,7 +818,7 @@ static int cz_smu_fini(struct pp_smumgr *smumgr)
>                 return -EINVAL;
>
>         cz_smu = (struct cz_smumgr *)smumgr->backend;
> -       if (!cz_smu) {
> +       if (cz_smu) {
>                 cgs_free_gpu_mem(smumgr->device,
>                                 cz_smu->toc_buffer.handle);
>                 cgs_free_gpu_mem(smumgr->device,
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
