From: Bernd Petrovitsch <bernd@firmix.at>
Date: Tue, 13 Dec 2005 15:35:37 +0000
Subject: Re: [KJ] de-initialization of = 0 globals
Message-Id: <1134488137.30759.31.camel@tara.firmix.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============90660429970778367=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <63769.192.96.150.57.1134482519.squirrel@mail.interexcel.co.za>
In-Reply-To: <63769.192.96.150.57.1134482519.squirrel@mail.interexcel.co.za>
To: kernel-janitors@vger.kernel.org

--===============90660429970778367==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2005-12-13 at 17:16 +0200, Jaco Kroon wrote:
> Bernd Petrovitsch wrote:
> > On Tue, 2005-12-13 at 16:01 +0200, Jaco Kroon wrote:
> > [...]
> > 
> >>Also, if I'm going to be sending patches for these it's obviously a patch
> >>per affected file, so if I'm going to be sending let's say a hundred of
> >>these patches it's still a mail per patch or do I just archive them
> >>somehow and attach them or do I place them on a webserver and mail a uri
> >>to them?
> > 
> > 
> > Make one patch per subsystem (unless told otherwise from core LKML
> > personnel directly) since
> > -) these are trivial patches and
> > -) you actually want to mail them to the relevant
> >    maintainer/mailing-list and Cc: LKML/k-j only.
> > 
> > 	Bernd
> 
> Ah bugger. That makes it quite a bit more complex :(.  It's relatively

Yes. But otherwise it is IMHO more "complex" (or cumbersome) for the
readers (and their will be more than only 1) getting e.g. 100 mails with
trivial fixes for 100 files or flooding some linux-<subsystem>@ ML with
12 Emails fixin such trivial stuff in 12 different files.

> easy to single out all the cases (and fix them), but automating the
> grouping of files into subsystems and assigning maintainers to those
> subsystems isn't as trivial.

I thought about proposing a new field to maintainers where the relevant
subdirectories/files listed so that one knows whom to bug if I changed a
list of given files.
But this is quite a work, ongoing since this changes and I don't know
how people react.

The simpler start is probably to generate one large patch for the Kernel
and separate patches for larger subsystems (IDE, SCSI, etc.) out of it
since you can just work with an editor.
And near the end you can send the last ones in one patch and see what
happens (in the best of all worlds, the patch is accept for -mm which
usually creates directly enough pressure so that subsystem maintainers
take it from there).

Or you just send the one large patch and see what happens.

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services


--===============90660429970778367==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============90660429970778367==--
