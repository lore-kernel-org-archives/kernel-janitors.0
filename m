From: Davidlohr Bueso <dave@stgolabs.net>
Date: Sun, 17 Feb 2019 21:33:36 +0000
Subject: Re: [PATCH -next] IB/qib: Remove unused variable 'locked'
Message-Id: <20190217213336.urmffkfq6xtidqtj@linux-r8p5>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190216033618.116680-1-yuehaibing@huawei.com>
In-Reply-To: <20190216033618.116680-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 15 Feb 2019, Jason Gunthorpe wrote:
>This looks just wrong... The algorithm should look like the one in umem

On another note, and considering infiniband (core) is allowed on most
archs, do we want to relax the ordering guarantees from the compound
atomic64_inc_return(pinned_vm) in ib_umem_get()?

Looking at IB core and some of the drivers I don't see any particular
constraints on the order the pinned_vm is touched - so ll/sc based archs
could benefit with atomic64_inc_return_relaxed().

Thanks,
Davidlohr
