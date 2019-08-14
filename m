From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 14 Aug 2019 15:44:39 +0000
Subject: Re: [PATCH] ALSA: sb: remove redundant assignment to variable result
Message-Id: <s5h1rxnda54.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190813140151.9865-1-colin.king@canonical.com>
In-Reply-To: <20190813140151.9865-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 13 Aug 2019 16:01:51 +0200,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable result is initialized to a value that is never read and it is
> re-assigned later. The initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, applied.


Takashi
