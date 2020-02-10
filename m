From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 10 Feb 2020 07:30:50 +0000
Subject: Re: [PATCH] ALSA: hda: remove redundant assignment to variable timeout
Message-Id: <s5hwo8u526t.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200208222756.37707-1-colin.king@canonical.com>
In-Reply-To: <20200208222756.37707-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, Baolin Wang <baolin.wang@linaro.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

On Sat, 08 Feb 2020 23:27:56 +0100,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable timeout is being assigned with the value 200 that is never
> read, it is assigned a new value in a following do-loop. The assignment
> is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, applied.


Takashi
