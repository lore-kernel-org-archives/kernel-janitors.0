From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 16 Jul 2018 12:31:13 +0000
Subject: Re: [PATCH] ALSA: opl3: remove redundant pointer opl3
Message-Id: <s5hr2k35pm6.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180716083451.15290-1-colin.king@canonical.com>
In-Reply-To: <20180716083451.15290-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 16 Jul 2018 10:34:51 +0200,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable opl3 is being assigned but is never used hence it is
> redundant and can be removed.
> 
> Cleans up several clang warnings:
> warning: variable 'opl3' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.


Takashi
