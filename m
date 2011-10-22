From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Sat, 22 Oct 2011 09:47:08 +0000
Subject: Re: [PATCH] sound/soc: keep pointer to resource so it can be freed
Message-Id: <20111022094708.GB3382@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1318950399-17201-1-git-send-email-julia@diku.dk>
In-Reply-To: <1318950399-17201-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lrg@ti.com>

On Tue, Oct 18, 2011 at 05:06:39PM +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Add a new variable for storing resources accessed subsequent to the one
> accessed using request_mem_region, so the one accessed using
> request_mem_region can be released if needed.

Applied, thanks.

Please try to match your subject lines with those normally used for the
subsystem.
