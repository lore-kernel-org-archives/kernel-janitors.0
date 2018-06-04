From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 04 Jun 2018 11:53:18 +0000
Subject: Re: [alsa-devel] [PATCH] ALSA: usb-audio: remove redundant check on err
Message-Id: <s5hin6ylqdt.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180604114919.2199-1-colin.king@canonical.com>
In-Reply-To: <20180604114919.2199-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 04 Jun 2018 13:49:19 +0200,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> The check on err is redundant as both the true and false paths
> end up on a break statement. Remove the redundant check.
> 
> Detected by CoverityScan, CID#1268773 ("Identical code for different
> branches")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.


Takashi
