From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 04 Jan 2016 21:19:10 +0000
Subject: Re: [patch] drm/amdgpu/cgs: cleanup some indenting
Message-Id: <CADnq5_MbPu9TCjKr2xuiM3hJvDaniB-Cu8bYYsuKDpnoUyp8HA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160104204347.GC19867@mwanda>
In-Reply-To: <20160104204347.GC19867@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jammy Zhou <Jammy.Zhou@amd.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, Eric Huang <JinHuiEric.Huang@amd.com>, Rex Zhu <Rex.Zhu@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

On Mon, Jan 4, 2016 at 3:43 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> This code is indented too far.  Also we normally use spaces to align if
> statement conditions.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  thanks!

Alex

>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
> index 6fa0fea..59485d0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
> @@ -843,15 +843,15 @@ static int amdgpu_cgs_acpi_eval_object(void *cgs_device,
>         if (info->input_count > 0) {
>                 if (info->pinput_argument = NULL)
>                         return -EINVAL;
> -                       argument = info->pinput_argument;
> -                       func_no = argument->value;
> -                       for (i = 0; i < info->input_count; i++) {
> -                               if (((argument->type = ACPI_TYPE_STRING) ||
> -                                       (argument->type = ACPI_TYPE_BUFFER))
> -                                       && (argument->pointer = NULL))
> -                                       return -EINVAL;
> -                               argument++;
> -                       }
> +               argument = info->pinput_argument;
> +               func_no = argument->value;
> +               for (i = 0; i < info->input_count; i++) {
> +                       if (((argument->type = ACPI_TYPE_STRING) ||
> +                            (argument->type = ACPI_TYPE_BUFFER)) &&
> +                           (argument->pointer = NULL))
> +                               return -EINVAL;
> +                       argument++;
> +               }
>         }
>
>         if (info->output_count > 0) {
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
