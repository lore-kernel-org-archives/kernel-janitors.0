From: Steve French <smfrench@gmail.com>
Date: Thu, 28 Oct 2010 00:57:13 +0000
Subject: Re: [patch 1/2] cifs: add kfree() on error path
Message-Id: <AANLkTin48NsEA8OcL3Tt=5ygL5+mnMbpDMQkupUzC2NK@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101027211932.GK6062@bicker>
In-Reply-To: <20101027211932.GK6062@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Steve French <sfrench-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, linux-cifs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, samba-technical-w/Ol4Ecudpl8XjKLYN78aQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, Oct 27, 2010 at 4:19 PM, Dan Carpenter <error27@gmail.com> wrote:
> We leak 256 bytes here on this error path.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
>
> diff --git a/fs/cifs/file.c b/fs/cifs/file.c
> index 45af003..06a006b 100644
> --- a/fs/cifs/file.c
> +++ b/fs/cifs/file.c
> @@ -1353,6 +1353,7 @@ static int cifs_writepages(struct address_space *ma=
pping,
> =A0 =A0 =A0 =A0if (!experimEnabled && tcon->ses->server->secMode &
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(SECMODE_SIGN_REQUIRED | S=
ECMODE_SIGN_ENABLED)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cifsFileInfo_put(open_file);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(iov);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return generic_writepages(mapping, wbc);
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0cifsFileInfo_put(open_file);

Yes. obviously correct.- merged.

--=20
Thanks,

Steve
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
