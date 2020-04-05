From: Dmitry Osipenko <digetx@gmail.com>
Date: Sun, 05 Apr 2020 13:50:16 +0000
Subject: Re: PM / devfreq: tegra30: Delete an error message in tegra_devfreq_probe()
Message-Id: <2af3ed08-3607-9ecf-e092-fc126d2abeab@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ba67e238-43a7-6c53-363e-7a2c12f09949@web.de>
 <27bdd09b-0b8d-a6ef-2ffd-53421277fcca@gmail.com>
 <72e2319e-9b9b-9045-c007-320b2be1e886@web.de>
In-Reply-To: <72e2319e-9b9b-9045-c007-320b2be1e886@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Kyungmin Park <kyungmin.park@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Tang Bin <tangbin@cmss.chinamobile.com>

05.04.2020 09:00, Markus Elfring пишет:
>> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> 
> Thanks for your positive feedback.
> 
> Will the logging of error codes need any more clarification
> around such function calls?

In general no, but it could be different for some (more complex) drivers.
