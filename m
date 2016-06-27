From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 27 Jun 2016 20:28:23 +0000
Subject: Re: [PATCH] ALSA: echoaudio: Fix memory allocation
Message-Id: <s5h1t3iwf4o.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1467054411-19752-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1467054411-19752-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: perex@perex.cz, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 27 Jun 2016 21:06:51 +0200,
Christophe JAILLET wrote:
> 
> 'commpage_bak' is allocated with 'sizeof(struct echoaudio)' bytes.
> We then copy 'sizeof(struct comm_page)' bytes in it.
> On my system, smatch complains because one is 2960 and the other is 3072.
> 
> This would result in memory corruption or a oops.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thanks.


Takashi
