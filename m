From: David Brownell <david-b@pacbell.net>
Date: Mon, 07 Mar 2005 17:11:24 +0000
Subject: [KJ] Re: [PATCH] hcd.c
Message-Id: <200503070911.24729.david-b@pacbell.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============87917589277779529=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============87917589277779529==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 07 March 2005 8:26 am, Carlo Perassi wrote:
> Hi.
> 
> I know this patch is not a clean solution but without it I got the
> following error
> 
> drivers/usb/core/hcd.c:131: error: parse error before '>>' token

... etc, since the initializer has ((constant >> constant) & constant)
constructs.  I suspect that either you're using a broken GCC or you're
seeing the results of hacking <linux/version.h> in ways that break
lots of additional stuff.  Over the past three or four years, nobody
else has reported such a problem; it's surely something in your specific
build environment.

- Dave

--===============87917589277779529==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============87917589277779529==--
