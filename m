From: Greg KH <greg@kroah.com>
Date: Mon, 02 Aug 2004 23:12:34 +0000
Subject: [Kernel-janitors] Re: [PATCH] scx200_acb: replace
Message-Id: <20040802231234.GE15751@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============15448543147964333=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============15448543147964333==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 22, 2004 at 10:17:50PM +0000, Nishanth Aravamudan wrote:
> I would appreciate any comments from the janitors list. This is one (of
> a few) places where I had to make a decision to set the state before the
> call to
> 
> schedule_timeout();
> 
> This of course affected any decision to replace the code with msleep()
> or not. Please inform if the other state from the one I used is desired.

Applied, thanks.

greg k-h


--===============15448543147964333==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============15448543147964333==--
