From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 25 Feb 2012 14:33:47 +0000
Subject: Re: [PATCH] Staging:android: Silence some compiler warnings
Message-Id: <20120225143347.GA4831@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="ibTvN161/egqYuK8"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1330084320-15557-1-git-send-email-ruan.zhengwang@gmail.com>
In-Reply-To: <1330084320-15557-1-git-send-email-ruan.zhengwang@gmail.com>
To: kernel-janitors@vger.kernel.org


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 25, 2012 at 12:03:56PM +0800, Zhengwang Ruan wrote:
> >>  static int binder_debug_no_lock;
> >> -module_param_named(proc_no_lock, binder_debug_no_lock, bool, S_IWUSR =
| S_IRUGO);
> >> +module_param_named(proc_no_lock, binder_debug_no_lock, int, S_IWUSR |=
 S_IRUGO);
> > Instead of doing this, it would be better to change the line before
> > and declare binder_debug_no_lock as a bool.
> >
>=20
> Actually, I did change the type for binder_debug_no_lock as a bool until
> I noticed binder_debug_no_lock is to be assigned value to int variables
> in the following context. I think this change may be helpful to keep
> consistence with the following context and reduce confusion from a view
> to read code.
>=20

The code isn't confusing...  But anyway, the change affects how the
option is presented to the user, and it should be bool.

> > Use the ./scripts/get_maintainer.pl to find where to resend this
>=20
> Is it a common tool for community, how could I get it?
>=20

It's inside the kernel source tree.

regards,
dan carpenter

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPSPFLAAoJEOnZkXI/YHqR3uEP/1SIdDllQyyqsd0iHXATz6b9
nqtkmsFT09JLJy9aAQndV218gexIYmXJJ3KBP/ntxvZGTVHxQerSywV2XqbazQ3j
i5pxqgW9VIt6cTppt4mKHH0lUqaSFLmkr1zTIV9QKmIRfBezYy35KljsSTJSjtzn
zKdzooBem75lwqSUwF128HmJf6+OMgaHnL4jFtCsO8qIqG9x/BkSOOCBmJXxM2kF
L5+O215QwsMYXWp3x0t29Y+0jBeRRGzF2DmRNsCGbv8sWcREnGSEyP8rwY+Ctf1t
YUzrrIWRuikzX2zRh6WNLPGv3ivirufxwE8wCbCyvmpD0ih+T7dVADmEVs4zejWi
dTHbEeER/JQmyrlsoIVuYYWIGek/HVO99t5kf2x9kjb82/3JFl5TZiCWuMZAfehw
1rP7TTRLbfxWDgTQdCcFkKIDAwErTxaBi+hFg9kfsEUL00l6y8HPnyHZMiRApwHl
NI+kMjRjGp5hABxeDtFJzIvycklzE3Nw+hLdS4+S1WMXfoSWe7/3BCCbGS8wjHmK
W+n9HpCAhVHa59EgKB7EQ8t6rIbYboul5XPVONvYpyuIeyIZikfdNM74fA/VXHrv
if4dyYKGuuF63AKpmqJXyBwDwFpQA3lNe8Kkse2x95Yz7Rx3BSIdH5JbWSr1mpgy
xq/7YDNw8h6MycnI7ctU
=XBYs
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
