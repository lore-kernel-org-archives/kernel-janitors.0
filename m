From: Colin Ian King <colin.king@canonical.com>
Date: Thu, 05 Jul 2018 10:50:01 +0000
Subject: Re: [PATCH] net: ethernet: sun: remove redundant variables adv and lpa
Message-Id: <dfecea10-87b5-2110-6efb-02f46e7b4e2c@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180705093732.21650-1-colin.king@canonical.com>
 <20180705.193315.2106014813802269928.davem@davemloft.net>
In-Reply-To: <20180705.193315.2106014813802269928.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 05/07/18 11:33, David Miller wrote:
> From: Colin King <colin.king@canonical.com>
> Date: Thu,  5 Jul 2018 10:37:32 +0100
> 
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Variables adv and lpa are being assigned but are never used hence they
>> are redundant and can be removed.
>>
>> Cleans up clang warnings:
>> warning: variable 'lpa' set but not used [-Wunused-but-set-variable]
>> warning: variable 'adv' set but not used [-Wunused-but-set-variable]
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> I think you can safely remove the register reads too, so please
> do so.

Just to clarify, just the MII_ADVERTISE and MII_LPA, or both these AND
also MII_ESTATUS too?

> 
> Thanks.
> 

