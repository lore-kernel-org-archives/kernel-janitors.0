From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 28 Nov 2017 13:10:53 +0000
Subject: Re: [alsa-devel] ALSA: nm256: Fine-tuning for three function implementations
Message-Id: <d5573b12-7e52-7f62-11b4-07558152eed2@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d98a2685-ddf9-1cba-839a-d12c5ff8d3ba@users.sourceforge.net>
 <s5hbmjmluba.wl-tiwai@suse.de>
 <2cbef557-5f89-c630-e108-14ef2ce6b41a@users.sourceforge.net>
 <201711281333.15131.linux@rainbow-software.org>
In-Reply-To: <201711281333.15131.linux@rainbow-software.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Ondrej Zary <linux@rainbow-software.org>, alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>, Arvind Yadav <arvind.yadav.cs@gmail.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>

>> Can you get the impression that the shown transformation patterns were
>> correctly applied for the source file “sound/pci/nm256/nm256.c”?
> 
> Have you tested the driver?

Which results do you expect from a corresponding system test?


> Please don't "improve" working drivers unless

I am trying to improve software components also for devices to which
I have not got direct access so far.


> Patches like this are known to cause regressions.

Do you prefer to keep this software area “frozen” anyhow?


> If the hardware is rare (like the NM256), the regression can hit years later
> when someone with such HW upgrades distro (e.g. Debian stable).

Have you got any resources to reduce corresponding concerns?

Regards,
Markus
