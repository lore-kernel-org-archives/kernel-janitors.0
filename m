From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 02 Aug 2019 05:48:47 +0000
Subject: Re: [PATCH] ALSA: isa/wavefront: remove redundant assignment to pointer bptr
Message-Id: <s5hv9vgrubk.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190801162824.32217-1-colin.king@canonical.com>
In-Reply-To: <20190801162824.32217-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 01 Aug 2019 18:28:24 +0200,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer bptr is being assigned a value that is never read
> and it is being updated in the next statement with a new value.
> The initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.


Takashi
