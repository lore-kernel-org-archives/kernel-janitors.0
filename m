From: Yuehaibing <yuehaibing@huawei.com>
Date: Tue, 12 Nov 2019 07:08:24 +0000
Subject: Re: [PATCH -next] crypto: sun8i-ss - Fix memdup.cocci warnings
Message-Id: <43dff5e6-dc85-a631-2e6a-1dc07540e5a4@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191109024403.47106-1-yuehaibing@huawei.com>
 <20191112070309.GA18647@Red>
In-Reply-To: <20191112070309.GA18647@Red>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 2019/11/12 15:03, Corentin Labbe wrote:
> On Sat, Nov 09, 2019 at 02:44:03AM +0000, YueHaibing wrote:
>> Use kmemdup rather than duplicating its implementation
>>
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> ---
> 
> Hello
> 
> Thanks but the patch was already sent by kbuild robot and merged.

Sorry, this patch title should be "sun8i-ce" instead of "sun8i-ss",

kbuild robot indeed fix 'sun8i-ss' warning,  will resend v2.

> 
> Regards
> 
> 
