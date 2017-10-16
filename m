From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 16 Oct 2017 12:48:35 +0000
Subject: Re: [PATCH] asihpi: clean up a couple of build warnings
Message-Id: <s5h376j1cnw.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171016121921.12722-1-colin.king@canonical.com>
In-Reply-To: <20171016121921.12722-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 16 Oct 2017 14:19:21 +0200,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable dpcm is never used and hence can be removed. Variable
> runtime is being assigned but is never read, so the assignment
> is redundant and can be removed. Cleans up two clang warnings:
> 
> Value stored to 'dpcm' is never read
> Value stored to 'runtime' is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied (with the subject fix) now, thanks.


Takashi
