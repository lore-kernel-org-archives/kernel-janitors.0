From: maowenan <maowenan@huawei.com>
Date: Tue, 19 Feb 2019 12:52:00 +0000
Subject: Re: [PATCH v3] net: ns83820: code cleanup for ns83820_probe_phy()
Message-Id: <ffcea5ae-3a17-ca00-7019-980986fa5a5e@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <715767253.151509.1550580124264@ox-groupware.bfs.de>
In-Reply-To: <715767253.151509.1550580124264@ox-groupware.bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Walter Harms <wharms@bfs.de>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, john.fastabend@gmail.com, hawk@kernel.org, jakub.kicinski@netronome.com, daniel@iogearbox.net, ast@kernel.org, julia.lawall@lip6.fr



On 2019/2/19 20:42, Walter Harms wrote:
> 
> Am 19.02.2019 10:06, schrieb Mao Wenan:
>> This patch is to do code cleanup for ns83820_probe_phy().
>> It deletes unused variable 'first' and commented out code.
>>
>> Signed-off-by: Mao Wenan <maowenan@huawei.com>
>> ---
>>  v2->v3: delte unused variable 'first'; change subject from 
>>  "net: ns83820: drop pointless static qualifier in ns83820_probe_phy()" to
>>  "net: ns83820: code cleanup for ns83820_probe_phy()". 
>>  drivers/net/ethernet/natsemi/ns83820.c | 18 ------------------
>>  1 file changed, 18 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/natsemi/ns83820.c
>> b/drivers/net/ethernet/natsemi/ns83820.c
>> index 958fced4dacf..955d34a6f0d8 100644
>> --- a/drivers/net/ethernet/natsemi/ns83820.c
>> +++ b/drivers/net/ethernet/natsemi/ns83820.c
>> @@ -1869,34 +1869,16 @@ static unsigned ns83820_mii_write_reg(struct ns83820
>> *dev, unsigned phy, unsigne
>>  static void ns83820_probe_phy(struct net_device *ndev)
>>  {
>>  	struct ns83820 *dev = PRIV(ndev);
>> -	static int first;
>>  	int i;
>>  #define MII_PHYIDR1	0x02
>>  #define MII_PHYIDR2	0x03
>>  
>> -#if 0
>> -	if (!first) {
>> -		unsigned tmp;
>> -		ns83820_mii_read_reg(dev, 1, 0x09);
>> -		ns83820_mii_write_reg(dev, 1, 0x10, 0x0d3e);
>> -
>> -		tmp = ns83820_mii_read_reg(dev, 1, 0x00);
>> -		ns83820_mii_write_reg(dev, 1, 0x00, tmp | 0x8000);
>> -		udelay(1300);
>> -		ns83820_mii_read_reg(dev, 1, 0x09);
>> -	}
>> -#endif
>> -	first = 1;
>> -
>>  	for (i=1; i<2; i++) {
> 
> 
> the loop here seems also pointless, so you can eliminate i.
> (or did i muss something ?)
> 
good point.Thank you.

> just my 2 cents,
> re,
>  wh
>>  		int j;
>>  		unsigned a, b;
>>  		a = ns83820_mii_read_reg(dev, i, MII_PHYIDR1);
>>  		b = ns83820_mii_read_reg(dev, i, MII_PHYIDR2);
>>  
>> -		//printk("%s: phy %d: 0x%04x 0x%04x\n",
>> -		//	ndev->name, i, a, b);
>> -
>>  		for (j=0; j<0x16; j+=4) {
>>  			dprintk("%s: [0x%02x] %04x %04x %04x %04x\n",
>>  				ndev->name, j,
> 
> .
> 
