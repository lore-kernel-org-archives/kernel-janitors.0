From: Christophe Lucas <clucas@rotomalug.org>
Date: Mon, 14 Nov 2005 08:21:43 +0000
Subject: Re: [KJ] [PATCH] drivers/block/floppy.c: trivial printk() updates
Message-Id: <20051114082143.GG513@rotomalug.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200511140835.20684.daniel.marjamaki@comhem.se>
In-Reply-To: <200511140835.20684.daniel.marjamaki@comhem.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Daniel Marjam=E4ki (daniel.marjamaki@comhem.se) wrote:
>=20
> This is a trivial update that inserts appropriate KERN_ in printk() calls.
>=20
> Signed-off-by: Daniel Marjam=E4ki
>=20
>=20
> --- linux-2.6.14.1.orig/drivers/block/floppy.c	2005-11-14 08:14:40.000000=
000 +0100
> +++ linux-2.6.14.1/drivers/block/floppy.c	2005-11-14 08:25:46.000000000 +=
0100
> @@ -310,7 +310,7 @@ static int initialising =3D 1;
>  #define USETF(x) (set_bit(x##_BIT, &UDRS->flags))
>  #define UTESTF(x) (test_bit(x##_BIT, &UDRS->flags))
> =20
> -#define DPRINT(format, args...) printk(DEVICE_NAME "%d: " format, curren=
t_drive , ## args)
> +#define DPRINT(format, args...) printk(KERN_INFO DEVICE_NAME "%d: " form=
at, current_drive , ## args)
> =20
>  #define PH_HEAD(floppy,head) (((((floppy)->stretch & 2) >>1) ^ head) << =
2)
>  #define STRETCH(floppy) ((floppy)->stretch & FD_STRETCH)
> @@ -620,7 +620,7 @@ static inline void set_debugt(void)
>  static inline void debugt(const char *message)
>  {
>  	if (DP->flags & DEBUGT)
> -		printk("%s dtime=3D%lu\n", message, jiffies - debugtimer);
> +		printk(KERN_INFO "%s dtime=3D%lu\n", message, jiffies - debugtimer);
>  }

Are you sure for this one ?
I will put KERN_DEBUG instead of KERN_INFO :)

Have a nice day,

				- Christophe (clucas@rotomalug.org)

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
