From: maximilian attems <janitor@sternwelten.at>
Date: Mon, 24 May 2004 10:46:57 +0000
Subject: Re: [Kernel-janitors] [PATCH] yield() replaced with
Message-Id: <20040524104657.GE1949@sputnik.stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============76941871670294271=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.SOL.4.31.0405201148160.28451-200000@bodega.cs.umass.edu>
In-Reply-To: <Pine.SOL.4.31.0405201148160.28451-200000@bodega.cs.umass.edu>
To: kernel-janitors@vger.kernel.org

--===============76941871670294271==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

hello greg,

On Thu, 20 May 2004, Greg KH wrote:

> On Thu, May 20, 2004 at 01:41:11PM -0700, Randy.Dunlap wrote:
> > For some of these, a new function that was just added might be
> > the appropriate kernel API to use.  Look at msleep() [merged
> > 2004-may-18] to see if it can be used.  It's in include/linux/delay.h
> > in a kernel bk pull or bk patch and will be in 2.6.7.
> 
> I agree, most of the longer delays in the kernel can be converted to use
> msleep() as it will work properly.  Yet another thing to add to the
> janitor list :)

please detail functionnames of these longer delays for the TODO?

does it affect the patches from Gustavo Franco?
yield-* in http://debian.stro.at/kjt/2.6.7-rc1-kjt1/split/

thanks 
maks


--===============76941871670294271==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============76941871670294271==--
