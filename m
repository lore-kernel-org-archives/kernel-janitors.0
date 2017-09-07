From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 07 Sep 2017 08:28:04 +0000
Subject: Re: [PATCH 1/2] ALSA: us122l: Use common error handling code in us122l_create_card()
Message-Id: <s5hd172kj57.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6743b977-4293-42d2-6c1b-cb83b687bd66@users.sourceforge.net>
 <cc84d72e-1474-2eb9-30cf-28034155bcc3@users.sourceforge.net>
In-Reply-To: <cc84d72e-1474-2eb9-30cf-28034155bcc3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, Dave Jiang <dave.jiang@intel.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Johan Hovold <johan@kernel.org>, Arvind Yadav <arvind.yadav.cs@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>

On Wed, 06 Sep 2017 15:16:29 +0200,
SF Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 6 Sep 2017 14:45:09 +0200
> 
> Add a jump target so that a bit of exception handling can be better reused
> at the end of this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied, thanks.


Takashi
