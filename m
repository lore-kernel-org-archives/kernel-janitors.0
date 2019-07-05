From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 05 Jul 2019 10:12:50 +0000
Subject: Re: [PATCH] ALSA: cs4281: remove redundant assignment to variable val and remove a goto
Message-Id: <s5hh880zt5p.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190705095704.26050-1-colin.king@canonical.com>
In-Reply-To: <20190705095704.26050-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 05 Jul 2019 11:57:04 +0200,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable val is being assigned with a value that is never
> read and it is being updated later with a new value. The
> assignment is redundant and can be removed.  Also remove a
> goto statement and a label and replace with a break statement.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.


Takashi
