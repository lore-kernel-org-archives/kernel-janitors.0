From: Takashi Iwai <tiwai@suse.de>
Date: Sat, 12 Aug 2017 21:20:39 +0000
Subject: Re: [PATCH] ALSA: usx2y: Delete an error message for a failed memory allocation in two functions
Message-Id: <s5hmv74wkig.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5ca1485e-5aaf-3c42-a24e-fb834239182e@users.sourceforge.net>
In-Reply-To: <5ca1485e-5aaf-3c42-a24e-fb834239182e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 11 Aug 2017 18:02:15 +0200,
SF Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 11 Aug 2017 17:40:57 +0200
> 
> Omit an extra message for a memory allocation failure in these functions.
> 
> This issue was detected by using the Coccinelle software.
> 
> Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied, thanks.


Takashi
