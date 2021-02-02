From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 02 Feb 2021 16:38:48 +0000
Subject: Re: [PATCH] drm/amdgpu: Prevent shift wrapping in amdgpu_read_mask()
Message-Id: <CADnq5_Mw+wjzRLhNaGUC7VFS92=GeZ0UwvrhiHMjnXpF1=nMHw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YBjplLOof9J1E2o5@mwanda>
In-Reply-To: <YBjplLOof9J1E2o5@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Xiaojian Du <Xiaojian.Du@amd.com>, David Airlie <airlied@linux.ie>, Kevin Wang <kevin1.wang@amd.com>, kernel-janitors@vger.kernel.org, Nirmoy Das <nirmoy.das@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Eric Huang <JinHuiEric.Huang@amd.com>, Huang Rui <ray.huang@amd.com>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

On Tue, Feb 2, 2021 at 12:57 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> If the user passes a "level" value which is higher than 31 then that
> leads to shift wrapping.  The undefined behavior will lead to a
> syzkaller stack dump.
>
> Fixes: 5632708f4452 ("drm/amd/powerplay: add dpm force multiple levels on cz/tonga/fiji/polaris (v2)")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/pm/amdgpu_pm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> index e9b569b76716..1a4010fcf561 100644
> --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> @@ -1094,7 +1094,7 @@ static ssize_t amdgpu_get_pp_dpm_sclk(struct device *dev,
>  static ssize_t amdgpu_read_mask(const char *buf, size_t count, uint32_t *mask)
>  {
>         int ret;
> -       long level;
> +       unsigned long level;
>         char *sub_str = NULL;
>         char *tmp;
>         char buf_cpy[AMDGPU_MASK_BUF_MAX + 1];
> @@ -1109,9 +1109,9 @@ static ssize_t amdgpu_read_mask(const char *buf, size_t count, uint32_t *mask)
>         tmp = buf_cpy;
>         while (tmp[0]) {
>                 sub_str = strsep(&tmp, delimiter);
> -               if (strlen(sub_str)) {
> -                       ret = kstrtol(sub_str, 0, &level);
> -                       if (ret)
> +               if (sub_str[0]) {
> +                       ret = kstrtoul(sub_str, 0, &level);
> +                       if (ret || level > 31)
>                                 return -EINVAL;
>                         *mask |= 1 << level;
>                 } else
> --
> 2.29.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
