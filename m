From: Changli Gao <xiaosuo@gmail.com>
Date: Thu, 05 Aug 2010 10:08:08 +0000
Subject: Re: [patch] isdn: fix information leak
Message-Id: <AANLkTin4jtYuaxYfxDAgST857sD2K4Q28mPcPW=xd-V3@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100805093806.GF9031@bicker>
In-Reply-To: <20100805093806.GF9031@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <error27@gmail.com>
Cc: Karsten Keil <isdn@linux-pingi.de>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Aug 5, 2010 at 5:38 PM, Dan Carpenter <error27@gmail.com> wrote:
> The main motivation of this patch changing strcpy() to strlcpy().
> We strcpy() to copy a 48 byte buffers into a 49 byte buffers. =A0So at
> best the last byte has leaked information, or maybe there is an
> overflow? =A0Anyway, this patch closes the information leaks by zeroing
> the memory and the calls to strlcpy() prevent overflows.

strlcpy() can handle the terminator NUL. so you don't need to zero it.

>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
>
> diff --git a/drivers/isdn/sc/ioctl.c b/drivers/isdn/sc/ioctl.c
> index 1081091..2655e3a 100644
> --- a/drivers/isdn/sc/ioctl.c
> +++ b/drivers/isdn/sc/ioctl.c
> @@ -174,7 +174,7 @@ int sc_ioctl(int card, scs_ioctl *data)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pr_debug("%s: SCIOGETSPID: ioctl received\=
n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sc_adapter=
[card]->devicename);
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 spid =3D kmalloc(SCIOC_SPIDSIZE, GFP_KERNEL=
);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 spid =3D kzalloc(SCIOC_SPIDSIZE, GFP_KERNEL=
);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!spid) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kfree(rcvmsg);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENOMEM;
> @@ -194,7 +194,7 @@ int sc_ioctl(int card, scs_ioctl *data)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kfree(rcvmsg);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return status;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 strcpy(spid, rcvmsg->msg_data.byte_array);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 strlcpy(spid, rcvmsg->msg_data.byte_array, =
SCIOC_SPIDSIZE);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * Package the switch type and send to use=
r space
> @@ -272,12 +272,12 @@ int sc_ioctl(int card, scs_ioctl *data)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return status;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 dn =3D kmalloc(SCIOC_DNSIZE, GFP_KERNEL);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dn =3D kzalloc(SCIOC_DNSIZE, GFP_KERNEL);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!dn) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kfree(rcvmsg);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENOMEM;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 strcpy(dn, rcvmsg->msg_data.byte_array);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 strlcpy(dn, rcvmsg->msg_data.byte_array, SC=
IOC_DNSIZE);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kfree(rcvmsg);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/*
> @@ -348,7 +348,7 @@ int sc_ioctl(int card, scs_ioctl *data)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pr_debug("%s: SCIOSTAT: ioctl received\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sc_adapter=
[card]->devicename);
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 bi =3D kmalloc (sizeof(boardInfo), GFP_KERN=
EL);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 bi =3D kzalloc(sizeof(boardInfo), GFP_KERNE=
L);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!bi) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kfree(rcvmsg);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENOMEM;


--=20
Regards,
Changli Gao(xiaosuo@gmail.com)
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
