From: Bruno =?UTF-8?B?UHLDqW1vbnQ=?= <bonbons@linux-vserver.org>
Date: Tue, 25 Apr 2017 06:40:51 +0000
Subject: Re: [PATCH 7/7] HID: picoLCD: Replace two seq_printf() calls by seq_puts() in picolcd_debug_reset_sh
Message-Id: <20170425084051.5b981b48@pluto.restena.lu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2d526d72-a740-367b-04a9-ed698435f8ed@users.sourceforge.net>
        <ceee0ae6-fd37-66b6-116a-319f5e393327@users.sourceforge.net>
In-Reply-To: <ceee0ae6-fd37-66b6-116a-319f5e393327@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-iio@vger.kernel.org, linux-input@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Henrik Rydberg <rydberg@bitmath.org>, Jiri Kosina <jikos@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Acked-by: Bruno Pr=C3=A9mont <bonbons@linux-vserver.org>

On Mon, 24 Apr 2017 22:23:02 +0200 SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 24 Apr 2017 21:27:42 +0200
>=20
> Strings which did not contain data format specifications should be put
> into a sequence. Thus use the corresponding function "seq_puts".
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/hid/hid-picolcd_debugfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/hid/hid-picolcd_debugfs.c b/drivers/hid/hid-picolcd_=
debugfs.c
> index 3e0feb4bb538..975f36601d59 100644
> --- a/drivers/hid/hid-picolcd_debugfs.c
> +++ b/drivers/hid/hid-picolcd_debugfs.c
> @@ -33,9 +33,9 @@
>  static int picolcd_debug_reset_show(struct seq_file *f, void *p)
>  {
>  	if (picolcd_fbinfo((struct picolcd_data *)f->private))
> -		seq_printf(f, "all fb\n");
> +		seq_puts(f, "all fb\n");
>  	else
> -		seq_printf(f, "all\n");
> +		seq_puts(f, "all\n");
>  	return 0;
>  }
> =20
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
