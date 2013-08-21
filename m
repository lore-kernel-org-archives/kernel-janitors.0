From: Mugunthan V N <mugunthanvnm@ti.com>
Date: Wed, 21 Aug 2013 09:33:50 +0000
Subject: Re: net: Add TI DaVinci EMAC driver
Message-Id: <5214D6D1.8080705@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130821084024.GK5240@elgon.mountain>
In-Reply-To: <20130821084024.GK5240@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wednesday 21 August 2013 02:56 PM, Dan Carpenter wrote:
> On Wed, Aug 21, 2013 at 08:11:10PM +0530, Mugunthan V N wrote:
>> On Wednesday 21 August 2013 02:14 PM, Gole, Anant wrote:
>>> drivers/net/ethernet/ti/davinci_emac.c
>>>   1316                   ((EMAC_DEF_ERROR_FRAME_EN) ? (EMAC_RXMBP_CEFEN_MASK) : 0x0) |
>>>   1317                   ((EMAC_DEF_PROM_EN) ? (EMAC_RXMBP_CAFEN_MASK) : 0x0) |
>>>   1318                   ((EMAC_DEF_PROM_CH & EMAC_RXMBP_CHMASK) << \
>>>                            ^^^^^^^^^^^^^^^^ This is bit 0 but it's used as a mask.  It should maybe be:
>>>
>>> 				EMAC_MBP_PROMISCCH(EMAC_DEF_PROM_CH) & EMAC_RXMBP_CHMASK
>> EMAC_DEF_PROM_CH is not denoting bit 0 but denoting which DMA channel to
>> be used to transfer promiscuous packet (i.e other MAC packets which
>> doesn't belong to us) from EMAC to DDR.
>>
>> The existing code is correct but it can be simplified as you have
>> mentioned here to make code review simpler. Will prepare a patch and
>> submit to mailing list soon.
> Let me say this a different way "(0 & x) is always zero".  We can
> just delete it because we know:
>
> 	((EMAC_DEF_PROM_CH & EMAC_RXMBP_CHMASK) << \
> 		EMAC_RXMBP_PROMCH_SHIFT)
>
> We know that 0 ANDed and then shifted is still zero.
>
>
Lets take channel 1 (i.e. channel 1 for promiscuous packet) as example
which will make it more clear. 1 & 7 will be 1, & 7 is to make a upper
limit and not to choose any channel greater than 7 and now 1 << 16 makes
sense. Since in current driver we choose channel 0 for promiscuous
packet so it looks like it makes no sense.

So when some one wants to use channel 1 to 7, then the above code will
make a difference in DMA performance.

Regards
Mugunthan V N
