From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 10 Feb 2020 07:30:38 +0000
Subject: Re: [PATCH] ALSA: hdsp: remove redundant assignment to variable err
Message-Id: <s5hy2ta5275.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200208222006.37376-1-colin.king@canonical.com>
In-Reply-To: <20200208222006.37376-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

On Sat, 08 Feb 2020 23:20:06 +0100,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable err is being assigned with a value that is never read, it is
> assigned a new value in the next statement. The assignment is redundant
> and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, applied.


Takashi
