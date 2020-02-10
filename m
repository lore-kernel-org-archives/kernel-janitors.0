From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 10 Feb 2020 07:31:18 +0000
Subject: Re: [PATCH] ALSA: info: remove redundant assignment to variable c
Message-Id: <s5htv3y5261.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200208224206.38540-1-colin.king@canonical.com>
In-Reply-To: <20200208224206.38540-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

On Sat, 08 Feb 2020 23:42:06 +0100,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable c is being assigned with the value -1 that is never read,
> it is assigned a new value in a following while-loop. The assignment
> is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, applied.


Takashi
