From: maximilian attems <janitor@sternwelten.at>
Date: Sun, 11 Jul 2004 11:27:54 +0000
Subject: Re: [Kernel-janitors] min/max macros from kernel.h
Message-Id: <20040711112754.GD1828@sputnik.stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============72484497311513207=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040704114015.GA5381@moley.homelinux.net>
In-Reply-To: <20040704114015.GA5381@moley.homelinux.net>
To: kernel-janitors@vger.kernel.org

--===============72484497311513207==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, 11 Jul 2004, Michael Veeck wrote:

> 
> 
> Clemens Buchacher schrieb:
> >On Mon, Jul 05, 2004 at 03:57:02PM +0200, Michael Veeck wrote:
> >
> >>One advice: Before doing stuff on the todo list, ask on the mailing list 
> >>if anybodys working on it. This could save you some time.
> >
> >
> >I posted this patch to the kernel-janitors mailing list almost a week
> >ago. As there was no reaction to it I presumed nobody was working on the
> >MIN/MAX patches. Unfortunately, I received you patches only just today.
> >I will wait longer next time.
> 
> I received your mail very late, maybe my provider messed something up...
> 
> >Anyways, as you seem to have taken on this job, will you take in my
> >patch and submit it collectively with yours?
> >
> >I will then leave the rest of the MIN/MAX work to you, if that's ok.
> 
> Most of the macros are now removed, some arch-specific stuff is left to 
> do. They just need to be merged by the maintainers and/or 
> kernel-janitors-patchset.
> 
> Question to all: Should I resend the not yet merged patches to this list 
> or what should happen next?

i'll be sending a new kjt patchset today,
inside i merged all your latest min-max patches for drivers/char
(1 or 2 where outside), but yes please send to kj those not yet merged.
thanks maks


--===============72484497311513207==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============72484497311513207==--
