From: Richard Genoud <richard.genoud@gmail.com>
Date: Sun, 13 Mar 2011 22:45:17 +0000
Subject: =?UTF-8?Q?Re=3A_=5BPATCH=5D_cifssmb=3A_=5BFIX=5D_warning=3A_=E2=80=98pdata=E2=80=99_may_?=
Message-Id: <AANLkTikJVqk7UO6Be1A12SRp62z0h7rjEdhUa-uMYH2t@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1300033426-22404-1-git-send-email-richard.genoud@gmail.com> <AANLkTiko9Y6z79XwkxN7dEAyikQbO=Azdiu0hhK+uiJc@mail.gmail.com>
In-Reply-To: <AANLkTiko9Y6z79XwkxN7dEAyikQbO=Azdiu0hhK+uiJc-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Steve French <smfrench-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Steve French <sfrench-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, linux-cifs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, samba-technical-w/Ol4Ecudpl8XjKLYN78aQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

2011/3/13 Steve French <smfrench@gmail.com>:
> This does look a problem with the compiler. =C2=A0Which compiler version?
>
> As you noted, pdata is either initialized or we return rc!=3D0 and don't =
use it.
>
The compiler is gcc from ubuntu 10.10 :
gcc (Ubuntu/Linaro 4.4.4-14ubuntu5) 4.4.5
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
