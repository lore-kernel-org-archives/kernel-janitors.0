From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 10 Aug 2017 15:55:37 +0000
Subject: Re: [PATCH 0/4] ALSA: emux: Adjustments for four function implementations
Message-Id: <s5h8tirfmdi.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <412aa3a5-c8b6-c1fe-febb-0d62927dacc2@users.sourceforge.net>
In-Reply-To: <412aa3a5-c8b6-c1fe-febb-0d62927dacc2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, Kees Cook <keescook@chromium.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>

On Wed, 09 Aug 2017 10:00:23 +0200,
SF Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 9 Aug 2017 09:50:05 +0200
> 
> A few update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (4):
>   Adjust one function call together with a variable assignment
>   Improve a size determination in two functions
>   Adjust four checks for null pointers
>   Delete two error messages for a failed memory allocation in snd_emux_create_port()

Applied all four patches now.  Thanks.


Takashi
