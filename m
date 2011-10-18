From: Steve French <smfrench@gmail.com>
Date: Tue, 18 Oct 2011 15:42:07 +0000
Subject: Re: [patch v2] CIFS: cleanup min_t() cast in cifs_read()
Message-Id: <CAH2r5muB5GSs35xUvmeufH2U3XZ8Wz2N34DqDww_j9fnV=GdQQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111017073018.GC7812@elgon.mountain>
	<CAH2r5mufq0=BsZvfGuVdd1BU-gxRpnUmWAm-vzhsOR4KbvGSbg@mail.gmail.com>
	<20111018094135.GE25814@longonot.mountain>
In-Reply-To: <20111018094135.GE25814-dZEljifmRObu9KfB+GxooP8+0UxHXcjY@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Steve French <sfrench-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, linux-cifs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, samba-technical-w/Ol4Ecudpl8XjKLYN78aQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

merged.

On Tue, Oct 18, 2011 at 4:41 AM, Dan Carpenter <dan.carpenter@oracle.com> w=
rote:
> Smatch complains that the cast to "int" in min_t() changes very large
> values of current_read_size into negative values and so min_t()
> could return the wrong value. =A0I removed the const as well, as that
> doesn't do anything here.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: =A0use "uint" instead of "u32".
>
> diff --git a/fs/cifs/file.c b/fs/cifs/file.c
> index ab85699..34be15a 100644
> --- a/fs/cifs/file.c
> +++ b/fs/cifs/file.c
> @@ -1900,13 +1900,13 @@ static ssize_t cifs_read(struct file *file, char =
*read_data, size_t read_size,
> =A0 =A0 =A0 =A0for (total_read =3D 0, current_offset =3D read_data;
> =A0 =A0 =A0 =A0 =A0 =A0 read_size > total_read;
> =A0 =A0 =A0 =A0 =A0 =A0 total_read +=3D bytes_read, current_offset +=3D b=
ytes_read) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 current_read_size =3D min_t(const int, read=
_size - total_read,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 current_read_size =3D min_t(uint, read_size=
 - total_read,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0cifs_sb->rsize);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* For windows me and 9x we do not want to=
 request more
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0than it negotiated since it will refuse th=
e read then */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if ((pTcon->ses) &&
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0!(pTcon->ses->capabilities=
 & CAP_LARGE_FILES)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 current_read_size =3D min_t=
(const int, current_read_size,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 current_read_size =3D min_t=
(uint, current_read_size,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0CIFSMaxBufSize);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0rc =3D -EAGAIN;
>



--=20
Thanks,

Steve
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
