From: Andrei Emeltchenko <andrei.emeltchenko.news@gmail.com>
Date: Fri, 02 Mar 2012 12:32:15 +0000
Subject: Re: Resend: [PATCH] Bluetooth: Fix Endian Bug.
Message-Id: <20120302123210.GA4741@aemeltch-MOBL1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1330599561-20392-1-git-send-email-santoshprasadnayak@gmail.com>
 <20120301123540.GE25627@aemeltch-MOBL1>
 <CAOD=uF4LSS8nuKMNHGEH2JsVZHU0rntSxZjvNaa4oZrey1macw@mail.gmail.com>
In-Reply-To: <CAOD=uF4LSS8nuKMNHGEH2JsVZHU0rntSxZjvNaa4oZrey1macw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: santosh prasad nayak <santoshprasadnayak@gmail.com>
Cc: marcel@holtmann.org, padovan@profusion.mobi, davem@davemloft.net, linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Santosh,

On Thu, Mar 01, 2012 at 07:34:58PM +0530, santosh prasad nayak wrote:
> Andrei,
>=20
> I could not get you.
>=20
> Do you want me to resend the patch with subject,
>   "[PATCH] Bluetooth: Fix network to host endian conversion for L2CAP
> chan id."  ?

No, the main concern was your commit message which is changelog and should
come after "---" as it is shown in the example below.

> > On Thu, Mar 01, 2012 at 04:29:21PM +0530, santosh nayak wrote:
> >> From: Santosh Nayak <santoshprasadnayak@gmail.com>
> >>
> >> Fix for endian bug.
> >>
> >> Fix for null dereferenced removed as it is already
> >> submitted by Andrei.
> >>
> >> Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>
> >> ---
> >> =A0net/bluetooth/l2cap_sock.c | =A0 =A05 +++--
> >> =A01 files changed, 3 insertions(+), 2 deletions(-)
> >
> > We prefer following commit log (this is the example)
> >
> > <------8<----------------------------------------------------------
> > | =A0From: Santosh Nayak <santoshprasadnayak@gmail.com>
> > |
> > | =A0Fix network to host endian conversion for L2CAP chan id.
> > |
> > | =A0Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>
> > |
> > | =A0---
> > | =A0 =A0 =A0 =A0 =A0* v2 Fix for null dereferenced removed as it is al=
ready
> > | =A0 =A0 =A0 =A0 =A0submitted by Andrei.
> > |
> > | =A0 =A0net/bluetooth/l2cap_sock.c | =A0 =A05 +++--
> > | =A0 =A01 files changed, 3 insertions(+), 2 deletions(-)
> > |
> > <------8<----------------------------------------------------------

Best regards=20
Andrei Emeltchenko=20
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
