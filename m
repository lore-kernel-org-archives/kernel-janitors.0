From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 May 2020 09:57:03 +0000
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjU=?= =?utf-8?Q?=5D?= workqueue: Remove unnecessary kfree() call 
Message-Id: <20200528095703.GH30374@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200527075715.36849-1-qiang.zhang@windriver.com>
 <284c7851-4e89-a00f-a2e6-aa8e2e1f3fce@web.de>
 <DM6PR11MB32573F3884A864ECD586235EFF8E0@DM6PR11MB3257.namprd11.prod.outlook.com>
 <DM6PR11MB3257D6E7E93A518392502809FF8E0@DM6PR11MB3257.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB3257D6E7E93A518392502809FF8E0@DM6PR11MB3257.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Zhang, Qiang" <Qiang.Zhang@windriver.com>
Cc: Markus Elfring <markus.elfring@web.de>, Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Guys, the patch is wrong.  The kfree is harmless when this is called
from destroy_workqueue() and required when it's called from
pwq_unbound_release_workfn().  Lai Jiangshan already explained this
already.  Why are we still discussing this?

regards,
dan carpenter
