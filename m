From: Jaco Kroon <jaco@kroon.co.za>
Date: Tue, 29 May 2007 21:37:16 +0000
Subject: Re: [KJ] Re: [PATCH ARRAY_SIZE 1/4] kernel 2.6 size macro clean ups
Message-Id: <465C9D0C.4090004@kroon.co.za>
List-Id: <kernel-janitors.vger.kernel.org>
References: <465C99C3.4030802@gmail.com>
In-Reply-To: <465C99C3.4030802@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

This patch includes a bunch of white-space changes.  I recommend passing=20
-B to the diff command.

Jaco

Aaron Cripps wrote:
>=20
>=20
> ------------------------------------------------------------------------
>=20
> removed the MAX_SPEEDS macro in favor of the more generic ARRAY_SIZE macro
> defined in kernel.h
> Also cleaned up trailing whitespaces.
> Compile tested, no issues found at compile time.
>=20
> Signed-off-by: Aaron Cripps <cripps@cs.mun.ca>
>=20
>=20
> diff -Nuar linux-2.6/drivers/net/irda/actisys-sir.c linux-2.6-patched/dri=
vers/net/irda/actisys-sir.c
> --- linux-2.6/drivers/net/irda/actisys-sir.c	2007-05-22 20:31:01.00000000=
0 -0230
> +++ linux-2.6-patched/drivers/net/irda/actisys-sir.c	2007-05-25 22:51:22.=
000000000 -0230
> @@ -1,8 +1,8 @@
>  /*********************************************************************
> - *               =20
> + *
>   * Filename:      actisys.c
>   * Version:       1.1
> - * Description:   Implementation for the ACTiSYS IR-220L and IR-220L+=20
> + * Description:   Implementation for the ACTiSYS IR-220L and IR-220L+
>   *                dongles
>   * Status:        Beta.
>   * Authors:       Dag Brattli <dagb@cs.uit.no> (initially)
> @@ -11,20 +11,20 @@
>   * Created at:    Wed Oct 21 20:02:35 1998
>   * Modified at:   Sun Oct 27 22:02:13 2002
>   * Modified by:   Martin Diehl <mad@mdiehl.de>
> - *=20
> + *
>   *     Copyright (c) 1998-1999 Dag Brattli, All Rights Reserved.
>   *     Copyright (c) 1999 Jean Tourrilhes
>   *     Copyright (c) 2002 Martin Diehl
> - *     =20
> - *     This program is free software; you can redistribute it and/or=20
> - *     modify it under the terms of the GNU General Public License as=20
> - *     published by the Free Software Foundation; either version 2 of=20
> + *
> + *     This program is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License as
> + *     published by the Free Software Foundation; either version 2 of
>   *     the License, or (at your option) any later version.
> - * =20
> + *
>   *     Neither Dag Brattli nor University of Troms=C3=B8 admit liability=
 nor
> - *     provide warranty for any of this software. This material is=20
> + *     provide warranty for any of this software. This material is
>   *     provided "AS-IS" and at no charge.
> - *    =20
> + *
>   ********************************************************************/
> =20
>  /*
> @@ -48,7 +48,7 @@
> =20
>  #include "sir-dev.h"
> =20
> -/*=20
> +/*
>   * Define the timing of the pulses we send to the dongle (to reset it, a=
nd
>   * to toggle speeds). Basically, the limit here is the propagation speed=
 of
>   * the signals through the serial port, the dongle being much faster.  A=
ny
> @@ -67,8 +67,6 @@
>  /* Note : the 220L doesn't support 38400, but we will fix that below */
>  static unsigned baud_rates[] =3D { 9600, 19200, 57600, 115200, 38400 };
> =20
> -#define MAX_SPEEDS (sizeof(baud_rates)/sizeof(baud_rates[0]))
> -
>  static struct dongle_driver act220l =3D {
>  	.owner		=3D THIS_MODULE,
>  	.driver_name	=3D "Actisys ACT-220L",
> @@ -166,17 +164,17 @@
>  	int i =3D 0;
> =20
>          IRDA_DEBUG(4, "%s(), speed=3D%d (was %d)\n", __FUNCTION__,
> -        	speed, dev->speed);
> +		speed, dev->speed);
> =20
>  	/* dongle was already resetted from irda_request state machine,
>  	 * we are in known state (dongle default)
>  	 */
> =20
> -	/*=20
> +	/*
>  	 * Now, we can set the speed requested. Send RTS pulses until we
> -         * reach the target speed=20
> +         * reach the target speed
>  	 */
> -	for (i =3D 0; i < MAX_SPEEDS; i++) {
> +	for (i =3D 0; i < ARRAY_SIZE(baud_rates); i++) {
>  		if (speed =3D baud_rates[i]) {
>  			dev->speed =3D speed;
>  			break;
> @@ -191,7 +189,7 @@
>  	}
> =20
>  	/* Check if life is sweet... */
> -	if (i >=3D MAX_SPEEDS) {
> +	if (i >=3D ARRAY_SIZE(baud_rates)) {
>  		actisys_reset(dev);
>  		ret =3D -EINVAL;  /* This should not happen */
>  	}
>=20
>=20
> ------------------------------------------------------------------------
>=20
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.linux-foundation.org
> https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
