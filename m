From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 27 May 2020 08:20:46 +0000
Subject: Re: [PATCH v5] workqueue: Remove unnecessary kfree() call in rcu_free_wq()
Message-Id: <284c7851-4e89-a00f-a2e6-aa8e2e1f3fce@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200527075715.36849-1-qiang.zhang@windriver.com>
In-Reply-To: <20200527075715.36849-1-qiang.zhang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Zhang Qiang <qiang.zhang@windriver.com>, Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> Thus delete this function call which became unnecessary with the referenced
> software update.
…
> Suggested-by: Markus Elfring <Markus.Elfring@web.de>

Would the tag “Co-developed-by” be more appropriate according to the patch review
to achieve a more pleasing commit message?


>  v1->v2->v3->v4->v5:
>  Modify weakly submitted information.

Now I wonder about your wording choice “weakly”.

Regards,
Markus
