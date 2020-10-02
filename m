From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 02 Oct 2020 09:26:38 +0000
Subject: Re: [PATCH] ALSA: usb-audio: fix spelling mistake "Frequence" -> "Frequency"
Message-Id: <s5h7ds9c71t.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181125231208.14350-1-colin.king@canonical.com>
 <s5hmupw6y6l.wl-tiwai@suse.de>
 <8ee34833-7867-f559-0656-b4f34ea6d006@perex.cz>
In-Reply-To: <8ee34833-7867-f559-0656-b4f34ea6d006@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: Colin King <colin.king@canonical.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 02 Oct 2020 11:18:46 +0200,
Jaroslav Kysela wrote:
> 
> Dne 26. 11. 18 v 9:27 Takashi Iwai napsal(a):
> > On Mon, 26 Nov 2018 00:12:08 +0100,
> > Colin King wrote:
> >>
> >> From: Colin Ian King <colin.king@canonical.com>
> >>
> >> There are spelling mistakes in equalizer name fields, fix them.
> >>
> >> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > 
> > In general, it's not good to rename the control names even if they are
> > fixes.  But these are rather device-specific ones, and they are EQ's,
> > which aren't too fatal to change, so I took it as-is now.
> 
> It seems that this patch has not found a way to kernel. It is present
> in #master at git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git,
> but it is not present in linux-next.

Indeed, it was applied to a wrong branch.  I cherry-picked now.
Thanks!


Takashi
