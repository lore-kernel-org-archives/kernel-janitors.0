From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 17 Oct 2017 12:16:20 +0000
Subject: Re: [PATCH] ALSA: au88x0: remove redundant assignment of variable i
Message-Id: <s5hr2u2vujv.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171017115321.19713-1-colin.king@canonical.com>
In-Reply-To: <20171017115321.19713-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>, Jaroslav Kysela <perex@perex.cz>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 17 Oct 2017 13:53:21 +0200,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> The assignment to variable i is redundant as it is never read
> because it is updated a little later on. Remove this assignment.
> Cleans up clang warning: Value stored to 'i' is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.


Takashi
