From: Marcos Souza <marcos.souza.org@gmail.com>
Date: Fri, 28 Sep 2012 16:48:43 +0000
Subject: Error when doing build of media modules: WARNING: "snd_tea575x_init" [drivers/media/radio/radio-shar
Message-Id: <CAH0vN5+eo70t-R_jy7YGrjU8Fpx=yJQNrNgt=hGnCQL0wyp8xQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, kernel-janitors <kernel-janitors@vger.kernel.org>

Just giving a proper subject


---------- Forwarded message ----------
From: Marcos Souza <marcos.souza.org@gmail.com>
Date: 2012/9/28
Subject: Build
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org


Hi media guys,

After try to build the media drivers with some radios enabled, I got this e=
rror:

marcos@tux:/mnt/dados/gitroot/linux$ make M=3Ddrivers/media
  Building modules, stage 2.
  MODPOST 21 modules
WARNING: "snd_tea575x_init" [drivers/media/radio/radio-shark.ko] undefined!
WARNING: "snd_tea575x_exit" [drivers/media/radio/radio-shark.ko] undefined!
WARNING: "snd_tea575x_init" [drivers/media/radio/radio-maxiradio.ko] undefi=
ned!
WARNING: "snd_tea575x_exit" [drivers/media/radio/radio-maxiradio.ko] undefi=
ned!

I saw that there is a EXPORT_SYMBOL of these functions in the file
sound/i2c/other/tea575x-tuner.c

But, I don't know how to find this...

Can someone show me how can I fix this?

Thanks since now!

--
Att,

Marcos Paulo de Souza
Acad=EAmico de Ciencia da Computa=E7=E3o - FURB - SC
Github: https://github.com/marcosps/
"Uma vida sem desafios =E9 uma vida sem raz=E3o"
"A life without challenges, is a non reason life"


--=20
Att,

Marcos Paulo de Souza
Acad=EAmico de Ciencia da Computa=E7=E3o - FURB - SC
Github: https://github.com/marcosps/
"Uma vida sem desafios =E9 uma vida sem raz=E3o"
"A life without challenges, is a non reason life"
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
