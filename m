From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 May 2012 17:08:46 +0000
Subject: Re: [PATCH] Staging: Comedi adv_pci1710 : Corrected DPRINTK formatting
Message-Id: <20120504170846.GA5409@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1335628246-3003-1-git-send-email-tomas.melin@iki.fi>
In-Reply-To: <1335628246-3003-1-git-send-email-tomas.melin@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Fri, May 04, 2012 at 07:25:00PM +0300, Tomas Melin wrote:
> On Fri, May 4, 2012 at 4:34 PM, Dan Carpenter <dan.carpenter@oracle.com> =
wrote:
> > On Thu, May 03, 2012 at 06:27:36PM +0300, Tomas Melin wrote:
> >> Corrected formatting for several DPRINT messages.
> >>
> >
> > This patch is fine, but eventually these will have to changed to:
> >
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_dbg(dev->class_dev,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"adv_pci1710 EDBG: BGN: =
pci171x_ai_cmdtest(...) err=3D%d ret=3D1\n",
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0err);
> >
>=20
> Ok, I see. So dev_dbg() should always be preffered for debug printing?
>=20

Yep.  I think dev_info() and friends are prefered now.  Btw, are you
subscribed to the driver-devel mailing list?  Hm...  This email
should have been CC'd to that list, but it's not.

There was a discussion earlier about whether dev->class_dev was the
right device pointer to use.  I think we decided it was.  But it
would be good if someone were testing this.  I assume you don't
have the hardware.

> Also while we are at it, how strict is the rule that printk:s should
> include KERN_ facility level statements? are missing facility levels
> worth patching?
>=20

I think instead of adding KERN_ levels we're trying to move to
dev_warn() etc.

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
