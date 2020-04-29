From: Manfred Spraul <manfred@colorfullife.com>
Date: Wed, 29 Apr 2020 05:22:13 +0000
Subject: Re: [PATCH -next] ipc: use GFP_ATOMIC under spin lock
Message-Id: <a0f82756-3e51-d960-d901-e4cc3c7c4c19@colorfullife.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200428034736.27850-1-weiyongjun1@huawei.com>
 <20200428111403.GJ29705@bombadil.infradead.org>
In-Reply-To: <20200428111403.GJ29705@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Matthew Wilcox <willy@infradead.org>, Wei Yongjun <weiyongjun1@huawei.com>
Cc: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Waiman Long <longman@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Alexey Dobriyan <adobriyan@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello together,

On 4/28/20 1:14 PM, Matthew Wilcox wrote:
> On Tue, Apr 28, 2020 at 03:47:36AM +0000, Wei Yongjun wrote:
>> The function ipc_id_alloc() is called from ipc_addid(), in which
>> a spin lock is held, so we should use GFP_ATOMIC instead.
>>
>> Fixes: de5738d1c364 ("ipc: convert ipcs_idr to XArray")
>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> I see why you think that, but it's not true.  Yes, we hold a spinlock, but
> the spinlock is in an object which is not reachable from any other CPU.

Is it really allowed that spin_lock()/spin_unlock may happen on 
different cpus?

CPU1: spin_lock()

CPU1: schedule() -> sleeps

CPU2: -> schedule() returns

CPU2: spin_unlock().


> Converting to GFP_ATOMIC is completely wrong.

What is your solution proposal?

xa_store() also gets a gfp_ flag. Thus even splitting _alloc() and 
_store() won't help

     xa_alloc(,entry=NULL,)
     new->seq = ...
     spin_lock();
     xa_store(,entry=new,GFP_KERNEL);

--

     Manfred
