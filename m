From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 02 Jun 2020 15:05:18 +0000
Subject: Re: spi: spi-ti-qspi: call pm_runtime_put on pm_runtime_get failure
Message-Id: <cc8e1397-c605-d73e-363e-9d2ddfb9ae16@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <26028f50-3fb8-eb08-3c9f-08ada018bf9e@web.de>
 <20200602094947.GA5684@sirena.org.uk>
 <1c13e0ec-e50f-9eea-5704-052d2d682727@web.de>
 <20200602141306.GH5684@sirena.org.uk>
In-Reply-To: <20200602141306.GH5684@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Mark Brown <broonie@kernel.org>, Navid Emamdoost <navid.emamdoost@gmail.com>, linux-spi@vger.kernel.org
Cc: Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Qiushi Wu <wu000273@umn.edu>, Dinghao Liu <dinghao.liu@zju.edu.cn>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> I find this commit message improvable also according to Linux software
>> development documentation.
>
> Causing people to send out new versions of things for tweaks to the
> commit log consumes time for them and everyone they're sending changes to.

Improving patches (besides source code adjustments) is an usual software
development activity, isn't it?


> Pushing people to make trivial rewordings of their commit logs to
> match your particular taste is not a good use of people's time.

Corresponding tweaks can be combined with recommended tags.
It can be that only =93trivial=94 items were left over for another bit
of fine-tuning. Subsequent description variants can reduce
the probability for additional patch review iterations, can't they?

Regards,
Markus
