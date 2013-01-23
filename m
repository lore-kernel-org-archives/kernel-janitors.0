From: Bernd Petrovitsch <bernd@petrovitsch.priv.at>
Date: Wed, 23 Jan 2013 11:36:55 +0000
Subject: Re: [patch] drm/nouveau/disp: sizeof() wrong pointer
Message-Id: <1358941017.28763.6.camel@thorin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130122072022.GB8966@elgon.mountain>
	<1358847745.17068.7.camel@mattotaupa> <20130123083837.GZ4584@mwanda>
In-Reply-To: <20130123083837.GZ4584@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, Paul Menzel <paulepanter@users.sourceforge.net>, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>

On Mit, 2013-01-23 at 11:38 +0300, Dan Carpenter wrote:
> On Tue, Jan 22, 2013 at 10:42:25AM +0100, Paul Menzel wrote:
> > 
> > Did you find this by manual inspection or did you use some tool?
> 
> I found this because it caused a problem in a parser I was working
> on but Sparse warns about "warning: expression using sizeof(void)".

gcc's -Wpointer-arith option also reports this.
Never tried it on the kernel though .....

	Bernd
-- 
Bernd Petrovitsch                  Email : bernd@petrovitsch.priv.at
                     LUGA : http://www.luga.at

