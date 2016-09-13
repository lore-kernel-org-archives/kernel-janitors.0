From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Tue, 13 Sep 2016 12:56:26 +0000
Subject: Re: [PATCH v2 2/2] crypto: qat - fix resource release omissions
Message-Id: <878bddf5-9561-a2e9-7f97-323f11a13d54@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160902144753.31334-1-lambert.quentin@gmail.com>
 <20160902144753.31334-3-lambert.quentin@gmail.com>
 <20160906101851.GA27032@sivswdev01.ir.intel.com>
 <20160913124006.GB31835@gondor.apana.org.au>
In-Reply-To: <20160913124006.GB31835@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>, Giovanni Cabiddu <giovanni.cabiddu@intel.com>
Cc: Salvatore Benedetto <salvatore.benedetto@intel.com>, "David S. Miller" <davem@davemloft.net>, qat-linux@intel.com, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, giovanni.cabiddu@gmail.com



On 13/09/2016 14:40, Herbert Xu wrote:
> On Tue, Sep 06, 2016 at 11:18:51AM +0100, Giovanni Cabiddu wrote:
>> ---8<---
>> Subject: [PATCH] crypto: qat - fix leak on error path
>>
>> Fix a memory leak in an error path in uc loader.
>>
>> Signed-off-by: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
> Patch applied.  Thanks.
Sorry, I completly missed Giovanni's message. Good work!

Quentin
