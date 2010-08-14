From: Liam Girdwood <lrg@slimlogic.co.uk>
Date: Sat, 14 Aug 2010 11:15:57 +0000
Subject: Re: [patch] regulator/ab8500: move dereference below the check for
Message-Id: <1281784557.3394.150.camel@odin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100814090316.GX645@bicker>
	 (sfid-20100814_100351_685395_0B6B8F07)  <64F33A1C-EB54-4DFF-85C7-6796CFF475BA@opensource.wolfsonmicro.com>
In-Reply-To: <64F33A1C-EB54-4DFF-85C7-6796CFF475BA@opensource.wolfsonmicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Dan Carpenter <error27@gmail.com>, Bengt JONSSON <bengt.g.jonsson@stericsson.com>, Sundar R Iyer <sundar.iyer@stericsson.com>, Linus Walleij <linus.walleij@stericsson.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 2010-08-14 at 10:36 +0100, Mark Brown wrote:
> On 14 Aug 2010, at 10:03, Dan Carpenter wrote:
> 
> > I moved the dereference of "ab8500" below the check for NULL.
> > 
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

Applied.

Thanks

Liam
-- 
Freelance Developer, SlimLogic Ltd
ASoC and Voltage Regulator Maintainer.
http://www.slimlogic.co.uk

