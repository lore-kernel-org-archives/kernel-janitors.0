From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 01 Jan 2020 11:38:52 +0000
Subject: Re: [PATCH 01/16] ALSA: ad1816a: constify copied structure
Message-Id: <s5hv9pv2ypf.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
 <1577864614-5543-2-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577864614-5543-2-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

On Wed, 01 Jan 2020 08:43:19 +0100,
Julia Lawall wrote:
> 
> The snd_ad1816a_timer_table structure is only copied into
> another structure, so make it const.
> 
> The opportunity for this change was found using Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Applied, thanks.


Takashi
