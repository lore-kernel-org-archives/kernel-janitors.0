From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 07 Sep 2017 08:35:08 +0000
Subject: Re: [PATCH 3/3] ALSA: ymfpci: Adjust 17 checks for null pointers
Message-Id: <s5h8thqkitf.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dafe6d86-1bfd-41a8-e189-bde7ae30dea9@users.sourceforge.net>
        <35478693-5c8a-38b8-d2b3-fc8a964d5137@users.sourceforge.net>
In-Reply-To: <35478693-5c8a-38b8-d2b3-fc8a964d5137@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, Bhumika Goyal <bhumirks@gmail.com>, Ingo Molnar <mingo@kernel.org>, Jaroslav Kysela <perex@perex.cz>, David Howells <dhowells@redhat.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, 06 Sep 2017 21:50:09 +0200,
SF Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 6 Sep 2017 21:30:37 +0200
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> The script “checkpatch.pl” pointed information out like the following.
> 
> Comparison to NULL could be written …
> 
> Thus fix affected source code places.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

I don't find such a change is needed at all.
Skipped.


Takashi
