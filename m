From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 21 Jun 2018 19:43:46 +0000
Subject: Re: [PATCH] ALSA: hda/ca0132: make array ca0132_alt_chmaps static
Message-Id: <s5hbmc4c4ct.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180621183457.31008-1-colin.king@canonical.com>
In-Reply-To: <20180621183457.31008-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, Takashi Sakamoto <o-takashi@sakamocchi.jp>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 21 Jun 2018 20:34:57 +0200,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> The array ca0132_alt_chmaps is local to the source and does not
> need to be in global scope, so make it static.
> 
> Cleans up sparse warning:
> warning: symbol 'ca0132_alt_chmaps' was not declared. Should it be
> static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.


Takashi
