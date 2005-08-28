From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 28 Aug 2005 01:56:27 +0000
Subject: Re: [KJ] [PATCH] rio: bring prototypes to the new century
Message-Id: <20050828020033.GA12107@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============72511028784524134=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050827213036.GA481@mipter.zuzino.mipt.ru>
In-Reply-To: <20050827213036.GA481@mipter.zuzino.mipt.ru>
To: kernel-janitors@vger.kernel.org

--===============72511028784524134==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 28, 2005 at 09:52:57AM +1000, Tony Breeds wrote:
> On Sun, Aug 28, 2005 at 01:30:36AM +0400, Alexey Dobriyan wrote:
> >  drivers/char/rio/rioboot.c  |   25 ++------------
> >  drivers/char/rio/rioctrl.c  |   12 +-----
> >  drivers/char/rio/rioinit.c  |   78 ++++++++++----------------------------------
> >  drivers/char/rio/riointr.c  |   18 ++--------
> >  drivers/char/rio/rioparam.c |   24 +++----------
> >  drivers/char/rio/rioroute.c |   35 ++++---------------
> >  drivers/char/rio/riotable.c |   19 ++--------
> >  drivers/char/rio/riotty.c   |   14 +------
> >  8 files changed, 51 insertions(+), 174 deletions(-)
> 
> Has Roger seen this?

Not yet. I assume after the patch will be rewieved here it'll go to
maintainer. 

> I showed him sonething similar a while ago and he explained that the rio
> drivers are shared accross several OS's.

I understand.

[reasons why OS abstraction headers suck preventively snipped]


--===============72511028784524134==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============72511028784524134==--
