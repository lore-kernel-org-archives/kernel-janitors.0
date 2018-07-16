From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 16 Jul 2018 12:31:58 +0000
Subject: Re: [PATCH] ALSA: cs46xx: remove redundant pointer 'ins'
Message-Id: <s5hk1pv5pkx.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180716090315.16267-1-colin.king@canonical.com>
In-Reply-To: <20180716090315.16267-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 16 Jul 2018 11:03:15 +0200,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer 'ins' is being assigned but is never used hence it is
> redundant and can be removed.
> 
> Cleans up clang warning:
> warning: variable 'ins' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.


Takashi
