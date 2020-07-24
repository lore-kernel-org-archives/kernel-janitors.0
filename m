From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 24 Jul 2020 07:09:35 +0000
Subject: Re: [PATCH] regulator: fix memory leak on error path of regulator_register()
Message-Id: <1e281322-c589-9c36-0565-98fccf5f0e17@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Vladimir Zapolskiy <vz@mleia.com>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Wen Yang <wenyang@linux.alibaba.com>

> … introduced as a side ef another …

Would the following wording variant be more appropriate?

  … introduced as a side effect of another …


How do you think about to replace the wording “…, I believe …”
by an imperative description?

Regards,
Markus
