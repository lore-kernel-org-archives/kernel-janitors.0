From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 10 Feb 2020 07:31:04 +0000
Subject: Re: [PATCH] ALSA: ali5451: remove redundant variable capture_flag
Message-Id: <s5hv9oe526f.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200208223443.38047-1-colin.king@canonical.com>
In-Reply-To: <20200208223443.38047-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

On Sat, 08 Feb 2020 23:34:43 +0100,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable capture_flag is only ever assigned values, it is never read
> and hence it is redundant. Remove it.
> 
> Addresses-Coverity ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, applied.


Takashi
