From: Eric Anholt <eric@anholt.net>
Date: Tue, 17 Jan 2017 10:18:06 +0000
Subject: Re: [patch] drm/vc4: fix a bounds check
Message-Id: <87vatec7mp.fsf@eliezer.anholt.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170113074900.GB30524@mwanda>
In-Reply-To: <20170113074900.GB30524@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

--=-=-=
Content-Type: text/plain

Dan Carpenter <dan.carpenter@oracle.com> writes:

> We accidentally return success even if vc4_full_res_bounds_check() fails.
>
> Fixes: d5b1a78a772f ("drm/vc4: Add support for drawing 3D frames.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks.  Reviewed, added Eric's review, and pushed to -fixes.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlh9714ACgkQtdYpNtH8
nui0ig/+PmsSHSn4aBRtZVD8WfnV08gZz8x4koZj2WiVzIn3J3e9rvfkQeKrjCi4
eByYQOeYSmRFbcsIva8Yja6mOaP8c024rJ0QT/00pr8eaSh470FkXvv9v7qxmup5
4M2p+4gmGNZSMkZ3urb3nOiin/T10QLpTnVUNpBbkcfnsi5ZryXrst2BrbvmXjDM
jD89Jt+1GJ6p/2BQaKjGQl/Ikp4XBfZFw3pgJO/4vnVABUCgMFSClgSDjC7w05AH
NYxoWjEA13k6G4dPXaCjvhb3hAnAYcleQxovssFI0UNBUDf2mOcDTaYF4/77U+Xh
+8f+yLGGD6eQyet8PPJN/XmogIYycpGu7VivN2RzWtWbtpeYuwvp7udzhekd5nvN
YW1cEkift/mVfQY9lc5X9XOCdsRVDKLGdQMmwtf9IB/OHVeYUimDkKeyNzxf2ACS
5+fn3yHS97/1P+0Gr0kuswlE5WP2D3llT2T77gVWVlGGD5P7wTGCtUTpEPUP36WK
jfAIQj4n4JTotZB5/NFCp8CcpZkpIP5HPRnbHT1XgBMk/L9y9JvvG7poXVF9L+Ij
sipeEVwPJNhHBt6CWHzi0TnjO20F4QN962m8TgXsPcNOxBhdkmCVSd2mX9PQGigO
Id4KICyEBZd5GVvtY+n64cQg1TsdiyKBtTWimHpbRcdZX53u5kQ=
=40n/
-----END PGP SIGNATURE-----
--=-=-=--
