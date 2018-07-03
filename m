From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Jul 2018 12:27:45 +0000
Subject: Re: [PATCH] pinctrl: actions: signedness bug in owl_pinctrl_probe()
Message-Id: <20180703122745.4uvyf4kmqs4znl5o@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180703120255.rbkgt5lm53acnv6n@kili.mountain>
In-Reply-To: <20180703120255.rbkgt5lm53acnv6n@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


On Tue, Jul 03, 2018 at 03:02:55PM +0300, Dan Carpenter wrote:
> pctrl->irq[i] is unsigned so it can't be less than zero.
> 
> Fixes: 6c5d0736e9c0 ("pinctrl: actions: Add interrupt support for OWL S900 SoC")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Never mind.  I see Colin already fixed this one.

regards,
dan carpenter

