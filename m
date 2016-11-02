From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 02 Nov 2016 18:14:44 +0000
Subject: Re: [PATCH] drm/sun4i: Fix error handling
Message-Id: <20161102181444.hfrh6fcr2a5oe5n4@lukather>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="42cztvdp7v3jcxjj"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161030084926.15303-1-christophe.jaillet@wanadoo.fr>
 <c15282b4-e88a-06b1-527d-96aedce8b7eb@wanadoo.fr>
In-Reply-To: <c15282b4-e88a-06b1-527d-96aedce8b7eb@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: airlied@linux.ie, wens@csie.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--42cztvdp7v3jcxjj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Oct 30, 2016 at 12:53:02PM +0100, Christophe JAILLET wrote:
> BTW, memory allocation in 'sun4i_layers_init()' looks spurious, especially
> the use of 'layer' in the for loop.
> Just my 2 cents.

What do you mean by it's spurious?

> I also forgot to say that we could propagate the error code returned by
> sun4i_layers_init instead of returning -EINVAL unconditionally

Indeed. Can you send a patch for that?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--42cztvdp7v3jcxjj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYGi0QAAoJEBx+YmzsjxAgTj8P/AhpxGjccj8GK82VepOy2hIj
NL5ZYosHWP660sDBorizZuf6+CqwJijKMywOUyB33SJoWjll9n0QYjuMxoHeZer1
3XN88+MuRzsO4u/n7rT084Njd63VvaZJiht0eY7fOEgacEnBpKA4G4cGzeW7sdzy
PbJ++O8zIhR0DHOBkey9gkG/JoDlJ0fDchlE9pDWC919DR0bmLLZW1CUCSUH7nUI
iYKCgT1KBI7+tuBKH5C/6IR42YkiIOOOYUSaR4/Z8wfC7cRp1PY/Z+U2OHdX4Kq8
Sh/L7UE05peu3hRu8b6CkZ/kTChysO9tLIiy2gHIbQ6Bc0QiexBKHkgZzHy4Gbm6
zzYal9257boQoTy9atpvGFYccRWFBW2pp/K9n326RdHM3i42lpu53DQSL9hkhpBh
nHTPBv+ek7qh9npK6HFA8wsXEKDL/F7iu9+mQdNCH5dg4dIivZvugzH8KLE/K4lT
jX03ikVqr/igIW5wGsoZ6pleG7NfR0GHW7fWPWJtXrgopOAlIwyvCsv6L7IXaEv+
bMM0us2MFkmbH8uKfkNxG+fnez2oLpRNPA2Q5XN0zgKBpmGgtOSpBFV8BCM396Gw
ET4qNHTn4H3W3AeOp8Wo8TWWxPRuUtVbduB/dsrNa5uuKLDGehnIAii1uSXSgZDo
pdASK4axjnMXd+UUsj6/
=XEOa
-----END PGP SIGNATURE-----

--42cztvdp7v3jcxjj--
