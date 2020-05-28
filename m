From: Tejun Heo <tj@kernel.org>
Date: Thu, 28 May 2020 10:38:09 +0000
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjU=?= =?utf-8?Q?=5D?= workqueue: Remove unnecessary kfree() call 
Message-Id: <20200528103809.GK83516@mtj.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200527075715.36849-1-qiang.zhang@windriver.com>
 <284c7851-4e89-a00f-a2e6-aa8e2e1f3fce@web.de>
 <DM6PR11MB32573F3884A864ECD586235EFF8E0@DM6PR11MB3257.namprd11.prod.outlook.com>
 <DM6PR11MB3257D6E7E93A518392502809FF8E0@DM6PR11MB3257.namprd11.prod.outlook.com>
 <20200528095703.GH30374@kadam>
In-Reply-To: <20200528095703.GH30374@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Zhang, Qiang" <Qiang.Zhang@windriver.com>, Markus Elfring <markus.elfring@web.de>, Lai Jiangshan <jiangshanlai@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Thu, May 28, 2020 at 12:57:03PM +0300, Dan Carpenter wrote:
> Guys, the patch is wrong.  The kfree is harmless when this is called
> from destroy_workqueue() and required when it's called from
> pwq_unbound_release_workfn().  Lai Jiangshan already explained this
> already.  Why are we still discussing this?

Oops, missed that. Reverting.

Thanks.

-- 
tejun
