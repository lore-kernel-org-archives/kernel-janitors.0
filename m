From: Joe Perches <joe@perches.com>
Date: Tue, 09 May 2017 18:23:19 +0000
Subject: Re: [PATCH] tinydrm: mipi-dbi: Use seq_putc() in mipi_dbi_debugfs_command_show()
Message-Id: <1494354199.20782.5.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2795b611-dfb9-eaf6-e04d-10e27ce96772@users.sourceforge.net>
 <7a6e57ed-7d71-78bc-706e-3a6a1eea3a23@tronnes.org>
In-Reply-To: <7a6e57ed-7d71-78bc-706e-3a6a1eea3a23@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Noralf =?ISO-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>, SF Markus Elfring <elfring@users.sourceforge.net>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>, Fengguang Wu <fengguang.wu@intel.com>, Thierry Reding <treding@nvidia.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, 2017-05-09 at 19:29 +0200, Noralf Tr=F8nnes wrote:
> Den 08.05.2017 13.54, skrev SF Markus Elfring:
> > A single character (line break) should be put into a sequence.
> > Thus use the corresponding function "seq_putc".

Markus, I know this is hard for you,
but think more before sending patches.

> > diff --git a/drivers/gpu/drm/tinydrm/mipi-dbi.c b/drivers/gpu/drm/tinyd=
rm/mipi-dbi.c
[]
> > @@ -946,7 +946,7 @@ static int mipi_dbi_debugfs_command_show(struct seq=
_file *m, void *unused)
> >  =20
> >   		for (i =3D 0; i < len; i++)
> >   			seq_printf(m, "%02x", val[i]);
> > -		seq_puts(m, "\n");
> > +		seq_putc(m, '\n');

Use the %p<foo> extensions.

		seq_printf(m, "%*phN\n", len, val)

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
