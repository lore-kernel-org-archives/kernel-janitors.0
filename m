From: Wim Van Sebroeck <wim@iguana.be>
Date: Mon, 31 May 2010 11:39:15 +0000
Subject: Re: [PATCH 2/11] drivers/watchdog: Eliminate a NULL pointer
Message-Id: <20100531113915.GS3972@infomag.iguana.be>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005271432100.5422@ask.diku.dk> <20100531112330.GI3489@rakim.wolfsonmicro.main>
In-Reply-To: <20100531112330.GI3489@rakim.wolfsonmicro.main>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@opensource.wolfsonmicro.com>, Julia Lawall <julia@diku.dk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi All,

> > From: Julia Lawall <julia@diku.dk>
> > 
> > At the point of the call to dev_err, wm8350 is NULL.
> 
> Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

Will add this one in linux-2.6-watchdog-next for testing and sent it to Linus after a couple of days.

Kind regards,
Wim.

