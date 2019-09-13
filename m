From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 13 Sep 2019 07:57:09 +0000
Subject: Re: [PATCH] media: v4l: cadence: Fix how unsued lanes are handled in 'csi2rx_start()'
Message-Id: <20190913075709.t35ggip624tybd6l@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190912204450.17625-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190912204450.17625-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Christophe,

On Thu, Sep 12, 2019 at 10:44:50PM +0200, Christophe JAILLET wrote:
> The 2nd parameter of 'find_first_zero_bit()' is a number of bits, not of
> bytes. So use 'BITS_PER_LONG' instead of 'sizeof(lanes_used)'.
> 
> Fixes: 1fc3b37f34f6 ("media: v4l: cadence: Add Cadence MIPI-CSI2 RX driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This patch is purely speculative. Using BITS_PER_LONG looks logical to me,
> but I'm not 100% sure that it is what is expected here. 'csi2rx->max_lanes'
> could also be a good candidate.

Yeah, csi2rx->max_lanes would make more sense in that context. Could
you resend a new version?

Thanks!
Maxime
