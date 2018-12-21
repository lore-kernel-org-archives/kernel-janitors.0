From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 21 Dec 2018 06:28:01 +0000
Subject: Re: [PATCH -next] IB/mlx4: Remove set but not used variable 'pd'
Message-Id: <a54230eb-11ce-9822-2d15-61b29463329a@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545357957-67309-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1545357957-67309-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2018/12/21 11:48, Jason Gunthorpe wrote:
> On Fri, Dec 21, 2018 at 02:05:57AM +0000, YueHaibing wrote:
>> Fixes gcc '-Wunused-but-set-variable' warning:
>>
>> drivers/infiniband/hw/mlx4/qp.c: In function '_mlx4_ib_destroy_qp':
>> drivers/infiniband/hw/mlx4/qp.c:1612:22: warning:
>>  variable 'pd' set but not used [-Wunused-but-set-variable]
>>
>> It not used since commit e00b64f7c54c ("RDMA: Cleanup undesired
>> pd->uobject usage")
>>
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> ---
>>  drivers/infiniband/hw/mlx4/qp.c | 3 ---
>>  1 file changed, 3 deletions(-)
> 
> I wonder why my compiler didn't flag this..

just use make W=1

> 
> Applied to for-next, thanks
> 
> Jason
> 
> 
