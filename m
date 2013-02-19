From: David =?iso-8859-1?Q?H=E4rdeman?= <david@hardeman.nu>
Date: Tue, 19 Feb 2013 20:36:01 +0000
Subject: Re: [patch] [media] mceusb: move check earlier to make smatch happy
Message-Id: <20130219203601.GB15909@hardeman.nu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130212122208.GA19045@elgon.mountain>
In-Reply-To: <20130212122208.GA19045@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mauro Carvalho Chehab <mchehab@redhat.com>, Sean Young <sean@mess.org>, Jarod Wilson <jarod@redhat.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Feb 12, 2013 at 03:22:08PM +0300, Dan Carpenter wrote:
>Smatch complains that "cmdbuf[cmdcount - length]" might go past the end
>of the array.  It's an easy warning to silence by moving the limit
>check earlier.
>
>Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks ok. I'll leave the signing off to Jarod though. I've just dabbled
in the driver but I'm not the maintainer.

>diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
>index bdd1ed8..5b5b6e6 100644
>--- a/drivers/media/rc/mceusb.c
>+++ b/drivers/media/rc/mceusb.c
>@@ -828,16 +828,16 @@ static int mceusb_tx_ir(struct rc_dev *dev, unsigned=
 *txbuf, unsigned count)
> 			 (txbuf[i] -=3D MCE_MAX_PULSE_LENGTH));
> 	}
>=20
>-	/* Fix packet length in last header */
>-	length =3D cmdcount % MCE_CODE_LENGTH;
>-	cmdbuf[cmdcount - length] -=3D MCE_CODE_LENGTH - length;
>-
> 	/* Check if we have room for the empty packet at the end */
> 	if (cmdcount >=3D MCE_CMDBUF_SIZE) {
> 		ret =3D -EINVAL;
> 		goto out;
> 	}
>=20
>+	/* Fix packet length in last header */
>+	length =3D cmdcount % MCE_CODE_LENGTH;
>+	cmdbuf[cmdcount - length] -=3D MCE_CODE_LENGTH - length;
>+
> 	/* All mce commands end with an empty packet (0x80) */
> 	cmdbuf[cmdcount++] =3D MCE_IRDATA_TRAILER;
>=20
>

--=20
David H=E4rdeman
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
