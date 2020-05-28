From: Tejun Heo <tj@kernel.org>
Date: Thu, 28 May 2020 14:03:57 +0000
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjU=?= =?utf-8?Q?=5D?= workqueue: Remove unnecessary kfree() call 
Message-Id: <20200528140357.GL83516@mtj.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200527075715.36849-1-qiang.zhang@windriver.com>
 <284c7851-4e89-a00f-a2e6-aa8e2e1f3fce@web.de>
 <DM6PR11MB32573F3884A864ECD586235EFF8E0@DM6PR11MB3257.namprd11.prod.outlook.com>
 <DM6PR11MB3257D6E7E93A518392502809FF8E0@DM6PR11MB3257.namprd11.prod.outlook.com>
 <20200528095703.GH30374@kadam>
 <CAJhGHyD1nV=M=ccycqCMt86GMuZGkO9trbJ=4ti4EzP9kta6iA@mail.gmail.com>
 <20200528122545.GP22511@kadam>
 <CAJhGHyBUkMZ=cV+Qf-5+PMAFqgebbRLc46OZSSUSgoRROpUk2A@mail.gmail.com>
In-Reply-To: <CAJhGHyBUkMZ=cV+Qf-5+PMAFqgebbRLc46OZSSUSgoRROpUk2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lai Jiangshan <jiangshanlai@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, "Zhang, Qiang" <Qiang.Zhang@windriver.com>, Markus Elfring <markus.elfring@web.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hello,

On Thu, May 28, 2020 at 09:27:03PM +0800, Lai Jiangshan wrote:
> wq owns the ultimate or permanent references to itself by
> owning references to wq->numa_pwq_tbl[node], wq->dfl_pwq.
> The pwq's references keep the pwq in wq->pwqs.

Yeah, regardless of who puts a wq the last time, the base reference is put
by destroy_workqueue() and thus it's guaranteed that a wq can't be rcu freed
without going through destroy_workqueue(). lol I'm undoing the revert.

Thanks.

-- 
tejun
