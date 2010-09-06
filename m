From: Kulikov Vasiliy <segooon@gmail.com>
Date: Mon, 06 Sep 2010 14:18:13 +0000
Subject: Re: [PATCH 13/14] mm: mempolicy: Check return code of check_range
Message-Id: <20100906141813.GB9632@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283711588-7628-1-git-send-email-segooon@gmail.com>
 <20100906093610.C8B5.A69D9226@jp.fujitsu.com>
 <alpine.DEB.2.00.1009060201000.10552@chino.kir.corp.google.com>
In-Reply-To: <alpine.DEB.2.00.1009060201000.10552@chino.kir.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Rientjes <rientjes@google.com>
Cc: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Lee Schermerhorn <lee.schermerhorn@hp.com>, Christoph Lameter <cl@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org

On Mon, Sep 06, 2010 at 02:02 -0700, David Rientjes wrote:
> On Mon, 6 Sep 2010, KOSAKI Motohiro wrote:
> 
> > > From: Vasiliy Kulikov <segooon@gmail.com>
> > > 
> > > Function check_range may return ERR_PTR(...). Check for it.
> > 
> > When happen this issue?
> > 
> > afaik, check_range return error when following condition.
> >  1) mm->mmap->vm_start argument is incorrect
> >  2) don't have neigher MPOL_MF_STATS, MPOL_MF_MOVE and MPOL_MF_MOVE_ALL
> > 
> > I think both case is not happen in real. Am I overlooking anything?
> > 
> 
> There's no reason not to check the return value of a function when the 
> implementation of either could change at any time.  migrate_to_node() is 
> certainly not in any fastpath where we can't sacrifice a branch for more 
> robust code.

Agreed, if you know that the caller must check input data and must not
check return code, it's better to make this function return void.

-- 
Vasiliy
