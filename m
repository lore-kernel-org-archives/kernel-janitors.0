From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 05 Jan 2016 09:06:58 +0000
Subject: Re: [patch] drm/amd/powerplay: fix a reversed condition
Message-Id: <568B87B2.5010105@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160104204255.GB19867@mwanda>
In-Reply-To: <20160104204255.GB19867@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jammy Zhou <Jammy.Zhou@amd.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Julia Lawall <julia.lawall@lip6.fr>, Alex Deucher <alexander.deucher@amd.com>, Rex Zhu <Rex.Zhu@amd.com>

> This test was reversed so it would end up leading to a NULL dereference.
> 
> Fixes: 4630f0faae80 ('drm/amd/powerplay: add Carrizo smu support')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/cz_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/cz_smumgr.c
> index e74023b..873a8d2 100644
> --- a/drivers/gpu/drm/amd/powerplay/smumgr/cz_smumgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/smumgr/cz_smumgr.c
> @@ -818,7 +818,7 @@ static int cz_smu_fini(struct pp_smumgr *smumgr)
>  		return -EINVAL;
>  
>  	cz_smu = (struct cz_smumgr *)smumgr->backend;
> -	if (!cz_smu) {
> +	if (cz_smu) {
>  		cgs_free_gpu_mem(smumgr->device,
>  				cz_smu->toc_buffer.handle);
>  		cgs_free_gpu_mem(smumgr->device,

Was this issue found by an automatic static source code analysis of a tool
like "Smatch"?
https://blogs.oracle.com/linuxkernel/entry/smatch_static_analysis_tool_overview
http://smatch.sourceforge.net/


Would it be useful to detect similar update candidates by the reuse of scripts
for the semantic patch language?
How do you think about to get additional help and support from a software
like Coccinelle for such search patterns?

Regards,
Markus
