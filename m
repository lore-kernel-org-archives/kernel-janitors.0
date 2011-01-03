From: Dan Carpenter <error27@gmail.com>
Date: Mon, 03 Jan 2011 05:34:51 +0000
Subject: Re: [PATCHv4 0/4] staging: keucr: Use memcmp() & memcpy() instead
Message-Id: <20110103053451.GO1886@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1294006469-4400-1-git-send-email-martinez.javier@gmail.com>
In-Reply-To: <1294006469-4400-1-git-send-email-martinez.javier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Sun, Jan 02, 2011 at 11:14:25PM +0100, Javier Martinez Canillas wrote:
> This patchset make some cleanup to staging/keucr. Use memcmp and memcpy i=
nstead of custom functions.
> Also some style cleanups recomended by Dan Carpenter, Joe Perches and G=
=E1bor Stefanik.
>=20
> The patches in this patchset are the following:
>=20
> [PATCH 1/4] staging: keucr: Use memcmp() instead custom StringCmp() and s=
ome style cleanups
> [PATCH 2/4] staging: keucr: Use memcpy() instead custom StringCopy() and =
some style cleanups
> [PATCH 3/4] staging: keucr: Delete StringCmp() and StringCopy custom func=
tions
> [PATCH 4/4] staging: keucr: Delete use kernel strcmp() & strcpy() from TO=
DO file
>=20

Looks good.  v1 made me grumpy.  v2 was ok.  v4 is what all patches
should look like.  :)

Acked-by: Dan Carpenter <error27@gmail.com>

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
