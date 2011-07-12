From: Steve French <smfrench@gmail.com>
Date: Tue, 12 Jul 2011 18:14:00 +0000
Subject: Re: [patch] cifs: update limit for snprintf() in cifs_construct_tcon()
Message-Id: <CAH2r5mu6TuWs6P8ZeR1=KCv8BLSu0_Z8b2uoVUqXhw55=39CWg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110617103059.GE2520@shale.localdomain>
In-Reply-To: <20110617103059.GE2520-z0WHZYlhLlzP0Z7Jsv878P8+0UxHXcjY@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Steve French <sfrench-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, "open list:COMMON INTERNET F..." <linux-cifs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:COMMON INTERNET F..." <samba-technical-w/Ol4Ecudpl8XjKLYN78aQ@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

What about the following alternative, so we dont rely on the magic
number as much.

diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
index dbd669c..ccc1afa 100644
--- a/fs/cifs/connect.c
+++ b/fs/cifs/connect.c
@@ -3485,7 +3485,7 @@ cifs_construct_tcon(struct cifs_sb_info
*cifs_sb, uid_t fsuid)
 		goto out;
 	}

-	snprintf(username, MAX_USERNAME_SIZE, "krb50x%x", fsuid);
+	snprintf(username, sizeof(username), "krb50x%x", fsuid);
 	vol_info->username =3D username;
 	vol_info->local_nls =3D cifs_sb->local_nls;
 	vol_info->linux_uid =3D fsuid;

On Fri, Jun 17, 2011 at 5:31 AM, Dan Carpenter <error27@gmail.com> wrote:
> In 34c87901e113 "Shrink stack space usage in cifs_construct_tcon" we
> change the size of the username name buffer from MAX_USERNAME_SIZE
> (256) to 28. =A0This call to snprintf() needs to be updated as well.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> I know that everyone is going to complain about using a literal but
> it's local to this function and it's commented in the lines above.
> I'm not opposed to using a define, I suppose, if you give me a good
> one, but really I'd just as soon leave it as is. =A0*eye roll in
> advance*.
>
> diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
> index 12cf72d..efd1c7a 100644
> --- a/fs/cifs/connect.c
> +++ b/fs/cifs/connect.c
> @@ -3451,7 +3451,7 @@ cifs_construct_tcon(struct cifs_sb_info *cifs_sb, u=
id_t fsuid)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto out;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 snprintf(username, MAX_USERNAME_SIZE, "krb50x%x", fsuid);
> + =A0 =A0 =A0 snprintf(username, 28, "krb50x%x", fsuid);
> =A0 =A0 =A0 =A0vol_info->username =3D username;
> =A0 =A0 =A0 =A0vol_info->local_nls =3D cifs_sb->local_nls;
> =A0 =A0 =A0 =A0vol_info->linux_uid =3D fsuid;
>



--=20
Thanks,

Steve
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
