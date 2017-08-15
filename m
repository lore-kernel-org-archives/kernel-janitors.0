From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 15 Aug 2017 08:55:30 +0000
Subject: Re: [PATCH 3/3] ALSA: firewire-motu: constify snd_rawmidi_ops structures
Message-Id: <s5ho9rhi519.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1502784594-14670-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1502784594-14670-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Clemens Ladisch <clemens@ladisch.de>, alsa-devel@alsa-project.org, bhumirks@gmail.com, Jaroslav Kysela <perex@perex.cz>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 15 Aug 2017 10:09:54 +0200,
Julia Lawall wrote:
> 
> These snd_rawmidi_ops structures are only passed as the third
> argument of snd_rawmidi_set_ops.  This argument is const, so the
> snd_rawmidi_ops structures can be const too.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

What are other two patches?  Since I haven't received a cover letter,
no idea whether I overlooked them or not relevant with my tree...


thanks,

Takashi
