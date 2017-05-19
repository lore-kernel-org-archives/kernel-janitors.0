From: Eric Anholt <eric@anholt.net>
Date: Fri, 19 May 2017 20:08:20 +0000
Subject: Re: [PATCH][drm-next] drm/pl111: make structure pl111_display_funcs static
Message-Id: <874lwg8v9n.fsf@eliezer.anholt.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170519110203.19417-1-colin.king@canonical.com>
 <874lwhoxyk.fsf@intel.com> <20170519194759.gfiefx6xwrnrjn3x@mwanda>
In-Reply-To: <20170519194759.gfiefx6xwrnrjn3x@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Colin King <colin.king@canonical.com>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Dan Carpenter <dan.carpenter@oracle.com> writes:

> On Fri, May 19, 2017 at 03:03:31PM +0300, Jani Nikula wrote:
>> On Fri, 19 May 2017, Colin King <colin.king@canonical.com> wrote:
>> > From: Colin Ian King <colin.king@canonical.com>
>> >
>> > structure pl111_display_funcs can be made static as it does not need t=
o be
>> > in global scope.  Fixes sparse warning:
>> >
>> > "warning: symbol 'pl111_display_funcs' was not declared. Should it
>> > be static?"
>> >
>> > Fixes: bed41005e6174d ("drm/pl111: Initial drm/kms driver for pl111")
>>=20
>> The patch looks good and I appreciate what you're doing, but I question
>> the usefulness of adding Fixes: tags for trivial stuff like this. I'd
>> prefer Fixes: was reserved for actual fixes that should be backported to
>> any kernels that have the commit being fixed.
>>=20
>> The same applies to many other patches you've sent recently.
>>=20
>
> The Fixes tag is so so useful for everything.  It should be included
> in every bugfix.  (I am the inventor of the Fixes tag).
>
> I told Colin to include the Fixes tag on everything.  My review process
> is partly "How was this bug introduced?  How can we prevent it from
> happening again?  Who was the original author and have they reviewed the
> proposed fix?"  So I end up looking up the original commit anyway.  It
> helps me a lot to have the Fixes tag there.
>
> The Fixes tag is obviously useful for the stable people as well, but
> that wasn't really the point.

OK, that's definitely not how I've read the
Documentation/process/submitting-patches.rst description of the Fixes
tag, which talks about bugs found with git bisect and things that should
go to -stable.  I would not have considered what this patch is changing
to be a bug.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlkfULQACgkQtdYpNtH8
nuiwMRAAutPf/5MKlaKErrNFpVAUUVgMxbb2yMs52SdiJ98rsJxjFT4oXxswAA/5
SXaKFdhaF1H36qCTIz6tOiXNbZG1ER4YSMeVfOaH9NuOzekq2qKr9g7pM5ykqebS
nuQK3u50izP6E6lgnURbTu2QpuvMlBja86XgAKygV0dOz8qjZOMHJpzN65X1XmeZ
9aiJ+IPjyxDMFDnar38luDQ1H9ZlqX+8UwYY9jqBN4IAKKVpRLnvHFdtV2u3kU1a
i1b2UmlTPyeNXFme1E7pwaGeCd/+GhiVoLlRk4q4g8vCAj2qnYK1pR2HmWl1Sdky
oRSiaTXIUvlAbm1yw5/IT5NybsSmMoMGm08TMxKnZENsTx2l3h6LNRxjxQuE5U3v
kKgBacPaTd1toox91Df7Bm31dThYfSyTf1hmzb4qVR3UQNi9rt0G7Chcfh2UXqfQ
Ubj9WbF+B28nV8IJ7XECHIZHneWNK4P7ojoOq7nrRS0Z6LrnryOgCOXmmvLIqm4w
+5uSGcpQz8JyCIprV+Fa1Aw9XmdQ5d1uVmDNNuvql8agbvSgRFjWZJla8osDp3uZ
QTMchYvbUsZhTeyh2KmCEr5bPZtyKkFb9FQMndQ2ydc/R1qBoTLI7tZljs5zkC8I
g44t/KaW6c5OA6WeDnPI0KxHyaKJBY9IzqXQ74lrfYdsKqzhrFU=
=dzOn
-----END PGP SIGNATURE-----
--=-=-=--
