From: Greg KH <gregkh@linuxfoundation.org>
Date: Sun, 25 May 2014 18:33:05 +0000
Subject: Re: [PATCH] staging: gdm72xx: use time_before()
Message-Id: <20140525183305.GA11364@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401023339-29712-1-git-send-email-manuel.schoelling@gmx.de>
 <20140525181431.GA20614@kroah.com>
 <1401042273.7538.10.camel@schoellingm.dzne.de>
In-Reply-To: <1401042273.7538.10.camel@schoellingm.dzne.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Manuel Schoelling <manuel.schoelling@gmx.de>
Cc: devel@driverdev.osuosl.org, arnd@arndb.de, peter.p.waskiewicz.jr@intel.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, khoroshilov@ispras.ru

On Sun, May 25, 2014 at 08:24:33PM +0200, Manuel Schoelling wrote:
> On So, 2014-05-25 at 11:14 -0700, Greg KH wrote:
> > On Sun, May 25, 2014 at 03:08:59PM +0200, Manuel Sch=F6lling wrote:
> > > To be future-proof and for better readability the time comparisons are
> > > modified to use time_before() instead of plain, error-prone math.
> > >=20
> > > Signed-off-by: Manuel Sch=F6lling <manuel.schoelling@gmx.de>
> > > ---
> > >  drivers/staging/gdm72xx/gdm_usb.c |    2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > This patch doesn't apply, can you please refresh it against my latest
> > tree and resend?
> That's weird. I pulled the lastest master from Linus and rebased the
> patch, but no modification of my patch was required (latest commit
> before my patch to that file was
> 8943a92fc257c439ffe55fb0f9896be57c58c56b according to my repo).=20
>=20
> Maybe you have a more recent version than Linus?


I have a much different version from Linus, with a few thousand patches
added, otherwise how would I be able to queue up stuff to go to Linus
for the next kernel release?  :)

For the staging patches, either use the linux-next tree (which you
should use for all kernel development), or my staging.git tree, and the
staging-next branch on git.kernel.org, which is what gets pulled into
linux-next every week-day.

If you have more questions about this, take a look at
Documentation/development-process/  it should explain how patches move
to Linus and why working against Linus's tree isn't going to get you
very far.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
