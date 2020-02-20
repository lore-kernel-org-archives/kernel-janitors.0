From: Matthias Brugger <matthias.bgg@gmail.com>
Date: Thu, 20 Feb 2020 20:24:48 +0000
Subject: Re: [PATCH] pinctrl: mediatek: Fix some off by one bugs
Message-Id: <1c333e81-7468-80d6-0835-02c444bb8b5d@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200218055247.74s2xa7veqx2do34@kili.mountain>
 <CACRpkdYWsWNg9oetuHPt0VEz+WKKiqfbfuCu503tpRyZ=7nV=A@mail.gmail.com>
In-Reply-To: <CACRpkdYWsWNg9oetuHPt0VEz+WKKiqfbfuCu503tpRyZ=7nV=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sean Wang <sean.wang@kernel.org>, Light Hsieh <light.hsieh@mediatek.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org



On 20/02/2020 16:14, Linus Walleij wrote:
> On Tue, Feb 18, 2020 at 6:55 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
>> These comparisons should be >= instead of > to prevent accessing one
>> element beyond the end of the hw->soc->pins[] array.
>>
>> Fixes: 3de7deefce69 ("pinctrl: mediatek: Check gpio pin number and use binary search in mtk_hw_pin_field_lookup()")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Matthias could you have a look at this patch?
> 

From what I see hw->soc->npins is the ARRAY_SIZE() of the pins. So the index
should smaller hw->soc->npins.

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
