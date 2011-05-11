From: matt mooney <mfmooney@gmail.com>
Date: Wed, 11 May 2011 22:54:23 +0000
Subject: Re: [PATCH 03/12] staging: usbip: fix header includes
Message-Id: <BANLkTi=R7cwFGbrMiQAENS4R1BivREEh0A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1305103212.git.mfm@muteddisk.com>
	<56b004a084644ec7e9f632d6633aa34177a59818.1305103212.git.mfm@muteddisk.com>
	<20110511210745.GA4875@kroah.com>
In-Reply-To: <20110511210745.GA4875@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Greg KH <greg@kroah.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, May 11, 2011 at 2:07 PM, Greg KH <greg@kroah.com> wrote:
> On Wed, May 11, 2011 at 01:54:15AM -0700, matt mooney wrote:
>> Modify header directives to include what is needed by each file and
>> not already included in its own header.
>
> This patch didn't apply properly:
> =A0 =A0 =A0 =A0patching file drivers/staging/usbip/stub.h
> =A0 =A0 =A0 =A0patching file drivers/staging/usbip/stub_dev.c
> =A0 =A0 =A0 =A0patching file drivers/staging/usbip/stub_main.c
> =A0 =A0 =A0 =A0patching file drivers/staging/usbip/stub_rx.c
> =A0 =A0 =A0 =A0patching file drivers/staging/usbip/stub_tx.c
> =A0 =A0 =A0 =A0patching file drivers/staging/usbip/usbip_common.c
> =A0 =A0 =A0 =A0patching file drivers/staging/usbip/usbip_common.h
> =A0 =A0 =A0 =A0patching file drivers/staging/usbip/usbip_event.c
> =A0 =A0 =A0 =A0patching file drivers/staging/usbip/vhci.h
> =A0 =A0 =A0 =A0patching file drivers/staging/usbip/vhci_hcd.c
> =A0 =A0 =A0 =A0patching file drivers/staging/usbip/vhci_rx.c
> =A0 =A0 =A0 =A0patching file drivers/staging/usbip/vhci_sysfs.c
> =A0 =A0 =A0 =A0Hunk #1 FAILED at 17.
> =A0 =A0 =A0 =A01 out of 1 hunk FAILED -- saving rejects to file drivers/s=
taging/usbip/vhci_sysfs.c.rej
> =A0 =A0 =A0 =A0patching file drivers/staging/usbip/vhci_tx.c
>
> What tree did you make it against?

Hmm, this was all done on linux-next-20110510. I will rebase it onto
your staging-next tree and resend it.

--=20
GPG-Key: 9AFE00EA
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
