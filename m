From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 28 Jun 2019 10:04:18 +0000
Subject: Re: [PATCH] ALSA: seq: fix incorrect order of dest_client/dest_ports arguments
Message-Id: <s5h8stm6n6l.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190628095429.13369-1-colin.king@canonical.com>
In-Reply-To: <20190628095429.13369-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 28 Jun 2019 11:54:29 +0200,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are two occurrances of a call to snd_seq_oss_fill_addr where
> the dest_client and dest_port arguments are in the wrong order. Fix
> this by swapping them around.
> 
> Addresses-Coverity: ("Arguments in wrong order")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.


Takashi
