From: Greg KH <greg@kroah.com>
Date: Wed, 11 May 2011 23:19:22 +0000
Subject: Re: [PATCH 04/12] staging: usbip: replace usbip_u{dbg,err,info} and
Message-Id: <20110511231922.GD7362@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1305103212.git.mfm@muteddisk.com>
 <0c3a71ba4811a3ab470d307650067e9c2b52379b.1305103212.git.mfm@muteddisk.com>
 <20110511210639.GA4679@kroah.com>
 <BANLkTimBxkF4KbXfm7Ma8cmpDF9EPjfMWQ@mail.gmail.com>
In-Reply-To: <BANLkTimBxkF4KbXfm7Ma8cmpDF9EPjfMWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: matt mooney <mfmooney@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, May 11, 2011 at 03:51:58PM -0700, matt mooney wrote:
> On Wed, May 11, 2011 at 2:06 PM, Greg KH <greg@kroah.com> wrote:
> > On Wed, May 11, 2011 at 01:54:16AM -0700, matt mooney wrote:
> >> This switches all of the non dev_<level> print statements to use the
> >> pr_<level> macros. And a few debug statements are removed.
> >
> > Can't most of these be moved to use the dev_* calls instead?
>=20
> I believe so and had planned to do this is in a second pass.

Ah, you didn't say that :)

> >> Signed-off-by: matt mooney <mfm@muteddisk.com>
> >> ---
> >> =A0drivers/staging/usbip/stub_dev.c =A0 =A0 | =A0 22 ++--
> >> =A0drivers/staging/usbip/stub_main.c =A0 =A0| =A0 19 ++--
> >> =A0drivers/staging/usbip/stub_rx.c =A0 =A0 =A0| =A0 24 ++--
> >> =A0drivers/staging/usbip/stub_tx.c =A0 =A0 =A0| =A0 16 ++--
> >> =A0drivers/staging/usbip/usbip_common.c | =A0228 +++++++++++++++------=
------------
> >> =A0drivers/staging/usbip/usbip_common.h | =A0 46 +------
> >> =A0drivers/staging/usbip/usbip_event.c =A0| =A0 =A03 +-
> >> =A0drivers/staging/usbip/vhci_hcd.c =A0 =A0 | =A0 87 +++++--------
> >> =A0drivers/staging/usbip/vhci_rx.c =A0 =A0 =A0| =A0 33 +++---
> >> =A0drivers/staging/usbip/vhci_sysfs.c =A0 | =A0 14 +-
> >> =A0drivers/staging/usbip/vhci_tx.c =A0 =A0 =A0| =A0 =A08 +-
> >> =A011 files changed, 209 insertions(+), 291 deletions(-)
> >>
> >> diff --git a/drivers/staging/usbip/stub_dev.c b/drivers/staging/usbip/=
stub_dev.c
> >> index c71d0a3..0c0d838 100644
> >> --- a/drivers/staging/usbip/stub_dev.c
> >> +++ b/drivers/staging/usbip/stub_dev.c
> >> @@ -196,7 +196,7 @@ static void stub_shutdown_connection(struct usbip_=
device *ud)
> >> =A0 =A0 =A0 =A0* step 1?
> >> =A0 =A0 =A0 =A0*/
> >> =A0 =A0 =A0 if (ud->tcp_socket) {
> >> - =A0 =A0 =A0 =A0 =A0 =A0 usbip_udbg("shutdown tcp_socket %p\n", ud->t=
cp_socket);
> >> + =A0 =A0 =A0 =A0 =A0 =A0 pr_debug("shutdown tcp_socket %p\n", ud->tcp=
_socket);
> >
> > Like here, we have a valid struct device pointer from what I can tell,
> > so we should use dev_dbg() instead of pr_debug().
> >
> > I think a lot of these conversions could use those calls here, right?
> >
> > So care to split this into 2 patches, one that converts to valid usages
> > of the dev_* calls, and the other a patch that converts the rest to pr_*
> > calls?
>=20
> Do you mind just taking this as is for now? That way I can do the
> dev_dbg() conversion on a case by case basis as I become more familiar
> with the code, which was kind of my original plan. This patch still
> provides a fair amount of cleanup ;)

Yes it does, but I would prefer if you did it right the first time.
It's neater that way and makes more sense.

So, can you please redo this and resend it?

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
