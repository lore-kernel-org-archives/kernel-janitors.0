From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 29 Sep 2015 17:44:57 +0000
Subject: Re: [patch] drm/amdgpu: signedness bug in amdgpu_cs_parser_init()
Message-Id: <CADnq5_Mf0LHs-tMbqs30AK-TF791msfgmyaaYP71RRjmtQEtNg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <A3397C8B8B789E45844E7EC5DEAD89D06E91395A@satlexdag05.amd.com>
 <20150925113655.GA12962@mwanda>
In-Reply-To: <20150925113655.GA12962@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: security@kernel.org, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>, Ilja Van Sprundel <ivansprundel@ioactive.com>, kernel-janitors@vger.kernel.org, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "monk.liu" <monk.liu@amd.com>

On Fri, Sep 25, 2015 at 7:36 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> The "i" variable should be signed or it leads to a crash in the error
> handling code.
>
> Fixes: 1d263474c441 ('drm/amdgpu: unwind properly in amdgpu_cs_parser_init()')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  thanks!

Alex

>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 749420f..cb3c274 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -156,7 +156,8 @@ int amdgpu_cs_parser_init(struct amdgpu_cs_parser *p, void *data)
>         uint64_t *chunk_array_user;
>         uint64_t *chunk_array;
>         struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
> -       unsigned size, i;
> +       unsigned size;
> +       int i;
>         int ret;
>
>         if (cs->in.num_chunks = 0)
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
