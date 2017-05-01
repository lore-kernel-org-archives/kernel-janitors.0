From: Joe Perches <joe@perches.com>
Date: Mon, 01 May 2017 17:11:27 +0000
Subject: Re: [PATCH 1/4] drm/dp: Use seq_putc() in drm_dp_mst_dump_topology()
Message-Id: <1493658687.6621.3.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1949e36b-5039-a7b6-5774-6ada7eb05ea6@users.sourceforge.net>
         <da81ee94-9bbc-1754-b92f-40bcdbe923fa@users.sourceforge.net>
In-Reply-To: <da81ee94-9bbc-1754-b92f-40bcdbe923fa@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, Sean Paul <seanpaul@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, 2017-05-01 at 18:46 +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 1 May 2017 17:08:56 +0200
>=20
> A few single characters (line breaks) should be put into a sequence.
> Thus use the corresponding function "seq_putc".
>=20
> This issue was detected by using the Coccinelle software.
[]
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_=
dp_mst_topology.c
[]
> @@ -2840,17 +2840,17 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
>  		seq_printf(m, "dpcd: ");
>  		for (i =3D 0; i < DP_RECEIVER_CAP_SIZE; i++)
>  			seq_printf(m, "%02x ", buf[i]);
> -		seq_printf(m, "\n");
> +		seq_putc(m, '\n');
>  		ret =3D drm_dp_dpcd_read(mgr->aux, DP_FAUX_CAP, buf, 2);
>  		seq_printf(m, "faux/mst: ");
>  		for (i =3D 0; i < 2; i++)
>  			seq_printf(m, "%02x ", buf[i]);
> -		seq_printf(m, "\n");
> +		seq_putc(m, '\n');
>  		ret =3D drm_dp_dpcd_read(mgr->aux, DP_MSTM_CTRL, buf, 1);
>  		seq_printf(m, "mst ctrl: ");
>  		for (i =3D 0; i < 1; i++)
>  			seq_printf(m, "%02x ", buf[i]);
> -		seq_printf(m, "\n");
> +		seq_putc(m, '\n');

Please don't be _just_ mechanical.

Stop and read the code the tools=A0you use using
suggest modifying and see how you can improve
it for a human reader.

If you're really trying to improve these to make
them more readable or smaller object code size,=20
you should use the vsprintf extensions like:

		seq_printf(m, "dpcd: %*ph\n", DP_RECEIVER_CAP_SIZE, buf);

And if these are supposed to be correct, then
the return value from drm_dp_dpcd_read should
be tested too.

Likely these repeated code blocks could be put
into a helper function.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
