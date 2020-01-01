From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 01 Jan 2020 11:39:11 +0000
Subject: Re: [PATCH 02/16] ALSA: constify copied structure
Message-Id: <s5htv5f2yow.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
 <1577864614-5543-3-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577864614-5543-3-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

On Wed, 01 Jan 2020 08:43:20 +0100,
Julia Lawall wrote:
> 
> The azx_pcm_hw structure is only copied into another structure,
> so make it const.
> 
> The opportunity for this change was found using Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Applied now.  Thanks.


Takashi
