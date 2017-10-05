From: Julia Lawall <julia.lawall@lip6.fr>
Date: Thu, 05 Oct 2017 20:06:11 +0000
Subject: Re: [PATCH 1/2] powerpc/platforms/cell: Delete an error message for a failed memory allocation in th
Message-Id: <alpine.DEB.2.20.1710052205560.2626@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1723145302-1507233971=:2626"
List-Id: <kernel-janitors.vger.kernel.org>
References: <db9efaf4-f3d7-d5dc-b0b2-f20e418fa3c8@users.sourceforge.net>
 <62146108-5be0-c236-f404-4be122e162ac@users.sourceforge.net>
 <20171005220210.681f78e8@kitsune.suse.cz>
In-Reply-To: <20171005220210.681f78e8@kitsune.suse.cz>
To: =?ISO-8859-15?Q?Michal_Such=E1nek?= <msuchanek@suse.de>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, linuxppc-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

--8323329-1723145302-1507233971=:2626
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable



On Thu, 5 Oct 2017, Michal Such=E1nek wrote:

> Hello,
>
> On Thu, 5 Oct 2017 21:36:26 +0200
> SF Markus Elfring <elfring@users.sourceforge.net> wrote:
>
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Thu, 5 Oct 2017 21:04:30 +0200
> >
> > Omit extra messages for a memory allocation failure in these
> > functions.
>
> this is bogus. All these functions return -1 on any error. Until they
> reflect the error in their return value (and it is properly propagated
> to the user) there is no way to tell WTF failed without the message.

A backtrace will be generated.

julia

>
> >
> > This issue was detected by using the Coccinelle software.
> >
>
> ... which provides only a hint which should be evaluated by the user.
>
> Thanks
>
> Michal
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors=
" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
--8323329-1723145302-1507233971=:2626--
