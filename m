From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 22 Nov 2019 13:26:53 +0000
Subject: Re: [PATCH] ALSA: cs4236: fix error return comparison of an unsigned integer
Message-Id: <s5hpnhk3uua.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191122131354.58042-1-colin.king@canonical.com>
In-Reply-To: <20191122131354.58042-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

On Fri, 22 Nov 2019 14:13:54 +0100,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> The return from pnp_irq is an unsigned integer type resource_size_t
> and hence the error check for a positive non-error code is always
> going to be true.  A check for a non-failure return from pnp_irq
> should in fact be for (resource_size_t)-1 rather than >= 0.
> 
> Addresses-Coverity: ("Unsigned compared against 0")
> Fixes: a9824c868a2c ("[ALSA] Add CS4232 PnP BIOS support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.


Takashi
