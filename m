From: adam radford <aradford@gmail.com>
Date: Wed, 27 Jun 2012 22:36:29 +0000
Subject: Re: [patch -resend] [SCSI] megaraid: cleanup type issue in mega_build_cmd()
Message-Id: <CAHtARFFsPbpZUBkj3d8UDXiHrKBqGCFOGu7oLhy9qfRapF7RMQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120627085800.GA3007@mwanda>
	<20120627090824.GR31212@elgon.mountain>
In-Reply-To: <20120627090824.GR31212@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Neela Syam Kolli <megaraidlinux@lsi.com>, "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jun 27, 2012 at 2:08 AM, Dan Carpenter <dan.carpenter@oracle.com> w=
rote:
> On 64 bit systems the current code sets 32 bits of "seg" and leaves the
> other 32 uninitialized. =A0It doesn't matter since the variable is never
> used. =A0But it's still messy and we should fix it.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Originally sent on Fri, 2 Mar 2012.
>
> diff --git a/drivers/scsi/megaraid.c b/drivers/scsi/megaraid.c
> index 4d39a9f..97825f1 100644
> --- a/drivers/scsi/megaraid.c
> +++ b/drivers/scsi/megaraid.c
> @@ -524,7 +524,7 @@ mega_build_cmd(adapter_t *adapter, Scsi_Cmnd *cmd, in=
t *busy)
> =A0 =A0 =A0 =A0mega_passthru =A0 *pthru;
> =A0 =A0 =A0 =A0scb_t =A0 *scb;
> =A0 =A0 =A0 =A0mbox_t =A0*mbox;
> - =A0 =A0 =A0 long =A0 =A0seg;
> + =A0 =A0 =A0 u32 =A0 =A0 seg;
> =A0 =A0 =A0 =A0char =A0 =A0islogical;
> =A0 =A0 =A0 =A0int =A0 =A0 max_ldrv_num;
> =A0 =A0 =A0 =A0int =A0 =A0 channel =3D 0;
> @@ -858,7 +858,7 @@ mega_build_cmd(adapter_t *adapter, Scsi_Cmnd *cmd, in=
t *busy)
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Calculate Scatter-Gathe=
r info */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mbox->m_out.numsgelements =
=3D mega_build_sglist(adapter, scb,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 (u32 *)&mbox->m_out.xferaddr, (u32 *)&seg);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 (u32 *)&mbox->m_out.xferaddr, &seg);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return scb;
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/

Acked-by: Adam Radford <aradford@gmail.com>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
