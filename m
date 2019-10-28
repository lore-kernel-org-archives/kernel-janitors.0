From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 28 Oct 2019 09:00:21 +0000
Subject: Re: [alsa-devel] ALSA: korg1212: Checking exception handling in snd_korg1212_create()
Message-Id: <ec3647df-0e54-4aaa-7ec7-b3dec0fa1965@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <s5hmudlmldk.wl-tiwai@suse.de>
In-Reply-To: <s5hmudlmldk.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Takashi Iwai <tiwai@suse.de>, Navid Emamdoost <emamd001@umn.edu>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kangjie Lu <kjlu@umn.edu>, LKML <linux-kernel@vger.kernel.org>, Richard Fontana <rfontana@redhat.com>, Stephen McCamant <smccaman@umn.edu>, Thomas Gleixner <tglx@linutronix.de>, Navid Emamdoost <navid.emamdoost@gmail.com>

> The code path is after snd_device_new() which has its own destructor call=
back.

Thanks for your reminder.

Can the properties of this programming interface be documented also together
with the function declaration for the safer handling of ALSA components?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/sound/kernel-api/writing-an-alsa-driver.rst?id=D6d5df1db6e9d7f8f=
76d2911707f7d5877251b02#n567


Can any more API information help to improve automatic source code analysis
around similar functions?

Regards,
Markus
