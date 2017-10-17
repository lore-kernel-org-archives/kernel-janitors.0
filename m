From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 17 Oct 2017 17:16:27 +0000
Subject: Re: [PATCH] ALSA: emu10k1: remove redundant assignment to tmp
Message-Id: <s5htvyxy9sk.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171017121836.20436-1-colin.king@canonical.com>
In-Reply-To: <20171017121836.20436-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 17 Oct 2017 14:18:36 +0200,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> The assignment to variable tmp is redundant as the value is never
> read and a new value is assigned to tmp in the following for-loop,
> so remove the assignment.
> Cleans up clang warning: Value stored to 'tmp' is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.


Takashi
