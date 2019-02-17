From: Davidlohr Bueso <dave@stgolabs.net>
Date: Sun, 17 Feb 2019 17:05:58 +0000
Subject: Re: [PATCH -next] IB/qib: Remove unused variable 'locked'
Message-Id: <20190217170558.xevqizmpd4bx23gb@linux-r8p5>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190216033618.116680-1-yuehaibing@huawei.com>
In-Reply-To: <20190216033618.116680-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 17 Feb 2019, H?kon Bugge wrote:

>
>
>> On 16 Feb 2019, at 13:15, Davidlohr Bueso <dave@stgolabs.net> wrote:
>>
>> On Fri, 15 Feb 2019, Jason Gunthorpe wrote:
>>
>>> On Sat, Feb 16, 2019 at 03:36:18AM +0000, YueHaibing wrote:
>>>> Fixes gcc '-Wunused-but-set-variable' warning:
>>>>
>>>> drivers/infiniband/hw/qib/qib_user_pages.c: In function 'qib_get_user_pages':
>>>> drivers/infiniband/hw/qib/qib_user_pages.c:103:16: warning:
>>>> variable 'locked' set but not used [-Wunused-but-set-variable]
>>>>
>>>> It's never used since introduction.
>>>>
>>>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>>>> drivers/infiniband/hw/qib/qib_user_pages.c | 4 ++--
>>>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/infiniband/hw/qib/qib_user_pages.c b/drivers/infiniband/hw/qib/qib_user_pages.c
>>>> index ef8bcf366ddc..a5be36c07451 100644
>>>> +++ b/drivers/infiniband/hw/qib/qib_user_pages.c
>>>> @@ -100,12 +100,12 @@ int qib_map_page(struct pci_dev *hwdev, struct page *page, dma_addr_t *daddr)
>>>> int qib_get_user_pages(unsigned long start_page, size_t num_pages,
>>>> 		       struct page **p)
>>>> {
>>>> -	unsigned long locked, lock_limit;
>>>> +	unsigned long lock_limit;
>>>> 	size_t got;
>>>> 	int ret;
>>>>
>>>> 	lock_limit = rlimit(RLIMIT_MEMLOCK) >> PAGE_SHIFT;
>>>> -	locked = atomic64_add_return(num_pages, &current->mm->pinned_vm);
>>>> +	atomic64_add_return(num_pages, &current->mm->pinned_vm);
>>>>
>>>> 	if (num_pages > lock_limit && !capable(CAP_IPC_LOCK)) {
>>>> 		ret = -ENOMEM;
>>>
>>> This looks just wrong... The algorithm should look like the one in umem
>>
>> Indeed, but the current check also looks wrong; we wanna check against the
>> new value after the addition of num_pages.
>>
>> Thanks,
>> Davidlohr
>>
>> -----------8<------------------------------------------------------------
>> [PATCH] drivers/IB,qib: Fix pinned/locked limit check in qib_get_user_pages()
>>
>> The current check does not take into account the previous value of
>> pinned_vm; thus it is quite bogus as is. Fix this by checking the
>> new value after the (optimistic) atomic inc.
>>
>> Signed-off-by: Davidlohr Bueso <dbueso@suse.de <mailto:dbueso@suse.de>>
>> ---
>> drivers/infiniband/hw/qib/qib_user_pages.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/infiniband/hw/qib/qib_user_pages.c b/drivers/infiniband/hw/qib/qib_user_pages.c
>> index ef8bcf366ddc..123ca8f64f75 100644
>> --- a/drivers/infiniband/hw/qib/qib_user_pages.c
>> +++ b/drivers/infiniband/hw/qib/qib_user_pages.c
>> @@ -107,7 +107,7 @@ int qib_get_user_pages(unsigned long start_page, size_t num_pages,
>> 	lock_limit = rlimit(RLIMIT_MEMLOCK) >> PAGE_SHIFT;
>> 	locked = atomic64_add_return(num_pages, &current->mm->pinned_vm);
>> -	if (num_pages > lock_limit && !capable(CAP_IPC_LOCK)) {
>> +	if (locked > lock_limit && !capable(CAP_IPC_LOCK)) {
>> 		ret = -ENOMEM;
>> 		goto bail;
>
>But you have still added num_pages to current->mm->pinned_vm. Need to subtract them.

bail:
	atomic64_sub(num_pages, &current->mm->pinned_vm);
	return ret;
