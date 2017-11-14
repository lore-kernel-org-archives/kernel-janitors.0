From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 14 Nov 2017 11:48:40 +0000
Subject: Re: [PATCH 0/7] ALSA: Fine-tuning for several function implementations
Message-Id: <882a7baa-7c23-c60c-076f-73daa1753531@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f2404d64-27c8-4afa-b893-fc72601c0136@users.sourceforge.net>
In-Reply-To: <f2404d64-27c8-4afa-b893-fc72601c0136@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>, Martin Koegler <martin.koegler@chello.at>, Takashi Iwai <tiwai@suse.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

> Date: Tue, 24 Jan 2017 11:02:34 +0100
> 
> Some update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (7):
>   seq: Delete unnecessary checks in snd_seq_ioctl_query_subs()
>   seq: Delete unnecessary checks in snd_seq_ioctl_get_subscription()
>   seq: Delete unnecessary checks in snd_seq_ioctl_unsubscribe_port()
>   seq: Delete unnecessary checks in snd_seq_ioctl_subscribe_port()
>   seq: Adjust 16 function calls together with a variable assignment
>   dmasound_core: Move two assignments for the variable "ret" in state_open()
>   dmasound_core: Adjust six function calls together with a variable assignment
> 
>  sound/core/seq/seq_clientmgr.c     | 163 ++++++++++++++++++++-----------------
>  sound/oss/dmasound/dmasound_core.c |  33 +++++---
>  2 files changed, 109 insertions(+), 87 deletions(-)

Are these update suggestions worth for another look?
https://lkml.org/lkml/2017/1/24/292

Regards,
Markus
