From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 28 Oct 2019 14:40:09 +0000
Subject: Re: [alsa-devel] ALSA: korg1212: Checking exception handling in snd_korg1212_create()
Message-Id: <0daa3e27-3d1f-3040-f8e7-92ce91a97687@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <s5hmudlmldk.wl-tiwai@suse.de>
 <ec3647df-0e54-4aaa-7ec7-b3dec0fa1965@web.de> <s5ho8y1au4h.wl-tiwai@suse.de>
In-Reply-To: <s5ho8y1au4h.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Takashi Iwai <tiwai@suse.de>, Navid Emamdoost <emamd001@umn.edu>, alsa-devel@alsa-project.org, linux-doc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kangjie Lu <kjlu@umn.edu>, LKML <linux-kernel@vger.kernel.org>, Richard Fontana <rfontana@redhat.com>, Stephen McCamant <smccaman@umn.edu>, Thomas Gleixner <tglx@linutronix.de>, Navid Emamdoost <navid.emamdoost@gmail.com>

>> Can the properties of this programming interface be documented also together
>> with the function declaration for the safer handling of ALSA components?
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/sound/kernel-api/writing-an-alsa-driver.rst?id=d6d5df1db6e9d7f8f76d2911707f7d5877251b02#n567
>
> I can think of only adding some comment at each point mentioning that
> the resource will be managed by the device destructor.

* Which places will be corresponding update candidates?

* Would you like to choose the wording?


>> Can any more API information help to improve automatic source code analysis
>> around similar functions?
>
> If anything we can add, let me know.

Will any tags become more helpful also for the software documentation?

Regards,
Markus
