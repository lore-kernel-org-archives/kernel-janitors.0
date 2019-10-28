From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 28 Oct 2019 14:44:19 +0000
Subject: Re: [alsa-devel] ALSA: korg1212: Checking exception handling in snd_korg1212_create()
Message-Id: <s5hv9s99bgc.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <s5hmudlmldk.wl-tiwai@suse.de>
 <ec3647df-0e54-4aaa-7ec7-b3dec0fa1965@web.de>
 <s5ho8y1au4h.wl-tiwai@suse.de>
 <0daa3e27-3d1f-3040-f8e7-92ce91a97687@web.de>
In-Reply-To: <0daa3e27-3d1f-3040-f8e7-92ce91a97687@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Markus Elfring <Markus.Elfring@web.de>
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kangjie Lu <kjlu@umn.edu>, LKML <linux-kernel@vger.kernel.org>, Richard Fontana <rfontana@redhat.com>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Thomas Gleixner <tglx@linutronix.de>, Navid Emamdoost <navid.emamdoost@gmail.com>

On Mon, 28 Oct 2019 15:40:09 +0100,
Markus Elfring wrote:
>=20
> >> Can the properties of this programming interface be documented also to=
gether
> >> with the function declaration for the safer handling of ALSA component=
s?
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/sound/kernel-api/writing-an-alsa-driver.rst?id=D6d5df1db6e9=
d7f8f76d2911707f7d5877251b02#n567
> >
> > I can think of only adding some comment at each point mentioning that
> > the resource will be managed by the device destructor.
>=20
> * Which places will be corresponding update candidates?

At each place where this kind of code is seen.

> * Would you like to choose the wording?

I myself don't mind as long as it's clearly understandable for human
being.

> >> Can any more API information help to improve automatic source code ana=
lysis
> >> around similar functions?
> >
> > If anything we can add, let me know.
>=20
> Will any tags become more helpful also for the software documentation?

It's my question.


thanks,

Takashi
