From: Clemens Buchacher <drizzd@aon.at>
Date: Wed, 22 Sep 2004 13:35:54 +0000
Subject: Re: [Kernel-janitors] [PATCH] __FUNCTION__ string concatenation
Message-Id: <20040923131903.GA25729@kzelldran>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============58770515718540484=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040705120057.GA22161@moley.homelinux.net>
In-Reply-To: <20040705120057.GA22161@moley.homelinux.net>
To: kernel-janitors@vger.kernel.org

--===============58770515718540484==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 20, 2004 at 06:59:28PM +0200, maximilian attems wrote:
> On Mon, 20 Sep 2004, Clemens Buchacher wrote:
> >  arch/mips/au1000/common/usbdev.c |    4 ++--
> >  drivers/net/gt96100eth.c         |   10 +++++-----
> >  sound/oss/au1000.c               |    2 +-
> >  sound/oss/ite8172.c              |    2 +-
> >  4 files changed, 9 insertions(+), 9 deletions(-)
> > 
> > Status: untested
> > 
> would be cool to get those in 4 separeted mails and compile tested.

Unfortunately, the whole MIPS tree seems to be in no condition to compile. It
would probably be a better idea to apply this patch to the linux-mips branch.

I will do that as soon as I can free enough bandwidth to pull from
linux-mips.bkbits.net.

Clemens

--===============58770515718540484==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============58770515718540484==--
