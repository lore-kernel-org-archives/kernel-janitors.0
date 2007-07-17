From: Bernd Petrovitsch <bernd@firmix.at>
Date: Tue, 17 Jul 2007 09:43:27 +0000
Subject: Re: [KJ] [PATCH] Removal of compiler warnings in ipc/msg.c
Message-Id: <1184665407.18504.2.camel@tara.firmix.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <efa8e58e0707170238g9eda0e5rfa435afd30a4c3ef@mail.gmail.com>
In-Reply-To: <efa8e58e0707170238g9eda0e5rfa435afd30a4c3ef@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Tue, 2007-07-17 at 11:38 +0200, Rune V. Sj=C3=B8en wrote:
> Hello, this is my first patch so please be gentle.
> It fixes some compiler warnings in ipc/msg.c
>=20
> ipc/msg.c: In function 'sys_msgctl':
> ipc/msg.c:388: warning: 'setbuf.qbytes' may be used uninitialized in
> this function
> ipc/msg.c:388: warning: 'setbuf.uid' may be used uninitialized in this fu=
nction
> ipc/msg.c:388: warning: 'setbuf.gid' may be used uninitialized in this fu=
nction
> ipc/msg.c:388: warning: 'setbuf.mode' may be used uninitialized in this f=
unction
>=20
> Any kind of feedback would be appreciated if i've done something wrong.
>=20
> --
> diff --git a/ipc/msg.c b/ipc/msg.c
> index cbd27e5..e5e62ca 100644
> --- a/ipc/msg.c
> +++ b/ipc/msg.c
> @@ -390,6 +390,8 @@ asmlinkage long sys_msgctl(int msqid, int cmd,
> struct msqid_ds __user *buf)
>        int err, version;
>        struct ipc_namespace *ns;
>=20
> +       memset(&setbuf, '0', sizeof(setbuf));

Without looking into the file and context (e.g. if it *really* is used
uninitialized): Are you really sure you really want to write 0x30 (i.e.
decimal 48 and the ASCII value of '0') in every byte instead of 0x00 in
the struct as initialization?

	Bernd
--=20
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services


_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will b=
e discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructio=
ns.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
