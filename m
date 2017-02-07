From: Eric Anholt <eric@anholt.net>
Date: Tue, 07 Feb 2017 23:46:34 +0000
Subject: Re: [PATCH] drm/vc4: simplify exit path of a failed allocation of dsi_connector
Message-Id: <87poit4l9h.fsf@eliezer.anholt.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170203195624.7189-1-colin.king@canonical.com>
In-Reply-To: <20170203195624.7189-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

--=-=-=
Content-Type: text/plain

Colin King <colin.king@canonical.com> writes:

> From: Colin Ian King <colin.king@canonical.com>
>
> If dsi_connector fails to allocate, the exit path via label 'fail'
> checks if connector is null, which it always is, so the cleanup
> that destroys connector is never going to be called.  Hence the
> failure path can be more optimally performed by removing this
> and just returning ERR_PTR(-ENOMEM).  This also removes the need
> to initialize connector to NULL, and we can also remove ret too.
>
> Detected by CoverityScan, CID#1399504 ("Logicall Dead Code")
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed and pushed to drm-misc-next.  Thanks!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAliaXFoACgkQtdYpNtH8
nuiYzA/9EJhS9DWJB7mOp5LW4xdIAAU7EMZ6x4hxWSAofv/cIa5WQ8lRL8DVvOck
CFiLcQgv5l3ibsVbKahO+/icGU1dOd8wxx17SiwV2MhKWyYY00nC/AuMqHSFhkt3
iVso+cthlmneSlleDu5wI+nUaersJ/ysku/PnOt6X2Bk+xnJOIQPU5lWq+qUPdn5
Jp6h8g2NfyQvtrYhKjZp9Gt+9oH3lQ5leE+zY2Me28pgOE2bxQat7wUtieOUyiqZ
gRrDnuUvacYmPyFAh1gThp3YkvjLuVM2ajyN0THxlhOvPyZoyC9tcdi33IUMjkjF
NCnHzUnnR9QQ91h8PjJPOD0G3UaNGMgJcLMb2S/JI1EmKi4wnVAuM8OHpkxSGtpw
qlks7fTcqs3VJPPQHWGCigeX3KjTmmPUTKguVBbO6UUc+lD4AnL5zCC7j89Rkrcu
5GV8M9aVBkL0vjUrGZGDfOdoyen2JxQpSr0cc1J46wcNoLDHKzMR61N0WxKC+KUr
l0xJim/RFezNBsepdWPr6KqPT5aJ5npfLVzv8gkzuiHaCko79F/fw0gb50EPDgKh
3HwKONQqPoS0nY0o1Qkx9zNyVSZBtKerl346xbRp0QN9OlFd5b8jAT4o9cpSAJe3
qBgSAR6aIYTmC+dRo0P8PvQsiH5NQsYLt8547gX850CFqSe5pSY=
=7mMZ
-----END PGP SIGNATURE-----
--=-=-=--
