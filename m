From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 25 Aug 2020 10:00:31 +0000
Subject: Re: [PATCH] USB: PHY: JZ4770: Fix static checker warning
Message-Id: <20200825100030.GA1347872@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <96687bd5-aa10-b908-471a-31e8daa01472@web.de>
In-Reply-To: <96687bd5-aa10-b908-471a-31e8daa01472@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Markus Elfring <Markus.Elfring@web.de>
Cc: =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Dongsheng Qiu <dongsheng.qiu@ingenic.com>, Felipe Balbi <balbi@kernel.org>, qipengzhen <aric.pzqi@ingenic.com>, Rick Tyliu <rick.tyliu@ingenic.com>, Yanfei Li <yanfei.li@ingenic.com>, zhenwenjin@gmail.com, =?utf-8?B?5ZGo5q2j?= <sernia.zhou@foxmail.com>

On Tue, Aug 25, 2020 at 11:35:16AM +0200, Markus Elfring wrote:
> > The commit 2a6c0b82e651 ("USB: PHY: JZ4770: Add support for new
> > Ingenic SoCs.") introduced the initialization function for different
> > chips, but left the relevant code involved in the resetting process
> > in the original function, resulting in uninitialized variable calls.
>=20
> * Can another imperative wording be helpful for the change description?
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/submitting-patches.rst?id=D012a7190fc1fd72ed48911e77=
ca97ba4521bccd#n151
>=20
> * How do you think about to mention any source code analysis tool here?
>=20
> * Would an other commit subject be more appropriate?
>=20
>=20
> > Fixes: 2a6c0b82e651 ("USB: PHY: JZ4770: Add support for new
> > Ingenic SoCs.").
>=20
> Please omit a line break for this tag.
>=20
>=20
> I find that a single patch would not need a cover letter.

Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot
