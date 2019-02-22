From: "Schulman, James" <James.Schulman@cirrus.com>
Date: Fri, 22 Feb 2019 21:50:26 +0000
Subject: Re: [alsa-devel] [PATCH] ASoC: cs35l36: Fix an IS_ERR() vs NULL checking bug
Message-Id: <alpine.DEB.2.10.1902221549310.5957@james-tower>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190222063151.GC30993@kadam>
 <20190222092248.GB130153@ediswmail.ad.cirrus.com>
In-Reply-To: <20190222092248.GB130153@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: "Austin, Brian" <Brian.Austin@cirrus.com>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>, "Handrigan, Paul" <Paul.Handrigan@cirrus.com>, "Schulman, James" <James.Schulman@cirrus.com>, Mark Brown <broonie@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>



On Fri, 22 Feb 2019, Charles Keepax wrote:

> On Fri, Feb 22, 2019 at 09:31:51AM +0300, Dan Carpenter wrote:
>> The irq_get_irq_data() function doesn't return error pointers, it
>> returns NULL.
>>
>> Fixes: 6ba9dd6c893b ("ASoC: cs35l36: Add support for Cirrus CS35L36 Amplifier")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> ---
>
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
>
> Thanks,
> Charles
>

Thanks Dan.

Reviewed-by: James Schulman <james.schulman@cirrus.com>

- James
