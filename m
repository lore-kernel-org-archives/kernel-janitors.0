From: Darren Jenkins <darrenrjenkins@gmail.com>
Date: Tue, 01 Jun 2010 09:44:49 +0000
Subject: Re: [patch] cciss: call BUG() earlier
Message-Id: <AANLkTik0IM7DkPtLA1iS17QvN4sotICDXlFiT6EnWSwS@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100601070544.GC5483@bicker>
In-Reply-To: <20100601070544.GC5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi Dan,


Did you diff this one backwards ?


On Tue, Jun 1, 2010 at 5:05 PM, Dan Carpenter <error27@gmail.com> wrote:
> I moved the range check after the increment. =A0The current code would
> write past the end of the array once before calling BUG().
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
>
> diff --git a/drivers/block/cciss_scsi.c b/drivers/block/cciss_scsi.c
> index e1d0e2c..3381505 100644
> --- a/drivers/block/cciss_scsi.c
> +++ b/drivers/block/cciss_scsi.c
> @@ -188,11 +188,11 @@ scsi_cmd_free(ctlr_info_t *h, CommandList_struct *c=
md)
>
> =A0 =A0 =A0 =A0sa =3D h->scsi_ctlr;
> =A0 =A0 =A0 =A0stk =3D &sa->cmd_stack;
> + =A0 =A0 =A0 stk->top++;
> =A0 =A0 =A0 =A0if (stk->top >=3D CMD_STACK_SIZE) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk("cciss: scsi_cmd_free called too ma=
ny times.\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0BUG();
> =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 stk->top++;
> =A0 =A0 =A0 =A0stk->elem[stk->top] =3D (struct cciss_scsi_cmd_stack_elem_=
t *) cmd;
> =A0}
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors=
" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
