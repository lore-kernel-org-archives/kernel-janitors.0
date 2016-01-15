From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Jan 2016 16:24:50 +0000
Subject: Re: InfiniBand-ocrdma: Delete unnecessary variable initialisations in 11 functions
Message-Id: <56991D52.8030808@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <567EDED5.4040201@users.sourceforge.net>
 <5697D865.5010507@users.sourceforge.net>
 <5697DE31.9040309@users.sourceforge.net> <20160115132014.GC30615@leon.nu>
 <56990733.7000506@users.sourceforge.net> <20160115150935.GA32346@leon.nu>
 <56990FAC.6000506@users.sourceforge.net> <20160115155938.GB32346@leon.nu>
In-Reply-To: <20160115155938.GB32346-2ukJVAZIZ/Y@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
Cc: Devesh Sharma <devesh.sharma-1wcpHE2jlwO1Z/+hSey0Gg@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mitesh Ahuja <mitesh.ahuja-1wcpHE2jlwO1Z/+hSey0Gg@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Selvin Xavier <selvin.xavier-1wcpHE2jlwO1Z/+hSey0Gg@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>

> GCC supported it before 1999 when I saw it first time. My assumption
> that in 2016 all compilers are doing such optimization now.

Interesting =85


> I would be glad to hear an example of modern compiler which doesn't
> support this simple optimization.

Would you like to take into account any other source code analysis approach=
es?


>> Will any configuration parameters and command arguments become relevant
>> to improve also a corresponding software comparison?
>=20
> Please suggest us, you are proposing this change, and not me.

Which combination of hardware and software versions would you find represen=
tative
for a corresponding system check?


>>> The proposed change won't affect performance at all.
>>
>> Will unneeded variable assignments be really optimised away by default?
>=20
> Yes

Can it be that this result will depend on special parameters so that data f=
low
analysis and optimisation will be performed in the way you seem to expect?


> If you are interested in saving space of one latter, you need to take into
> account git database increase, do you?

There are also other aspects to consider:

* Do you insist to initialise a return code at the beginning of every funct=
ion
  with a non-void return type?

* Does each bit of extra information can result also in unwanted consequenc=
es?

* Is this a specific source code review concern?

* Can this software be improved a bit more only if we dare to talk about
  potential update candidates?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
