From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Date: Tue, 09 May 2017 17:29:39 +0000
Subject: Re: [PATCH] tinydrm: mipi-dbi: Use seq_putc() in mipi_dbi_debugfs_command_show()
Message-Id: <7a6e57ed-7d71-78bc-706e-3a6a1eea3a23@tronnes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2795b611-dfb9-eaf6-e04d-10e27ce96772@users.sourceforge.net>
In-Reply-To: <2795b611-dfb9-eaf6-e04d-10e27ce96772@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>, Fengguang Wu <fengguang.wu@intel.com>, Thierry Reding <treding@nvidia.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>


Den 08.05.2017 13.54, skrev SF Markus Elfring:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 8 May 2017 13:42:03 +0200
>
> A single character (line break) should be put into a sequence.
> Thus use the corresponding function "seq_putc".
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Thanks,

Acked-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>

>   drivers/gpu/drm/tinydrm/mipi-dbi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/tinydrm/mipi-dbi.c b/drivers/gpu/drm/tinydrm=
/mipi-dbi.c
> index f4eb412f3604..54d66b732d55 100644
> --- a/drivers/gpu/drm/tinydrm/mipi-dbi.c
> +++ b/drivers/gpu/drm/tinydrm/mipi-dbi.c
> @@ -946,7 +946,7 @@ static int mipi_dbi_debugfs_command_show(struct seq_f=
ile *m, void *unused)
>  =20
>   		for (i =3D 0; i < len; i++)
>   			seq_printf(m, "%02x", val[i]);
> -		seq_puts(m, "\n");
> +		seq_putc(m, '\n');
>   	}
>  =20
>   	return 0;

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
