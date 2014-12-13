From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 13 Dec 2014 11:38:52 +0000
Subject: Re: [patch 1/2] ALSA: oxfw: some signedness bugs
Message-Id: <20141213113852.GB4911@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141212192703.GA22234@mwanda>
 <548BC973.3090004@sakamocchi.jp>
 <20141213070414.GA4973@mwanda>
 <548C1196.4010503@sakamocchi.jp>
In-Reply-To: <548C1196.4010503@sakamocchi.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org, Clemens Ladisch <clemens@ladisch.de>

Think about a for loop:

	for (i = 0; i < xxx; i++) {

If "i" is really so high that it goes negative you have a very serious
issue whether it's signed or unsigned.  If it's signed then the loop is
a no-op but if it's unsigned then it corrupts memory.

That's not a win.

regards,
dan carpenter

