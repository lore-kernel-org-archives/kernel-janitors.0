From: Alex Shepard <ashepard@u.washington.edu>
Date: Thu, 19 Jan 2006 20:31:53 +0000
Subject: Re: [KJ] [PATCH 4/5] README: name kernel versions either "2.6.x",
Message-Id: <1137702713.3205.43.camel@athena.sea.amer.gettywan.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============34851848278785735=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <a01a16b50601191216v70796a40w25825996a60893e9@mail.gmail.com>
In-Reply-To: <a01a16b50601191216v70796a40w25825996a60893e9@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

--===============34851848278785735==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 2006-01-19 at 21:16 +0100, Håkon Løvdal wrote:
>     Replace "XX" with the version number of the latest kernel.
> +   The 2.6 kernels exists in both 2.6.x and 2.6.x.y variants,
> +   "XX" in this file refers to both "x" and "x.y".

This is grammatically incorrect.  
s/exists/exist/ or even better s/exists/are available/.

I would also suggest s/file/document/, but that's just me.

> - - Keep a backup kernel handy in case something goes wrong.  This is
> -   especially true for the development releases, since each new release
> -   contains new code which has not been debugged.  Make sure you keep a
> + - Keep a backup kernel handy in case something goes wrong. Make sure
> you keep a
>     backup of the modules corresponding to that kernel, as well.  If you
>     are installing a new kernel with the same version number as your
>     working kernel, make a backup of your modules directory before you

line wrap?

-alex


--===============34851848278785735==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============34851848278785735==--
