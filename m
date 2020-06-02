From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 02 Jun 2020 19:54:49 +0000
Subject: Re: spi: spi-ti-qspi: call pm_runtime_put on pm_runtime_get failure
Message-Id: <1d1a4e7a-1c1e-efeb-ad61-5e4f1eeecab1@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <26028f50-3fb8-eb08-3c9f-08ada018bf9e@web.de>
 <20200602094947.GA5684@sirena.org.uk>
 <1c13e0ec-e50f-9eea-5704-052d2d682727@web.de>
 <20200602141306.GH5684@sirena.org.uk>
 <cc8e1397-c605-d73e-363e-9d2ddfb9ae16@web.de>
 <20200602183644.GI5684@sirena.org.uk>
In-Reply-To: <20200602183644.GI5684@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>, Navid Emamdoost <navid.emamdoost@gmail.com>, linux-spi@vger.kernel.org
Cc: Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Qiushi Wu <wu000273@umn.edu>, Dinghao Liu <dinghao.liu@zju.edu.cn>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> Your updates were not improvements.

I find your view interesting.

Do you refer to a specific wording suggestion here?
https://lore.kernel.org/linux-spi/26028f50-3fb8-eb08-3c9f-08ada018bf9e@web.de/
https://lkml.org/lkml/2020/6/2/210

You pointed another programming alternative out.
https://lore.kernel.org/patchwork/comment/1447149/
https://lore.kernel.org/linux-spi/20200602095411.GB5684@sirena.org.uk/


> The formatting was worse

Do you prefer an other quotation style for function names?


> and to my native speaker eyes the grammar was worse.

I am curious if a more pleasing wording variant will be found.


> With this sort of stylistic thing it's especially important
> that any review aligns with the needs and practices of the subsystem,

Such an expectation is reasonable to some degree.


> there is opinion in there and multiple opinions just makes things harder
> for submitters.

Do any of such views deviate from the Linux development documentation?

Regards,
Markus
