From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Sat, 14 Aug 2010 09:36:13 +0000
Subject: Re: [patch] regulator/ab8500: move dereference below the check for NULL
Message-Id: <64F33A1C-EB54-4DFF-85C7-6796CFF475BA@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100814090316.GX645@bicker> (sfid-20100814_100351_685395_0B6B8F07)
In-Reply-To: <20100814090316.GX645@bicker> (sfid-20100814_100351_685395_0B6B8F07)
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Liam Girdwood <lrg@slimlogic.co.uk>, Bengt JONSSON <bengt.g.jonsson@stericsson.com>, Sundar R Iyer <sundar.iyer@stericsson.com>, Linus Walleij <linus.walleij@stericsson.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 14 Aug 2010, at 10:03, Dan Carpenter wrote:

> I moved the dereference of "ab8500" below the check for NULL.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
