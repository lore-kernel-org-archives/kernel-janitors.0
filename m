From: Greg KH <greg@kroah.com>
Date: Tue, 27 Jul 2004 18:26:17 +0000
Subject: [Kernel-janitors] Re: [PATCH] irda/irtty-sir: replace
Message-Id: <20040727182617.GA10173@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============39956985844780257=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040727175004.GA18782@bougret.hpl.hp.com>
In-Reply-To: <20040727175004.GA18782@bougret.hpl.hp.com>
To: kernel-janitors@vger.kernel.org

--===============39956985844780257==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 27, 2004 at 10:50:04AM -0700, Jean Tourrilhes wrote:
> 	I would suggest renaming "msleep()" to "task_msleep()" or
> "schedule_msleep()" before applying this patch, so that things are
> clear. Or just make "task_msleep()" or "schedule_msleep()" a wrapper
> around "msleep()".

No, the name "msleep" is just fine.  If you have any questions about it,
the kerneldoc comments for it should explain it quite nicely.

thanks,

greg k-h

--===============39956985844780257==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============39956985844780257==--
