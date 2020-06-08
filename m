From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 08 Jun 2020 11:01:32 +0000
Subject: Re: usb: gadget: function: printer: Fix use-after-free in __lock_acquire()
Message-Id: <20200608110132.GA296162@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5207d179-0a7d-b5ff-af34-102fb21028b5@web.de>
 <DM5PR11MB205835FB50BA296232BC3163FF850@DM5PR11MB2058.namprd11.prod.outlook.com>
 <ae59cac9-d770-36bd-ccb2-e5e442bd5e0a@web.de>
In-Reply-To: <ae59cac9-d770-36bd-ccb2-e5e442bd5e0a@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Markus Elfring <Markus.Elfring@web.de>, Qiang Zhang <Qiang.Zhang@windriver.com>
Cc: linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, Felipe Balbi <balbi@kernel.org>, Kyungtae Kim <kt0755@gmail.com>

On Mon, Jun 08, 2020 at 12:55:13PM +0200, Markus Elfring wrote:
> > I don't need to add Fix tag to view the code.
>=20
> I have got understanding difficulties for this kind of feedback.
> How much do you care for corresponding patch review concerns?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?id=AF7b4801030c07637840191c69eb=
666917e4135d#n183

Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless review
comment to a patch submission on a Linux kernel developer mailing list.
I strongly suggest that you not do this anymore.  Please do not bother
developers who are actively working to produce patches and features with
comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not needed
to follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and inability
to adapt to feedback.  Please feel free to also ignore emails from them.

thanks,

greg k-h's patch email bot
