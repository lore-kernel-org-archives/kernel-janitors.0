From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 07 Sep 2017 08:35:30 +0000
Subject: Re: [PATCH 2/3] ALSA: ymfpci: Use common error handling code in snd_ymfpci_create()
Message-Id: <s5h60cukist.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dafe6d86-1bfd-41a8-e189-bde7ae30dea9@users.sourceforge.net>
 <f2b7317e-b45d-a817-a307-d0208af65f56@users.sourceforge.net>
In-Reply-To: <f2b7317e-b45d-a817-a307-d0208af65f56@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, Ingo Molnar <mingo@kernel.org>, Bhumika Goyal <bhumirks@gmail.com>

On Wed, 06 Sep 2017 21:48:11 +0200,
SF Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 6 Sep 2017 21:12:51 +0200
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

Applied, thanks.


Takashi
