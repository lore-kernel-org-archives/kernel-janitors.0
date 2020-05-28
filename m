From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 28 May 2020 14:40:30 +0000
Subject: Re: [v5] workqueue: Remove unnecessary kfree() call in rcu_free_wq()
Message-Id: <17ea4742-6fdb-c0a2-666d-a9c2b8f2bf4a@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200527075715.36849-1-qiang.zhang@windriver.com>
 <284c7851-4e89-a00f-a2e6-aa8e2e1f3fce@web.de>
 <DM6PR11MB32573F3884A864ECD586235EFF8E0@DM6PR11MB3257.namprd11.prod.outlook.com>
 <DM6PR11MB3257D6E7E93A518392502809FF8E0@DM6PR11MB3257.namprd11.prod.outlook.com>
 <20200528095703.GH30374@kadam> <20200528103809.GK83516@mtj.thefacebook.com>
 <5e25fc22-fb61-46f8-a8ec-232bceee40b7@web.de>
In-Reply-To: <5e25fc22-fb61-46f8-a8ec-232bceee40b7@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tejun Heo <tj@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, Zhang Qiang <qiang.zhang@windriver.com>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> Can it matter to use separate callback functions for these cases?
> https://elixir.bootlin.com/linux/v5.7-rc7/C/ident/rcu_free_pwq

See also:
https://elixir.bootlin.com/linux/v5.7-rc7/C/ident/rcu_free_wq

Regards,
Markus
