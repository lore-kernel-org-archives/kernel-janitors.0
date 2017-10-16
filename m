From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 16 Oct 2017 11:38:20 +0000
Subject: Re: [PATCH] ALSA: emux: remove unused redundant variable p2
Message-Id: <s5hmv4r1fwz.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171016111839.11365-1-colin.king@canonical.com>
In-Reply-To: <20171016111839.11365-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 16 Oct 2017 13:18:39 +0200,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable p2 is being assigned but never used, it is redundant
> and can be safely removed.  Cleans up clang warning: Value stored to
> 'p2' is never read.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.


Takashi
