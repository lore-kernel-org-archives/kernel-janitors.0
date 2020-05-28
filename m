From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 May 2020 12:25:45 +0000
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjU=?= =?utf-8?Q?=5D?= workqueue: Remove unnecessary kfree() call 
Message-Id: <20200528122545.GP22511@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200527075715.36849-1-qiang.zhang@windriver.com>
 <284c7851-4e89-a00f-a2e6-aa8e2e1f3fce@web.de>
 <DM6PR11MB32573F3884A864ECD586235EFF8E0@DM6PR11MB3257.namprd11.prod.outlook.com>
 <DM6PR11MB3257D6E7E93A518392502809FF8E0@DM6PR11MB3257.namprd11.prod.outlook.com>
 <20200528095703.GH30374@kadam>
 <CAJhGHyD1nV=M=ccycqCMt86GMuZGkO9trbJ=4ti4EzP9kta6iA@mail.gmail.com>
In-Reply-To: <CAJhGHyD1nV=M=ccycqCMt86GMuZGkO9trbJ=4ti4EzP9kta6iA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lai Jiangshan <jiangshanlai@gmail.com>
Cc: "Zhang, Qiang" <Qiang.Zhang@windriver.com>, Markus Elfring <markus.elfring@web.de>, Tejun Heo <tj@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Thu, May 28, 2020 at 08:08:06PM +0800, Lai Jiangshan wrote:
> On Thu, May 28, 2020 at 5:57 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > Guys, the patch is wrong.  The kfree is harmless when this is called
> > from destroy_workqueue() and required when it's called from
> > pwq_unbound_release_workfn().  Lai Jiangshan already explained this
> > already.  Why are we still discussing this?
> >
> 
> I'm also confused why they have been debating about the changelog
> after the patch was queued. My statement was about "the patch is
> a correct cleanup, but the changelog is totally misleading".
> 
> destroy_workqueue(percpu_wq) -> rcu_free_wq()
> or
> destroy_workqueue(unbound_wq) -> put_pwq() ->
> pwq_unbound_release_workfn() -> rcu_free_wq()
> 
> So the patch is correct to me. Only can destroy_workqueue()
> lead to rcu_free_wq().

It looks like there are lots of paths which call put_pwq() and
put_pwq_unlocked().

  1168  static void pwq_dec_nr_in_flight(struct pool_workqueue *pwq, int color)
  1169  {
  1170          /* uncolored work items don't participate in flushing or nr_active */
  1171          if (color = WORK_NO_COLOR)
  1172                  goto out_put;
  1173  

We don't take an extra reference in this function.

  1200  out_put:
  1201          put_pwq(pwq);
  1202  }

I don't know this code well, so I will defer to your expertise if you
say it is correct.

> 
> Still, the kfree(NULL) is harmless. But it is cleaner
> to have the patch. But the changelog is wrong, even after
> the lengthened debating, and English is not my mother tongue,
> so I just looked on.

We have tried to tell Markus not to advise people about commit messages
but he doesn't listen.  He has discouraged some contributors.  :/

regards,
dan carpenter
