From: adam radford <aradford@gmail.com>
Date: Wed, 27 Jun 2012 22:36:55 +0000
Subject: Re: [patch -resend] [SCSI] megaraid: remove a spurious IRQ enable
Message-Id: <CAHtARFGG4HxL7J40o341gBOg8+GunYEGyP0SrBK_w3pH3v6+PA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120627085800.GA3007@mwanda>
	<20120627090030.GC31212@elgon.mountain>
In-Reply-To: <20120627090030.GC31212@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Neela Syam Kolli <megaraidlinux@lsi.com>, "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christoph Hellwig <hch@lst.de>

On Wed, Jun 27, 2012 at 2:00 AM, Dan Carpenter <dan.carpenter@oracle.com> w=
rote:
> We took this lock with spin_lock() so we should unlock it with
> spin_unlock() instead of spin_unlock_irq(). =A0This was introduced in
> f2c8dc402b "[SCSI] megaraid_mbox: remove scsi_assign_lock usage".
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This was originally sent on Sat, 30 Jul 2011. =A0I have cleaned up the
> commit message a bit and added Christoph to the CC list.
>
> diff --git a/drivers/scsi/megaraid/megaraid_mbox.c b/drivers/scsi/megarai=
d/megaraid_mbox.c
> index 35bd138..54b1c5b 100644
> --- a/drivers/scsi/megaraid/megaraid_mbox.c
> +++ b/drivers/scsi/megaraid/megaraid_mbox.c
> @@ -2731,7 +2731,7 @@ megaraid_reset_handler(struct scsi_cmnd *scp)
> =A0 =A0 =A0 =A0}
>
> =A0out:
> - =A0 =A0 =A0 spin_unlock_irq(&adapter->lock);
> + =A0 =A0 =A0 spin_unlock(&adapter->lock);
> =A0 =A0 =A0 =A0return rval;
> =A0}
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-scsi" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html

Acked-by: Adam Radford <aradford@gmail.com>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
