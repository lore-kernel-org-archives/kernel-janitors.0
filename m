From: Greg KH <greg@kroah.com>
Date: Mon, 26 Apr 2004 19:47:46 +0000
Subject: Re: [Kernel-janitors] [patch 2.6.5] kill
Message-Id: <20040426194746.GB28918@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============42860766828108332=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============42860766828108332==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Apr 25, 2004 at 09:12:46PM +0200, Domen Puncer wrote:
> Hi.
> 
> US_FL_MODE_XLATE and US_FL_IGNORE_SER were defined as 0, so remove them.

No, they are needed so that we can keep this file the same for 2.4 and
2.6.  We can't delete them, sorry.

> Also deleted 0.5k of trailing spaces (some people just love it?!).

Ick, no, sorry, this would just get things out of sync too much too.

thanks,

greg k-h

--===============42860766828108332==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============42860766828108332==--
