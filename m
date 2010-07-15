From: Jarod Wilson <jarod@wilsonet.com>
Date: Thu, 15 Jul 2010 22:07:39 +0000
Subject: Re: [PATCH 24/25] video/ivtv: Convert pci_table entries to
Message-Id: <AANLkTikFTK4KwxKgQqwIId3dPy5hf5X0WjsAYkE5pEd4@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201007152108.27175.PeterHuewe@gmx.de>
	<1279230200.7920.23.camel@morgan.silverblock.net>
In-Reply-To: <1279230200.7920.23.camel@morgan.silverblock.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Andy Walls <awalls@md.metrocast.net>
Cc: Peter Huewe <PeterHuewe@gmx.de>, Kernel Janitors <kernel-janitors@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, Ian Armstrong <ian@iarmst.demon.co.uk>, Douglas Schilling Landgraf <dougsland@redhat.com>, Steven Toth <stoth@kernellabs.com>, ivtv-devel@ivtvdriver.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jul 15, 2010 at 5:43 PM, Andy Walls <awalls@md.metrocast.net> wrote:
> On Thu, 2010-07-15 at 21:08 +0200, Peter Huewe wrote:
>> From: Peter Huewe <peterhuewe@gmx.de>
>>
>> This patch converts pci_table entries, where .subvendor=3DPCI_ANY_ID and
>> .subdevice=3DPCI_ANY_ID, .class=3D0 and .class_mask=3D0, to use the
>> PCI_VDEVICE macro, and thus improves readability.
>
> Hi Peter,
>
> I have to disagree. =A0The patch may improve typesetting, but it degrades
> clarity and maintainability from my perspective.
>
> a. PCI_ANY_ID indicates to the reader a wildcard match is being
> performed. =A0The PCI_VDEVICE() macro hides that to some degree.
>
> b. PCI_VENDOR_ID_ICOMP clearly indicates that ICOMP is a vendor.
> "ICOMP" alone does not hint to the reader that is stands for a company
> (the now defunct "Internext Compression, Inc.").

Personally, I'm a fan of comments around things like this to describe
*exactly* what device(s) they're referring to. Then ICOMP being all
alone without the prefix isn't really much of an issue (though it
could still be easily mistaken for something other than a pci vendor
id, I suppose).

--=20
Jarod Wilson
jarod@wilsonet.com
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
