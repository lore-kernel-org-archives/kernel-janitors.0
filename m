From: Steven Eckhoff <steven.eckhoff.opensource@gmail.com>
Date: Fri, 09 Mar 2018 01:03:09 +0000
Subject: Re: [PATCH] ASoC: TSCS42xx: make const array norm_addrs static, reduces object code size
Message-Id: <20180309010308.GA19046@t7-ThinkPad-E560>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180214172153.5749-1-colin.king@canonical.com>
In-Reply-To: <20180214172153.5749-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Feb 14, 2018 at 05:21:53PM +0000, Colin King wrote:

> Don't populate the const array norm_addrs on the stack, instead make it
> static.  Makes the object code smaller by over 230 bytes.  Also re-format
> array data as the insertion of the static keywork made the first line
> overly long.

I have tested this on our HAT and it works well. You can add:

Reviewed-by: Steven Eckhoff <steven.eckhoff.opensource@gmail.com>
Tested-by: Steven Eckhoff <steven.eckhoff.opensource@gmail.com>

Regards,

Steven
