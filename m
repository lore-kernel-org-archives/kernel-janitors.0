From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 28 Jun 2019 08:37:56 +0000
Subject: Re: [PATCH] ALSA: usb-audio: fix sign unintended sign extension on left shifts
Message-Id: <s5hwoh66r6j.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190627164308.21286-1-colin.king@canonical.com>
In-Reply-To: <20190627164308.21286-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 27 Jun 2019 18:43:08 +0200,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are a couple of left shifts of unsigned 8 bit values that
> first get promoted to signed ints and hence get sign extended
> on the shift if the top bit of the 8 bit values are set. Fix
> this by casting the 8 bit values to unsigned ints to stop the
> unintentional sign extension.
> 
> Addresses-Coverity: ("Unintended sign extension")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied now.  Thanks.


Takashi
