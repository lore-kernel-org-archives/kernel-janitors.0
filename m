From: Steve French <smfrench@gmail.com>
Date: Mon, 19 Jul 2010 21:58:21 +0000
Subject: Re: [PATCH 10/15] fs: cifs: check kmalloc() result
Message-Id: <AANLkTil-rrLA9iLJRkf9C4aGK1CnvitSIVktScMpjvxx@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1279296925-25147-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1279296925-25147-1-git-send-email-segooon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Kulikov Vasiliy <segooon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Steve French <sfrench-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Jeff Layton <jlayton-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Dave Kleikamp <shaggy-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, linux-cifs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, samba-technical-w/Ol4Ecudpl8XjKLYN78aQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

merged into cifs-2.6.git

On Fri, Jul 16, 2010 at 11:15 AM, Kulikov Vasiliy <segooon@gmail.com> wrote:
> If kmalloc() fails exit with -ENOMEM.
>
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
> ---
> =A0fs/cifs/readdir.c | =A0 =A05 +++++
> =A01 files changed, 5 insertions(+), 0 deletions(-)
>
> diff --git a/fs/cifs/readdir.c b/fs/cifs/readdir.c
> index daf1753..d5e591f 100644
> --- a/fs/cifs/readdir.c
> +++ b/fs/cifs/readdir.c
> @@ -847,6 +847,11 @@ int cifs_readdir(struct file *file, void *direntry, =
filldir_t filldir)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0end_of_smb =3D cifsFile->srch_inf.ntwrk_bu=
f_start + max_len;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0tmp_buf =3D kmalloc(UNICODE_NAME_MAX, GFP_=
KERNEL);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (tmp_buf =3D NULL) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rc =3D -ENOMEM;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for (i =3D 0; (i < num_to_fill) && (rc =3D=
 0); i++) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (current_entry =3D NULL=
) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* evaluat=
e whether this case is an error */
> --
> 1.7.0.4
>
>



--=20
Thanks,

Steve
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
