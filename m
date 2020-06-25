From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 25 Jun 2020 12:34:44 +0000
Subject: Re: [PATCH v2] iio: magnetometer: ak8974: Fix runtime PM imbalance on error in ak8974_probe()
Message-Id: <68225325-ba51-7aab-6fef-6f234f4068d1@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dd84c12f-277d-27e7-3727-4592e530e4ed@web.de>
In-Reply-To: <dd84c12f-277d-27e7-3727-4592e530e4ed@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Linus Walleij <linus.walleij@linaro.org>, Dinghao Liu <dinghao.liu@zju.edu.cn>, linux-iio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Jonathan Cameron <jic23@kernel.org>, Kangjie Lu <kjlu@umn.edu>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>

https://lkml.org/lkml/2020/6/14/117
https://lore.kernel.org/patchwork/comment/1452516/
https://lore.kernel.org/linux-iio/20200614131116.143bcf92@archlinux/

> There was a lot of fuzz in this one due to other changes to the driver.
> I 'think' it went it cleanly though.

Is it interesting anyhow that you committed a change description
which contained typos (on 2020-06-14 13:08:47 +0100)?
https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/drivers/iio/magnetometer/ak8974.c?h=fixes-togreg&id87294d227dfc42889e1da8f8ce1e44fc25f147

How were the chances that my patch review comments would be taken
better into account?
https://lore.kernel.org/linux-iio/dd84c12f-277d-27e7-3727-4592e530e4ed@web.de/
https://lkml.org/lkml/2020/5/31/152

Regards,
Markus
