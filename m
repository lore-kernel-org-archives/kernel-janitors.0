From: aLeJ <fuzzy.alej@gmail.com>
Date: Thu, 30 Jun 2005 20:03:13 +0000
Subject: Re: [KJ] fs/smbfs/proc.c -> replace direct assignment with
Message-Id: <1120168513.16719.1.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1120126573.24539.6.camel@localhost>
In-Reply-To: <1120126573.24539.6.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

El jue, 30-06-2005 a las 11:39 -0700, Nishanth Aravamudan escribi=F3:
> On 30.06.2005 [21:48:56 +0200], aLeJ wrote:
> > > the memory barrier is really necessary (as pointed out earlier in the=
 list
> > > by Nishanth Aravamudan)?  if not, __set_current_state does the job.
> > >=20
> > > I'd appreciate some notes/thoughts/tips/whatever on which conditions a
> > > memory barrier is really needed, or, more clearly, when the absence o=
f a
> > > memory barrier breaks stuff.
> > >=20
> > > TIA :)
> >=20
> > As said in the TODO:
> >=20
> > "...
> > Don't forget to set_current_state(TASK_{,UN}INTERRUPTIBLE); before
> > schedule*().
> > ..."
> >=20
> > And in this case, it is just before schedule, so I considered to change=
 it.
> > Maybe the use of __set_current is for places where there is not schedul=
e?
> > (Just a try :p)
>=20
> So, when you are adding yourself to a wait-queue, you have to be set in
> the appropriate state to make sure you receive the appropriate wake-up
> events.
>=20
> When removing yourself, though, it is less critical, so you are able to
> use __set_current_state() [which is the same as direct assignment].
>=20
> I had a mail from Oliver Neukum which discussed these issues, but am
> having some trouble locating it. Once I do, I'll send it back out in
> reply to this thread.
>=20
> In any case, this patch is not necessary, as I already have a patch in
> the -KJ tree which replaces the state change and timeout with msleep().
> Please make sure your fixes don't collide with existing -kj fixes (or
> -mm ones, if possible).
>=20
> Thanks,
> Nish

Ok, I'll be waiting the replay to see the mail! :D
And thanks, I'm very newbie and I love learning so all help given to me
is very appreciated.
Thank you,=20
	aLeJ. ;)

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
