From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 16 Jul 2018 12:31:49 +0000
Subject: Re: [PATCH] ALSA: ali5451: remove redundant pointer 'codec'
Message-Id: <s5hlgab5pl6.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180716085738.16041-1-colin.king@canonical.com>
In-Reply-To: <20180716085738.16041-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 16 Jul 2018 10:57:38 +0200,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer 'codec' is being assigned but is never used hence it is
> redundant and can be removed.
> 
> Cleans up clang warning:
> warning: variable 'codec' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.


Takashi
