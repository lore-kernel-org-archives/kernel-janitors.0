From: maowenan <maowenan@huawei.com>
Date: Fri, 22 Feb 2019 06:54:33 +0000
Subject: Re: [PATCH v2] net: set static variable an initial value in atl2_probe()
Message-Id: <653c83df-bf63-ffb7-9afa-1383e140ac70@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190222054012.194038-1-maowenan@huawei.com>
In-Reply-To: <20190222054012.194038-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



On 2019/2/22 14:28, Dan Carpenter wrote:
> You need to send this to netdev.
OK, I have done that.
> 
> On Fri, Feb 22, 2019 at 01:40:12PM +0800, Mao Wenan wrote:
>> cards_found is a static variable, but when it enters atl2_probe(),
>> cards_found is set to zero, the value is not consistent with it in the heap,
>> so next behavior is not our expect.
>>
> 
> This seems reasonable.  Does this do anything besides let you configure
> multiple cards in different ways using module parameters?

I think this need to develop new interface by using module parameters.
