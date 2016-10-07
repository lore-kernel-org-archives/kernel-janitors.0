From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 07 Oct 2016 06:27:21 +0000
Subject: Re: scripts/coccicheck: Update for a comment?
Message-Id: <alpine.DEB.2.10.1610070824490.3074@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea62a1ea-c566-65a0-e2fd-2ee96839cf48@users.sourceforge.net>
 <alpine.DEB.2.10.1610070749420.3074@hadrien>
 <76a6d8fa-03b9-5589-2885-fa62933dd391@users.sourceforge.net>
 <alpine.DEB.2.10.1610070803550.3074@hadrien>
 <8d36952c-1dbb-bb26-ee57-3e1540c042c0@users.sourceforge.net>
In-Reply-To: <8d36952c-1dbb-bb26-ee57-3e1540c042c0@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: cocci@systeme.lip6.fr



On Fri, 7 Oct 2016, SF Markus Elfring wrote:

> >>>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tre=
e/scripts/coccicheck?id=C802e87fbe2d4dd58982d01b3c39bc5a781223aa#n4
> >>>
> >>> How about submitting a patch to fix the problem?
> >>
> >> I would appreciate to become a bit more sure about the current storage=
 location
> >> which should be referenced in this file.
> >
> > In the Documentation directory find . -name "*cocci*"
> >
> > gives
> >
> > ./dev-tools/coccinelle.rst
> >
> > I think you could have done that yourself.
>
> Does the usage of the format "reStructuredText" trigger further considera=
tions
> like the following?
>
> * Does your feedback suggest that the path from this source file should b=
e put
>   in related places?
>
> * Would it make sense to store such a file name in a special variable?
>
> * When would you refer to generated file formats (like PDF) for this use =
case?

Either you send the patch, or I will send the patch, when I have time,
with no credit to you.  I'm not an expert on all of the future plans for
the documentation,  The only think I know is where the file is now, and
that the file is perfectly readable in its rst format, and thus it seems
quite all right to reference it.  If the situation change in the future,
we can have another patch in the future.

julia
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
