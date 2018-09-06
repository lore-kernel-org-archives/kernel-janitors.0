From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 06 Sep 2018 11:58:14 +0000
Subject: Re: [PATCH] ASoC: sgtl5000: avoid division by zero if lo_vag is zero
Message-Id: <20180906115814.a5woyhfc5sczxksa@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180906104152.17977-1-colin.king@canonical.com>
In-Reply-To: <20180906104152.17977-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>

On Thu, Sep 06, 2018 at 11:41:52AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> In the case where lo_vag <= SGTL5000_LINE_OUT_GND_BASE, lo_vag
> is set to zero and later vol_quot is computed by dividing by
> lo_vag causing a division by zero error.  Fix this by avoiding
> a zero division and set vol_quot to zero in this specific case
> so that the lowest setting for i is correctly set.
> 

This is a very clever patch.  How did you find the bug?

regards,
dan carpenter
