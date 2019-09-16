From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 16 Sep 2019 06:28:46 +0000
Subject: Re: [PATCH] media: v4l: cadence: Fix how unsued lanes are handled in 'csi2rx_start()'
Message-Id: <20190916062846.GD18977@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190912204450.17625-1-christophe.jaillet@wanadoo.fr>
 <20190913075709.t35ggip624tybd6l@localhost.localdomain>
In-Reply-To: <20190913075709.t35ggip624tybd6l@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxime Ripard <mripard@kernel.org>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Sep 13, 2019 at 09:57:09AM +0200, Maxime Ripard wrote:
> Hi Christophe,
> 
> On Thu, Sep 12, 2019 at 10:44:50PM +0200, Christophe JAILLET wrote:
> > The 2nd parameter of 'find_first_zero_bit()' is a number of bits, not of
> > bytes. So use 'BITS_PER_LONG' instead of 'sizeof(lanes_used)'.
> > 
> > Fixes: 1fc3b37f34f6 ("media: v4l: cadence: Add Cadence MIPI-CSI2 RX driver")
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> > This patch is purely speculative. Using BITS_PER_LONG looks logical to me,
> > but I'm not 100% sure that it is what is expected here. 'csi2rx->max_lanes'
> > could also be a good candidate.
> 
> Yeah, csi2rx->max_lanes would make more sense in that context. Could
> you resend a new version?

This is sort of unrelated, but for Smatch purposes the csi2rx->max_lanes
comes from the firmware in csi2rx_parse_dt() and it could be any u8
value.

I sort of wish that people would write code which was known to be
correct just from reading the kernel code, without looking at the
firmware...  I guess I could mark v4l2_fwnode_endpoint_parse() as always
giving us valid data, but that still wouldn't tell us what the valid
data is.  It's hard to know the right answer from a static analysis
point of view.

regards,
dan carpenter
