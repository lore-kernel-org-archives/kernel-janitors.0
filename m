From: Greg KH <greg@kroah.com>
Date: Wed, 05 May 2004 21:41:18 +0000
Subject: Re: [Kernel-janitors] [PATCH] missing audit in bus_register()
Message-Id: <20040505214118.GD29251@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============27955306188884932=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040425215141.GA32051@charlie.minidns.net>
In-Reply-To: <20040425215141.GA32051@charlie.minidns.net>
To: kernel-janitors@vger.kernel.org

--===============27955306188884932==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 27, 2004 at 08:57:06PM +0200, Daniele Bellucci wrote:
> 
> |How about using a goto on the error path to clean up properly
> |instead of the different return sections.
> 
> .. here goes Take 2:

Looks good, applied, thanks.

greg k-h

--===============27955306188884932==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============27955306188884932==--
