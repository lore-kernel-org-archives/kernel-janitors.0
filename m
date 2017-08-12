From: Takashi Iwai <tiwai@suse.de>
Date: Sat, 12 Aug 2017 21:21:26 +0000
Subject: Re: [PATCH] ALSA: usb: Delete an error message for a failed memory allocation in two functions
Message-Id: <s5hlgmowkh5.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cb279f5a-1994-ae47-7e8f-8aae793d16d2@users.sourceforge.net>
In-Reply-To: <cb279f5a-1994-ae47-7e8f-8aae793d16d2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Nobutaka Okabe <nob77413@gmail.com>, Johan Hovold <johan@kernel.org>, Dennis Kadioglu <denk@post.com>, Daniel Mack <daniel@zonque.org>, Akshay Bhat <akshay.bhat@timesys.com>

On Fri, 11 Aug 2017 19:04:41 +0200,
SF Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 11 Aug 2017 18:38:25 +0200
> 
> Omit an extra message for a memory allocation failure in these functions.
> 
> This issue was detected by using the Coccinelle software.
> 
> Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied, thanks.


Takashi
