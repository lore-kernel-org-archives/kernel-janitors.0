From: Greg KH <greg@kroah.com>
Date: Thu, 20 May 2004 21:35:59 +0000
Subject: Re: [Kernel-janitors] [PATCH] yield() replaced with
Message-Id: <20040520213559.GE27095@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============74125609828508043=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.SOL.4.31.0405201148160.28451-200000@bodega.cs.umass.edu>
In-Reply-To: <Pine.SOL.4.31.0405201148160.28451-200000@bodega.cs.umass.edu>
To: kernel-janitors@vger.kernel.org

--===============74125609828508043==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 20, 2004 at 01:41:11PM -0700, Randy.Dunlap wrote:
> For some of these, a new function that was just added might be
> the appropriate kernel API to use.  Look at msleep() [merged
> 2004-may-18] to see if it can be used.  It's in include/linux/delay.h
> in a kernel bk pull or bk patch and will be in 2.6.7.

I agree, most of the longer delays in the kernel can be converted to use
msleep() as it will work properly.  Yet another thing to add to the
janitor list :)

thanks,

greg k-h

--===============74125609828508043==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============74125609828508043==--
