From: Andreas Mohr <andi@lisas.de>
Date: Wed, 10 Aug 2011 11:15:42 +0000
Subject: Re: [PATCH] sound/pci/azt3328.c: adjust error handling code to
Message-Id: <20110810111542.GA5881@rhlx01.hs-esslingen.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312969744-29659-1-git-send-email-julia@diku.dk>
	<s5hk4albni7.wl%tiwai@suse.de>
In-Reply-To: <s5hk4albni7.wl%tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Lucas De Marchi <lucas.demarchi@profusion.mobi>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Mohr <andi@lisas.de>, Julia Lawall <julia@diku.dk>

Hi,

On Wed, Aug 10, 2011 at 11:54:08AM +0200, Takashi Iwai wrote:
> At Wed, 10 Aug 2011 11:49:04 +0200,
> Julia Lawall wrote:
> > 
> > From: Julia Lawall <julia@diku.dk>
> > 
> > snd_azf3328_dbgcallenter is called at the very beginning of the function,
> > so it could be useful to call snd_azf3328_dbgcallleave at all exit points.
> > 
> > Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> Applied now to sound git tree.  Thanks.

5 minutes, 4 seconds. Your responsiveness appears to be degrading. I've
seen better ;)

JFTR:
Acked-by: Andreas Mohr <andi@lisas.de>

Andreas Mohr
