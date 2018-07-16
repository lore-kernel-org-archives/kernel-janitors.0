From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 16 Jul 2018 12:31:22 +0000
Subject: Re: [PATCH] ALSA: es1688: remove redundant pointer chip
Message-Id: <s5hpnzn5plx.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180716084308.15571-1-colin.king@canonical.com>
In-Reply-To: <20180716084308.15571-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, Arvind Yadav <arvind.yadav.cs@gmail.com>, Jaroslav Kysela <perex@perex.cz>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 16 Jul 2018 10:43:08 +0200,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer chip is being assigned but is never used hence it is
> redundant and can be removed.
> 
> Cleans up clang warning:
> warning: variable 'chip' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.


Takashi
