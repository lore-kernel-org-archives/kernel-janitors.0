From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 07 Sep 2017 08:35:21 +0000
Subject: Re: [PATCH 1/3] ALSA: ymfpci: Use common error handling code in snd_card_ymfpci_probe()
Message-Id: <s5h7exakit2.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dafe6d86-1bfd-41a8-e189-bde7ae30dea9@users.sourceforge.net>
        <c3b3d66c-1fb1-8bb9-cf00-674fd4e20afb@users.sourceforge.net>
In-Reply-To: <c3b3d66c-1fb1-8bb9-cf00-674fd4e20afb@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, Bhumika Goyal <bhumirks@gmail.com>, Ingo Molnar <mingo@kernel.org>, Jaroslav Kysela <perex@perex.cz>, David Howells <dhowells@redhat.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, 06 Sep 2017 21:46:52 +0200,
SF Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 6 Sep 2017 20:45:11 +0200
> 
> * Add a jump target so that a bit of exception handling can be better
>   reused at the end of this function.
> 
>   This issue was detected by using the Coccinelle software.
> 
> * The script "checkpatch.pl" pointed information out like the following.
> 
>   ERROR: do not use assignment in if condition
> 
>   Thus fix a few source code places.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied now.  Thanks.


Takashi
