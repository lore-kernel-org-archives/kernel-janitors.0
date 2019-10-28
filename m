From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 28 Oct 2019 08:19:23 +0000
Subject: Re: ALSA: pci: Fix memory leak in snd_korg1212_create
Message-Id: <49777a3b-1fbf-06e4-b4b0-856105c86852@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191027191206.30820-1-navid.emamdoost@gmail.com>
 <47c90b48-8706-7860-3b87-30a7bbb726c0@web.de>
In-Reply-To: <47c90b48-8706-7860-3b87-30a7bbb726c0@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kangjie Lu <kjlu@umn.edu>, Takashi Iwai <tiwai@suse.com>, Richard Fontana <rfontana@redhat.com>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>

> I suggest to add a jump target according to the Linux coding style
> so that duplicate exception handling code can be reduced.

Do you find any information interesting from the update suggestion
“ALSA: korg1212: Use common error handling code in two functions”?
https://lore.kernel.org/alsa-devel/2165666c-69f9-c716-8ee8-f5071a41f37d@users.sourceforge.net/
https://lore.kernel.org/patchwork/patch/851723/
https://lkml.org/lkml/2017/11/16/193

Regards,
Markus
