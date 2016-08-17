From: Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Wed, 17 Aug 2016 14:16:09 +0000
Subject: Re: [PATCH] ARM: cpuidle: Fix error return code
Message-Id: <57B471A9.8060103@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1470920550-21625-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1470920550-21625-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, rjw@rjwysocki.net
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 08/11/2016 03:02 PM, Christophe JAILLET wrote:
> We know that 'ret =3D 0' because it has been tested a few lines above.
> So, if 'kzalloc' fails, 0 will be returned instead of an error code.
> Return -ENOMEM instead.
>=20
> Fixes: a0d46a3dfdc3 ("ARM: cpuidle: Register per cpuidle device")
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thanks !

  -- Daniel


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for ARM=
 SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
