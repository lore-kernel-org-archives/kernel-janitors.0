From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 28 Oct 2019 13:15:42 +0000
Subject: Re: [alsa-devel] ALSA: korg1212: Checking exception handling in snd_korg1212_create()
Message-Id: <s5ho8y1au4h.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <s5hmudlmldk.wl-tiwai@suse.de>
 <ec3647df-0e54-4aaa-7ec7-b3dec0fa1965@web.de>
In-Reply-To: <ec3647df-0e54-4aaa-7ec7-b3dec0fa1965@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Markus Elfring <Markus.Elfring@web.de>
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kangjie Lu <kjlu@umn.edu>, LKML <linux-kernel@vger.kernel.org>, Richard Fontana <rfontana@redhat.com>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Thomas Gleixner <tglx@linutronix.de>, Navid Emamdoost <navid.emamdoost@gmail.com>

On Mon, 28 Oct 2019 10:00:21 +0100,
Markus Elfring wrote:
>=20
> > The code path is after snd_device_new() which has its own destructor ca=
llback.
>=20
> Thanks for your reminder.
>=20
> Can the properties of this programming interface be documented also toget=
her
> with the function declaration for the safer handling of ALSA components?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/sound/kernel-api/writing-an-alsa-driver.rst?id=D6d5df1db6e9d7f=
8f76d2911707f7d5877251b02#n567

I can think of only adding some comment at each point mentioning that
the resource will be managed by the device destructor.

> Can any more API information help to improve automatic source code analys=
is
> around similar functions?

If anything we can add, let me know.


Takashi
