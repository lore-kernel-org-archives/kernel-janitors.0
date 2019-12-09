From: Julia Lawall <julia.lawall@inria.fr>
Date: Mon, 09 Dec 2019 10:21:57 +0000
Subject: Re: [PATCH] drm/vmwgfx: Replace deprecated PTR_RET
Message-Id: <1606305704.12702713.1575886917867.JavaMail.zimbra@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191208105328.15335-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20191208105328.15335-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Sinclair Yeh <syeh@vmware.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-graphics-maintainer@vmware.com

> De: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
> =C0: "Thomas Hellstrom" <thellstrom@vmware.com>, dri-devel@lists.freedesk=
top.org
> Cc: "David Airlie" <airlied@linux.ie>, "Daniel Vetter" <daniel@ffwll.ch>,=
 "Sinclair Yeh" <syeh@vmware.com>,
> linux-graphics-maintainer@vmware.com, kernel-janitors@vger.kernel.org, li=
nux-kernel@vger.kernel.org, "Lukas Bulwahn"
> <lukas.bulwahn@gmail.com>
> Envoy=E9: Dimanche 8 D=E9cembre 2019 18:53:28
> Objet: [PATCH] drm/vmwgfx: Replace deprecated PTR_RET

> Commit 508108ea2747 ("drm/vmwgfx: Don't refcount command-buffer managed
> resource lookups during command buffer validation") slips in use of
> deprecated PTR_RET. Use PTR_ERR_OR_ZERO instead.
>=20
> As the PTR_ERR_OR_ZERO is a bit longer than PTR_RET, we introduce
> local variable ret for proper indentation and line-length limits.

Is 0 actually possible?  I have the impression that it is not, but perhaps =
I missed something.

julia


> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on current master (9455d25f4e3b) and next-20191207
> compile-tested on x86_64_defconfig + DRM_VMWGFX=3Dy
>=20
> drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 21 +++++++++++++++------
> 1 file changed, 15 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> index 934ad7c0c342..73489a45decb 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -2377,9 +2377,12 @@ static int vmw_cmd_dx_clear_rendertarget_view(stru=
ct
> vmw_private *dev_priv,
> {
> 	VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdDXClearRenderTargetView) > 		containe=
r_of(header, typeof(*cmd), header);
> +	struct vmw_resource *ret;
>=20
> -	return PTR_RET(vmw_view_id_val_add(sw_context, vmw_view_rt,
> -					   cmd->body.renderTargetViewId));
> +	ret =3D vmw_view_id_val_add(sw_context, vmw_view_rt,
> +				  cmd->body.renderTargetViewId);
> +
> +	return PTR_ERR_OR_ZERO(ret);
> }
>=20
> /**
> @@ -2396,9 +2399,12 @@ static int vmw_cmd_dx_clear_depthstencil_view(stru=
ct
> vmw_private *dev_priv,
> {
> 	VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdDXClearDepthStencilView) > 		containe=
r_of(header, typeof(*cmd), header);
> +	struct vmw_resource *ret;
> +
> +	ret =3D vmw_view_id_val_add(sw_context, vmw_view_ds,
> +				  cmd->body.depthStencilViewId);
>=20
> -	return PTR_RET(vmw_view_id_val_add(sw_context, vmw_view_ds,
> -					   cmd->body.depthStencilViewId));
> +	return PTR_ERR_OR_ZERO(ret);
> }
>=20
> static int vmw_cmd_dx_view_define(struct vmw_private *dev_priv,
> @@ -2741,9 +2747,12 @@ static int vmw_cmd_dx_genmips(struct vmw_private
> *dev_priv,
> {
> 	VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdDXGenMips) > 		container_of(header, t=
ypeof(*cmd), header);
> +	struct vmw_resource *ret;
> +
> +	ret =3D vmw_view_id_val_add(sw_context, vmw_view_sr,
> +				  cmd->body.shaderResourceViewId);
>=20
> -	return PTR_RET(vmw_view_id_val_add(sw_context, vmw_view_sr,
> -					   cmd->body.shaderResourceViewId));
> +	return PTR_ERR_OR_ZERO(ret);
> }
>=20
> /**
> --
> 2.17.1
