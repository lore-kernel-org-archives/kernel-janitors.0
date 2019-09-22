From: maowenan <maowenan@huawei.com>
Date: Sun, 22 Sep 2019 05:08:59 +0000
Subject: Re: [PATCH net] net: ena: Add dependency for ENA_ETHERNET
Message-Id: <256c3d2c-e900-8182-48e4-fb1cfcb53a74@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190920084405.140750-1-maowenan@huawei.com>
 <20190921200741.1c3289e8@cakuba.netronome.com>
In-Reply-To: <20190921200741.1c3289e8@cakuba.netronome.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jakub Kicinski <jakub.kicinski@netronome.com>
Cc: netanel@amazon.com, saeedb@amazon.com, zorik@amazon.com, davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>



On 2019/9/22 11:07, Jakub Kicinski wrote:
> On Fri, 20 Sep 2019 16:44:05 +0800, Mao Wenan wrote:
>> If CONFIG_ENA_ETHERNET=y and CONFIG_DIMLIB=n,
>> below erros can be found:
>> drivers/net/ethernet/amazon/ena/ena_netdev.o: In function `ena_dim_work':
>> ena_netdev.c:(.text+0x21cc): undefined reference to `net_dim_get_rx_moderation'
>> ena_netdev.c:(.text+0x21cc): relocation truncated to
>> fit: R_AARCH64_CALL26 against undefined symbol `net_dim_get_rx_moderation'
>> drivers/net/ethernet/amazon/ena/ena_netdev.o: In function `ena_io_poll':
>> ena_netdev.c:(.text+0x7bd4): undefined reference to `net_dim'
>> ena_netdev.c:(.text+0x7bd4): relocation truncated to fit:
>> R_AARCH64_CALL26 against undefined symbol `net_dim'
>>
>> After commit 282faf61a053 ("net: ena: switch to dim algorithm for rx adaptive
>> interrupt moderation"), it introduces dim algorithm, which configured by CONFIG_DIMLIB.
>>
>> Fixes: 282faf61a053 ("net: ena: switch to dim algorithm for rx adaptive interrupt moderation")
>> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> 
> Thank you Mao, shortly after you posted your patch Uwe proposed to make
> DIMLIB a hidden symbol:
> 
> https://lore.kernel.org/netdev/a85be675-ce56-f7ba-29e9-b749073aab6c@kleine-koenig.org/T/#t
> 
> That patch will likely be applied soon, could you please rework your
> patch to use the "select" keyword instead of "depends". That's what
> other users do.

Ok, I will send v2.
> 
>> diff --git a/drivers/net/ethernet/amazon/Kconfig b/drivers/net/ethernet/amazon/Kconfig
>> index 69ca99d..fe46df4 100644
>> --- a/drivers/net/ethernet/amazon/Kconfig
>> +++ b/drivers/net/ethernet/amazon/Kconfig
>> @@ -18,7 +18,7 @@ if NET_VENDOR_AMAZON
>>  
>>  config ENA_ETHERNET
>>  	tristate "Elastic Network Adapter (ENA) support"
>> -	depends on PCI_MSI && !CPU_BIG_ENDIAN
>> +	depends on PCI_MSI && !CPU_BIG_ENDIAN && DIMLIB
>>  	---help---
>>  	  This driver supports Elastic Network Adapter (ENA)"
>>  
> 
> 
> .
> 
