From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Mon, 14 Mar 2016 13:57:16 +0000
Subject: Re: [patch] drm/amdkfd: uninitialized variable in dbgdev_wave_control_set_registers()
Message-Id: <CAFCwf11Ea1saj1wfJN5bzU5b_qLnDZAkf5-d2HMNwQXi+diV-A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160311075151.GA7902@mwanda>
In-Reply-To: <20160311075151.GA7902@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>

On Fri, Mar 11, 2016 at 9:51 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> At the end of the function we expect "status" to be zero, but it's
> either -EINVAL or unitialized.
>
> Fixes: 788bf83db301 ('drm/amdkfd: Add wave control operation to debugger')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c b/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c
> index c34c393..d5e19b5 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c
> @@ -513,7 +513,7 @@ static int dbgdev_wave_control_set_registers(
>                                 union SQ_CMD_BITS *in_reg_sq_cmd,
>                                 union GRBM_GFX_INDEX_BITS *in_reg_gfx_index)
>  {
> -       int status;
> +       int status = 0;
>         union SQ_CMD_BITS reg_sq_cmd;
>         union GRBM_GFX_INDEX_BITS reg_gfx_index;
>         struct HsaDbgWaveMsgAMDGen2 *pMsg;

Thanks,
applied to my fixes tree.

Oded
