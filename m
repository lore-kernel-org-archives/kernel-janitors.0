From: Davidlohr Bueso <dave@stgolabs.net>
Date: Sun, 17 Feb 2019 15:41:48 +0000
Subject: Re: [PATCH -next] IB/qib: Remove unused variable 'locked'
Message-Id: <20190217154148.s225o2y4d6dqqjph@linux-r8p5>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190216033618.116680-1-yuehaibing@huawei.com>
In-Reply-To: <20190216033618.116680-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 16 Feb 2019, Jason Gunthorpe wrote:
>> diff --git a/drivers/infiniband/hw/qib/qib_user_pages.c b/drivers/infiniband/hw/qib/qib_user_pages.c
>> index ef8bcf366ddc..123ca8f64f75 100644
>> +++ b/drivers/infiniband/hw/qib/qib_user_pages.c
>> @@ -107,7 +107,7 @@ int qib_get_user_pages(unsigned long start_page, size_t num_pages,
>> 	lock_limit = rlimit(RLIMIT_MEMLOCK) >> PAGE_SHIFT;
>> 	locked = atomic64_add_return(num_pages, &current->mm->pinned_vm);
>>
>> -	if (num_pages > lock_limit && !capable(CAP_IPC_LOCK)) {
>> +	if (locked > lock_limit && !capable(CAP_IPC_LOCK)) {
>> 		ret = -ENOMEM;
>> 		goto bail;
>
>Missing atomic_sub ?

Not really the sub is in thhe bail part when we return non-zero.

Thanks,
Davidlohr
