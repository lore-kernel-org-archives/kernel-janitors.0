From: Zhou Wang <wangzhou1@hisilicon.com>
Date: Sat, 28 Feb 2015 04:44:23 +0000
Subject: Re: [patch] mtd: hisilicon: && vs & typo
Message-Id: <54F147A7.50701@hisilicon.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150211102509.GB18515@mwanda>
 <20150212213740.GA18140@ld-irv-0074>
In-Reply-To: <20150212213740.GA18140@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Dan Carpenter <dan.carpenter@oracle.com>

On 2015/2/13 5:37, Brian Norris wrote:
> Hi,
> 
> On Wed, Feb 11, 2015 at 01:25:09PM +0300, Dan Carpenter wrote:
>> The intent was to mask away some bits here, not to test true or false.
>>
>> Fix: 54f531f6e332 ('mtd: hisilicon: add a new NAND controller driver for hisilicon hip04 Soc')
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>> diff --git a/drivers/mtd/nand/hisi504_nand.c b/drivers/mtd/nand/hisi504_nand.c
>> index 484e1db..289ad3a 100644
>> --- a/drivers/mtd/nand/hisi504_nand.c
>> +++ b/drivers/mtd/nand/hisi504_nand.c
>> @@ -495,7 +495,7 @@ static void hisi_nfc_cmdfunc(struct mtd_info *mtd, unsigned command, int column,
>>  		flag = hinfc_read(host, HINFC504_CON);
>>  		if (chip->ecc.mode = NAND_ECC_HW)
>>  			hinfc_write(host,
>> -				    flag && ~(HINFC504_CON_ECCTYPE_MASK <<
>> +				    flag & ~(HINFC504_CON_ECCTYPE_MASK <<
> 
> Looks good to me. Zhou, can I get an ack?

Hi Brian,

Sorry for late for the reason of Chinese new year vacation.
You can apply that above, My mistake there.

Thanks,
Zhou Wang

> 
>>  				    HINFC504_CON_ECCTYPE_SHIFT), HINFC504_CON);
>>  
>>  		host->offset = 0;
> 
> Brian
> 
> 


