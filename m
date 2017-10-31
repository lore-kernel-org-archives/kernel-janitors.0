From: Eric Anholt <eric@anholt.net>
Date: Tue, 31 Oct 2017 00:02:13 +0000
Subject: Re: [PATCH] drm/panel: rpi-touchscreen: propagate errors in rpi_touchscreen_i2c_read()
Message-Id: <87d154w5fe.fsf@anholt.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171020002845.kar2wg7gqxg7tzqi@mwanda>
In-Reply-To: <20171020002845.kar2wg7gqxg7tzqi@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

--=-=-=
Content-Type: text/plain

Dan Carpenter <dan.carpenter@oracle.com> writes:

> There is one caller which checks whether rpi_touchscreen_i2c_read()
> returns negative error codes.  Currently it can't because negative
> error codes are truncated to u8, but that's easy to fix if we change the
> type to int.

Reviewed and applied to -next.  Thanks!

(Not to -fixes because we're late in the cycle, we don't have an
upstream DT exposing the panel, and it seems unlikely that the error
value here would happen to collide with one of the 2 values of a valid
firmware revision)

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAln3vYUACgkQtdYpNtH8
nugl6BAArn/Upp45D/N82z4bCFHuLSWebeVmMP3kxJxAqfwrPwSw994O7Oj6eT+3
H88D/bcIuB3N6jLCWMHkycv+4qFsg0596TxeUuYPkU9LYlC4lm1bk6dF+0FdNR0b
89/Tc1GfRf3mITFsjH857aAUjRDUrW6ussOhet+1ms6K8juZ2V7NYrFdoZNEjjBj
auAb+LACHjfApW9G2EWJsh8aAlb6aAcE7DHuimfcsUtAxBZ6D2YVkCeUlo0+iUJN
lCa4VMJi+VcNy+amHLhc8aH55m59I3HJ5nj3AjYltFdjO/2TwpXaOwPySeGEWeBf
937sS7szHsv2sMYRWxbTTvYnq013AnKdlwtpJ1Rzuk6aW/dGeXwg4sSiJ0nwecnl
AeXI3v/HhKCablhMWkKnUB3nj+0tSayVR4/NfZCRWt9Xfhpb7P/3qbJhEjiMLjMg
Qco0gZkp4C95mx+oC9S+8j8PbGid/9Gb+Mh0m/KQRrmZWCkuXo5OUbzqDWCU+Vsi
/6Tv9JChkiuM8f3WM99o83EMXDOn+h1qlqAt+SW9ybexZf4eahzp0wYL2bLMQyG3
Oh/24EWbTyOezx0ispDL6tCx2pCPJZZcb4mnemRTb8oLpMOrEIOuKkK8m6Bn9+41
N4sW9TmhahfJEPScjD6cTUF2F0olQ/voXiYU0xtcYGfFAmfsMWU=
=av0Y
-----END PGP SIGNATURE-----
--=-=-=--
