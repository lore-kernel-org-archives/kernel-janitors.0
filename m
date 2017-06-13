From: Eric Anholt <eric@anholt.net>
Date: Tue, 13 Jun 2017 00:13:31 +0000
Subject: Re: [PATCH v2] drm/vc4: Fix resource leak in 'vc4_get_hang_state_ioctl()' in error handling path
Message-Id: <87a85cycb8.fsf@eliezer.anholt.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170512123803.1886-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170512123803.1886-1-christophe.jaillet@wanadoo.fr>
To: airlied@linux.ie
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Christophe JAILLET <christophe.jaillet@wanadoo.fr> writes:

> If one 'drm_gem_handle_create()' fails, we leak somes handles and some
> memory.
>
> In order to fix it:
>   - move the 'free(bo_state)' at the end of the function so that it is al=
so
>     called in the eror handling path. This has the side effect to also tr=
y=20
>     to free it if the first 'kcalloc' fails. This is harmless.
>   - add a new label, err_delete_handle, in order to delete already
>     allocated handles in error handling path
>   - remove the now useless 'err' label

Reviewed and applied.  Thanks!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlk/LisACgkQtdYpNtH8
nugcNg//Rxalo+4Oui7vO53moE3OTqCWBR+45rIUyGfBBkz3+/R7nFQElJW8F8+k
MUDHsQv+1/KjjCZGwQC3gOM+ASoNjawm0VstGSCwoWdPCk4TEPMGsSnWAeDNZ0qj
IxUnBo1oSGrEfZ89yDa9H3rn6XzUaQiiMQs/H2N/6q18AQBoTe5/ckalRQTeySGf
++oDB4WmC35XxeYWMVdxDoNfpjBOc2p0zOsinzkhuU9qnfNQVnKKeZ0wTFVuB13F
1rH0OUzXpbICQtMpcT6UO1hw8m0R8JRV9nQMMrKDRmlqm7Ct+rrVoRbY6Xhb2gmf
+CZIQe/BkRvYzaLV32s0RJkIWMIiaFEqcVZger2WLTwP/Ty3+TQICfivnEyY6M5N
wHMD3TGgAP4p5Ffs0YX04wKpakY5fOXfXThwHQOaTzM0rl+ybT6+l94Wl098y6oH
OJzFsUJlsYOJv7YWd03jXzfps0qnaLulCvNrZaUNMbyX9SjR+cladb0oTgiAC9JK
KBgkVq5wTFYAVa3PMLLpOBPV6iJMaicqM5gFRLkdQBNLnbz7CB9bkPRkXGwOLocl
yQHsRKTYvWgT3rtNdRsWpvRPtp18jq/Vvt4loviSDvAp7zM82G+4Hu9ecJdXwvN5
O2aL1fCW+X2xPlGNzA7EQ4VauFrT0pGdODv0Sv4Yr5teU7erNKI=
=jWQ7
-----END PGP SIGNATURE-----
--=-=-=--
