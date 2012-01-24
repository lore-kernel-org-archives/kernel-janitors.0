From: Steve French <smfrench@gmail.com>
Date: Tue, 24 Jan 2012 16:37:43 +0000
Subject: Re: [patch] cifs: NULL dereference on allocation failure
Message-Id: <CAH2r5msPnEzmOZNr-PBU3y40uJ+9FeZzbUGVxmMnc2bKeRurew@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120124083922.GA29097@elgon.mountain>
In-Reply-To: <20120124083922.GA29097@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org, kernel-janitors@vger.kernel.org, samba-technical@lists.samba.org

Merged into cifs-2.6.git

On Tue, Jan 24, 2012 at 2:39 AM, Dan Carpenter <dan.carpenter@oracle.com> w=
rote:
> We should just return directly here, the goto causes a NULL dereference.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
> index 986709a..026d646 100644
> --- a/fs/cifs/connect.c
> +++ b/fs/cifs/connect.c
> @@ -3857,10 +3857,8 @@ cifs_construct_tcon(struct cifs_sb_info *cifs_sb, =
uid_t fsuid)
> =A0 =A0 =A0 =A0struct smb_vol *vol_info;
>
> =A0 =A0 =A0 =A0vol_info =3D kzalloc(sizeof(*vol_info), GFP_KERNEL);
> - =A0 =A0 =A0 if (vol_info =3D NULL) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon =3D ERR_PTR(-ENOMEM);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
> - =A0 =A0 =A0 }
> + =A0 =A0 =A0 if (vol_info =3D NULL)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ERR_PTR(-ENOMEM);
>
> =A0 =A0 =A0 =A0vol_info->local_nls =3D cifs_sb->local_nls;
> =A0 =A0 =A0 =A0vol_info->linux_uid =3D fsuid;



--=20
Thanks,

Steve
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
