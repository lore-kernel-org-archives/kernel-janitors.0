From: James Lamanna <jlamanna@gmail.com>
Date: Tue, 04 Jan 2005 23:17:39 +0000
Subject: [KJ] Re: [PATCH] [0/29] vfree() checking cleanups
Message-Id: <aa4c40ff05010415173a9d7bb2@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============15327471807875992=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============15327471807875992==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Due to a problem with Google's SMTP setup (I think it might be a TLS
issue), some of the patches got messed up.
Here's a good set...


On Tue, 4 Jan 2005 13:56:20 -0800, James Lamanna <jlamanna@gmail.com> wrote:
> The following patches against 2.6.10 clean up the case of:
> if (var)
>     vfree(var);
> 
> This check is redundant since it occurs in vfree()
> 
> There is a similar cleanup for kfree(), but I haven't gotten to that
> one yet since there are many many many more of those.
> 
> -- James Lamanna
>

--===============15327471807875992==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============15327471807875992==--
