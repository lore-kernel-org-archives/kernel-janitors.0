From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 16 Oct 2017 11:37:21 +0000
Subject: Re: [PATCH] ALSA: ens137x: remove redundant variable result
Message-Id: <s5ho9p71fym.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171015211645.15826-1-colin.king@canonical.com>
In-Reply-To: <20171015211645.15826-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>

On Sun, 15 Oct 2017 23:16:45 +0200,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable result is being assigned a value from a calculation
> however the variable is never read, so this redundant variable
> can be removed.
> 
> Cleans up clang warning: Value stored to 'result' is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.


Takashi
