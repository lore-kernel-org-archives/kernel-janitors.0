From: Felipe Balbi <balbi@kernel.org>
Date: Mon, 04 Apr 2016 12:18:06 +0000
Subject: Re: [patch] usb: gadget: f_midi: unlock on error
Message-Id: <87mvp96001.fsf@intel.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160402045108.GD11775@mwanda>
In-Reply-To: <20160402045108.GD11775@mwanda>
To: kernel-janitors@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Michal Nazarewicz <mina86@mina86.com> writes:

> On Sat, Apr 02 2016, Dan Carpenter wrote:
>> We added some new locking here, but missed an error path where we need
>> to unlock.
>>
>> Fixes: 9acdf4df2fc4 ('usb: gadget: f_midi: added spinlock on transmit fu=
nction')
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>
> Acked-by: Michal Nazarewicz <mina86@mina86.com>
>
> But perhaps this would be cleaner:

both options below are not real fixes and, as such, as not subject to
the -rc cycle.

thanks

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXAlt/AAoJEIaOsuA1yqRE4nAP/jEpOgsIYWQIV0Zd0setVBBk
VRk4IIO7DFmUUk4pXMygEmdxB3PqlwW2CzIb5HwUk/va9/+P7GKyHZMHwJd57yx/
gyB3fXbvr/gWWNe/K9EmCBpCN5ox5z5UOD2+VAI0ZPKo0aFkJWlqL8DtYd2xtxLY
E+qt5ybUe5iou3xAzkSIiqwgKBVQQnSWuPYmYSOBLC1IgfBAl3WyK5AjMVILAc+d
iqn1kW9q/FU0gdNj2ydZcK6Nzb9eQAUjGdBJJGtMHUokUkLFTq6yaEWCmYpJ7PEn
FGtbNGU+77QmX7/vMpXA7DkjM59Wh6BGaQlN9ikUL55SuxQFhOcz/ku2d9TyDeKl
dacsaLQ6kw6ZdBSAADfnyYwYQJyksXJJFUkhDbA286imku+8y8zK4LmiwRUqJvt1
cQEy0U+26GkVV9o9GfabizduNhHQV7+1tc9gxSQK0mjBF3AmqfcWdMCigPEdyLN7
vUg+W+o8XAqFsfy+//0ORvj8wgI70uIliJThXDAlvn1+DrcJoJ6CM2hlpy7zO1Xe
wwnMrgDh/h9E8neE9C9Xmo29D1E1h9cGx7xhiFLH/IQj0NVRxVFdGX+oPwtkBdVq
fCTZwBw+IgRgxQXpmhf8iLKz7MHH8nM7QNL6JNLkC0bFXt+lLuujAYBgVaDRepJu
vhrP9O/dHJMyLI7inPVz
=HlpH
-----END PGP SIGNATURE-----
--=-=-=--
