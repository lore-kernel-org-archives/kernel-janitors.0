From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 28 May 2020 15:25:18 +0000
Subject: Re: [v5] workqueue: Remove unnecessary kfree() call in rcu_free_wq()
Message-Id: <b711731e-f024-5db3-ba9d-cf37e9ae0bef@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200527075715.36849-1-qiang.zhang@windriver.com>
 <284c7851-4e89-a00f-a2e6-aa8e2e1f3fce@web.de>
 <DM6PR11MB32573F3884A864ECD586235EFF8E0@DM6PR11MB3257.namprd11.prod.outlook.com>
 <DM6PR11MB3257D6E7E93A518392502809FF8E0@DM6PR11MB3257.namprd11.prod.outlook.com>
 <20200528095703.GH30374@kadam>
 <CAJhGHyD1nV=M=ccycqCMt86GMuZGkO9trbJ=4ti4EzP9kta6iA@mail.gmail.com>
 <20200528122545.GP22511@kadam>
In-Reply-To: <20200528122545.GP22511@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: Zhang Qiang <qiang.zhang@windriver.com>, Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

>> Still, the kfree(NULL) is harmless. But it is cleaner
>> to have the patch. But the changelog is wrong, even after
>> the lengthened debating, and English is not my mother tongue,
>> so I just looked on.
>
> We have tried to tell Markus not to advise people about commit messages

A few concerns were mentioned.


> but he doesn't listen.

I am still listening as usual.

I am offering constructive patch reviews for selected topics.


> He has discouraged some contributors.  :/

There are the usual risks that additional views are occasionally not picked up
in positive ways.

Regards,
Markus
