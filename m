From: Eric Anholt <eric@anholt.net>
Date: Tue, 09 May 2017 16:29:16 +0000
Subject: Re: [RFC] Spurious error handling code in 'vc4_get_hang_state_ioctl'
Message-Id: <87bmr2ngdf.fsf@eliezer.anholt.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <bba7889b-7f80-c973-0a1b-e56a4a88cb03@wanadoo.fr>
In-Reply-To: <bba7889b-7f80-c973-0a1b-e56a4a88cb03@wanadoo.fr>
To: kernel-janitors@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Christophe JAILLET <christophe.jaillet@wanadoo.fr> writes:

> Hi,
>
> While looking for labels with a spurious order in the linux kernel code,=
=20
> I came across code around:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/=
drivers/gpu/drm/vc4/vc4_gem.c#n106
>
> The error handling in this for loop looks spurious to me:
>     - if 'drm_gem_handle_create' fails, we leak 'bo_state'
>       This is freed after the 'copy_to_user'
>     - if 'drm_gem_handle_create' fails, then we have 'state->bo_count =3D=
=20
> i - 1'
>       This looks odd. 'state->bo_count =3D i' sounds more logical to me.
>     - as 'state->bo_count' is updated, this could mean than the=20
> 'copy_to_user' should be performed.

The point of reducing the bo_count was presumably for freeing the
handles we had created before returning the error, which I forgot to
actually do (userspace won't know about the new handles to go and free
them itself).  This is not that big a deal, as this interface is for use
by a root-only, one-shot app that gets the hang state and dumps it to
disk, so it can be processed later to try to debug the hang.

Want to put together a patch that frees the handles (and bo_state),
though, for correctness?  Don't worry about copying any partial data out
on error -- the userspace tool just exits.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlkR7lwACgkQtdYpNtH8
nujRWxAAgtjv+IpFiQ9DojWKdunS043kQN2qD1ifK8sNSIIkYpPpp+EgPXhVVdtY
swmEZVfgszhIBXwmrWp49kCAfjSrIl1r+DW55r7MwhQ6Vzd3UTJJCWSdOFuzyi7m
Ne3uK1cK3BwfwRQEW+WJ3/Hhx8LA1qBdFn4guogFbBtsVxLeM+I0cNWjwG8xOS1b
whCFH9+U/2zjAp1FLyZ8ZLT6UUnEX7unKM6XNiJ0NkyKJ37O8Tz1RLYGgiRlqg2n
hv9Dy0VoHXS4rhhlKS+f1hvCob21Obso+K2cg7NpWCFrA8+LbN0iDQSD070CV8Uc
jtcyylKjdVZrvF4jgYV3XxFQ8flQttaLesgNydY8gxJhreVFXyoLNPRNNsl0k94h
PjOKzVzSxUZ/XvsSyINwFiXF5PqWjarEkE2vD0VvFwNOtureKedPOcHBZgKxJNm/
FbhcPSq5f7dqihAITNrYaydPZZwCr8XqNizHdYYL9D016K1a+VrH3kmS/T0JjQBE
HxA4z8tIbvV7TFwb3aNHfmbK4sHo4lcoKf3UguuNz4VlTFWiAQ4mbniK0Eeow73n
FgsOzyRgSqbFI6kHjCQTBO/30Kx4w07tudaHhZHcAAhr4ZgUBy1Qf37xPF8IBfUX
d8qI3ZOlxuzMge649gvxPbr64941htIuqWQ+CqKgPJLgT/KfXnI=
=MfRV
-----END PGP SIGNATURE-----
--=-=-=--
