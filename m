From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 Apr 2020 11:45:22 +0000
Subject: Re: [PATCH] ASoC: SOF: ensure all fields in header are zero'd before copying back to userspace
Message-Id: <20200422114522.GK2659@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200422112417.208843-1-colin.king@canonical.com>
In-Reply-To: <20200422112417.208843-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, sound-open-firmware@alsa-project.org

On Wed, Apr 22, 2020 at 12:24:17PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Field header.tlv is uninitialized and being copied back to userspace
        ^^^^^^^^^^
header.tlv is a zero element array so it doens't have any stack data.

> and hence leaking data from the stack to userspace.  Fix this by
> ensuring the header structure is zero'd.

regards,
dan carpenter
