From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Date: Sat, 19 Jul 2014 20:28:41 +0000
Subject: Re: [PATCH 1/5] tools/power/cpupower/utils/helpers/sysfs.c: drop negativity check on unsigned value
Message-Id: <3471157.kIgI5mxtgb@vostro.rjw.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405697445-23620-1-git-send-email-andrey.krieger.utkin@gmail.com> <1405797244-5182-1-git-send-email-andrey.krieger.utkin@gmail.com>
In-Reply-To: <1405797244-5182-1-git-send-email-andrey.krieger.utkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, dcb314@hotmail.com, rafael.j.wysocki@intel.com, trenn@suse.de, linux@dominikbrodowski.net, linux-pm@vger.kernel.org

On Saturday, July 19, 2014 10:14:04 PM Andrey Utkin wrote:
> Resubmitting to send also to linux-pm@vger.kernel.org as requested by
> Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>=20
> ---8<---
>=20
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=80621
> Reported-by: David Binderman <dcb314@hotmail.com>
> Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>

Queued up for 3.17, thanks!

> ---
>  tools/power/cpupower/utils/helpers/sysfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tools/power/cpupower/utils/helpers/sysfs.c b/tools/power/cpu=
power/utils/helpers/sysfs.c
> index 851c7a1..09afe5d 100644
> --- a/tools/power/cpupower/utils/helpers/sysfs.c
> +++ b/tools/power/cpupower/utils/helpers/sysfs.c
> @@ -81,7 +81,7 @@ int sysfs_is_cpu_online(unsigned int cpu)
>  	close(fd);
> =20
>  	value =3D strtoull(linebuf, &endp, 0);
> -	if (value > 1 || value < 0)
> +	if (value > 1)
>  		return -EINVAL;
> =20
>  	return value;
>=20

--=20
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
