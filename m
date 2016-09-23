From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 23 Sep 2016 10:55:05 +0000
Subject: Re: GPU-DRM-TILCDC: Less function calls in tilcdc_convert_slave_node() after error detection
Message-Id: <3f4cbe32-aa0b-0123-2f1c-f34a7f160797@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <2f3f7ad7-16a0-1dfb-d073-0d993cd767ee@users.sourceforge.net>
 <0be7fee0-64f7-fa02-0337-51376677343e@users.sourceforge.net>
 <e9b443c7-2947-46d5-462f-58c175b774bc@ti.com>
 <d9b20442-3f84-82bd-d600-e3045a21da99@users.sourceforge.net>
 <b22e0060-503d-ac31-fe8c-8a356145bec8@ti.com>
 <d9ce49fe-4aab-2138-3ecc-86fa825120fa@users.sourceforge.net>
 <cf250b58-8747-2d43-71ad-e211938cbcde@ti.com>
In-Reply-To: <cf250b58-8747-2d43-71ad-e211938cbcde@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Jyri Sarha <jsarha@ti.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Julia Lawall <julia.lawall@lip6.fr>, Tomi Valkeinen <tomi.valkeinen@ti.com>

>> A special view on software simplicity can also lead to questionable inte=
rmediate
>> function implementation, can't it?
>=20
> I don't really follow. But in any case I do not see anything
> questionable in the current tilcdc_convert_slave_node() implementation.

I identified update candidates there like the following.

1. Delayed checking for null pointers
=85
	if (!slave || !of_device_is_available(lcdc))
=85

2. Usage of a single jump label for (too many?) cases
=85
		goto out;
=85

   Can the corresponding exception handling become also a bit more efficien=
t?


>> Would you like to care a bit more for efficiency and software correctness
>> around the discussed exception handling?
>=20
> No, I would not.

Thanks for this information.

I hope that the software situation can also be improved around
this design aspect somehow.


> For the moment I have more important tasks to do.

I know also that various open issues are competing for your software
development attention as usual.

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
