From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Sun, 24 Sep 2006 11:48:34 +0000
Subject: Re: [KJ] [PATCH] Prevent multiple inclusion of linux/sysrq.h
Message-Id: <9a8748490609240448od96d359ic90a4ff369eb58f5@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <E1GQtbr-0005Or-LP@localhost.localdomain>
In-Reply-To: <E1GQtbr-0005Or-LP@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 24/09/06, Jesper Juhl <jesper.juhl@gmail.com> wrote:
> On 24/09/06, Thomas Petazzoni <thomas.petazzoni@enix.org> wrote:
> > Hi,
> >
> > Le Sat, 23 Sep 2006 00:35:03 +0200,
> > Thomas Petazzoni <thomas.petazzoni@enix.org> a =E9crit :
> >
> > > Prevent multiple inclusions of include/linux/sysrq.h using traditional
> > > #ifndef..#endif.
> > >
> > > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@enix.org>
> >
> > To who should I send this patch for inclusion ? The
> > include/linux/sysrq.h is not really part of a driver nor a
> > subsystem, so there's seems to be no maintainer listed in the
> > MAINTAINERS file.
> >
> > Any suggestion ?
> >
>
> Well, patches that have no obvious recipients can often go via Andrew
> Morton or just be send to LKML.
>
> In this case, if you look in the file, there are two names mentioned :
>
> Martin Mares <mj@atrey.karlin.mff.cuni.cz>
> Crutcher Dunnavant <crutcher+kernel@datastacks.com>
>
> So those two might make sense to add to Cc:
>
> There are also some people mentioned in Documentation/sysrq.txt but I
> suspect they just wrote the documentation and wouldn't be relevant for
> this patch, but you could still consider adding them to Cc:
>
>

For trivial patches adding the Trivial Patch Monkey (currently Adrian
Bunk) to Cc: is also often a good idea. trivial@kernel.org

See Documentation/SubmittingPatches for the details on what qualifies
as a trivial patch.


--=20
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
