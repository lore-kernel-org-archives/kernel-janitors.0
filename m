From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 12 May 2020 01:22:13 +0000
Subject: Re: [PATCH -next] spi: spi-amd: Remove spi_master_put in amd_spi_remove()
Message-Id: <566833d4-23e9-6ab6-e7bb-245678d25ee2@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200507115550.139457-1-weiyongjun1@huawei.com>
 <158921769453.22432.2365518895564552869.b4-ty@kernel.org>
 <20200511172920.GJ8216@sirena.org.uk>
In-Reply-To: <20200511172920.GJ8216@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>
Cc: kernel-janitors@vger.kernel.org, linux-spi@vger.kernel.org, Hulk Robot <hulkci@huawei.com>



On 2020/5/12 1:29, Mark Brown wrote:
> On Mon, May 11, 2020 at 06:22:01PM +0100, Mark Brown wrote:
>> On Thu, 7 May 2020 11:55:50 +0000, Wei Yongjun wrote:
>>> The call to spi_master_put() in amd_spi_remove() is redundant and
>>> may causes user after free since the master have been freed by
>>> spi_unregister_master(), so remove it.
>>
>> Applied to
>>
>>    local tree spi/for-5.7
> 
> No it wasn't, sorry for the noise here.
> 

I saw similar patch has been merged, so we do not need this patch any more.

7b9c94bd13cc ("spi: amd: Fix refcount underflow on remove")

Links:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id{9c94bd13cc9dc9c0c4932ebacf756ae612d52a

Regards,
Wei Yongjun
