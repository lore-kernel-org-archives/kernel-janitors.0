From: Jens Axboe <jaxboe@fusionio.com>
Date: Tue, 01 Jun 2010 10:17:20 +0000
Subject: Re: [patch] cciss: call BUG() earlier
Message-Id: <20100601101720.GK3564@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100601070544.GC5483@bicker>
In-Reply-To: <20100601070544.GC5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Tue, Jun 01 2010, Darren Jenkins wrote:
> Hi Dan,
>=20
> On Tue, Jun 1, 2010 at 5:05 PM, Dan Carpenter <error27@gmail.com> wrote:
> > I moved the range check after the increment. =A0The current code would
> > write past the end of the array once before calling BUG().
> >
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> >
> > diff --git a/drivers/block/cciss_scsi.c b/drivers/block/cciss_scsi.c
> > index e1d0e2c..3381505 100644
> > --- a/drivers/block/cciss_scsi.c
> > +++ b/drivers/block/cciss_scsi.c
> > @@ -188,11 +188,11 @@ scsi_cmd_free(ctlr_info_t *h, CommandList_struct =
*cmd)
> >
> > =A0 =A0 =A0 =A0sa =3D h->scsi_ctlr;
> > =A0 =A0 =A0 =A0stk =3D &sa->cmd_stack;
> > + =A0 =A0 =A0 stk->top++;
> > =A0 =A0 =A0 =A0if (stk->top >=3D CMD_STACK_SIZE) {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk("cciss: scsi_cmd_free called too =
many times.\n");
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0BUG();
> > =A0 =A0 =A0 =A0}
> > - =A0 =A0 =A0 stk->top++;
> > =A0 =A0 =A0 =A0stk->elem[stk->top] =3D (struct cciss_scsi_cmd_stack_ele=
m_t *) cmd;
> > =A0}
>=20
> Did you diff this one backwards ?
>=20

How so? if stk->top =3D CMD_STACK_SIZE - 1 the current code will not
trigger the BUG, but it will index beyond the size of ->elem. So the
patch looks correct to me.

Dan, I'll apply it, thanks.

--=20
Jens Axboe

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
