From: Greg KH <greg@kroah.com>
Date: Mon, 26 Apr 2004 19:45:51 +0000
Subject: Re: [Kernel-janitors] [PATCH] missing audit in bus_register()
Message-Id: <20040426194551.GA28918@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============704898337445381=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040425215141.GA32051@charlie.minidns.net>
In-Reply-To: <20040425215141.GA32051@charlie.minidns.net>
To: kernel-janitors@vger.kernel.org

--===============704898337445381==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Apr 25, 2004 at 11:51:41PM +0200, Daniele Bellucci wrote:
> 
> 
> hi all, 
> this patch add some missing audits in bus_register()
> 
> Please Apply ;)

Hm, no.  How about using a goto on the error path to clean up properly
instead of the different return sections.

thanks,

greg k-h

--===============704898337445381==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============704898337445381==--
