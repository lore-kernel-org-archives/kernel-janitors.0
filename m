From: Rajeev kumar <rajeev-dlh.kumar@st.com>
Date: Fri, 25 Jan 2013 08:45:46 +0000
Subject: Re: [patch] ASoC: dwc: fix support for more than two channels
Message-Id: <5102436A.4030205@st.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130125064343.GE4882@elgon.mountain>
In-Reply-To: <20130125064343.GE4882@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>

On 1/25/2013 12:13 PM, Dan Carpenter wrote:
> here were missing break statements so everything used
> TWO_CHANNEL_SUPPORT.
>
> Also I added a return statement to silence a GCC warning:
>
> 	sound/soc/dwc/designware_i2s.c: In function ‘dw_i2s_hw_params’:
> 	sound/soc/dwc/designware_i2s.c:236:32: warning: ‘ch_reg’ may be
> 		used uninitialized in this function
> 		[-Wmaybe-uninitialized]
>
> Signed-off-by: Dan Carpenter<dan.carpenter@oracle.com>
> ---
> Static analysis.  Untested.

Acked By: Rajeev Kumar <rajeev-dlh.kumar@st.com>
