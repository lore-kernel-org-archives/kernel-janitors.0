From: Zhou Wang <wangzhou1@hisilicon.com>
Date: Sat, 28 Feb 2015 04:47:13 +0000
Subject: Re: [patch] mtd: hisilicon: && vs & typo
Message-Id: <54F14851.5040209@hisilicon.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150211102509.GB18515@mwanda>
 <20150215090711.GA8351@norris-Latitude-E6410>
In-Reply-To: <20150215090711.GA8351@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Dan Carpenter <dan.carpenter@oracle.com>

On 2015/2/15 17:07, Brian Norris wrote:
> On Wed, Feb 11, 2015 at 01:25:09PM +0300, Dan Carpenter wrote:
>> The intent was to mask away some bits here, not to test true or false.
>>
>> Fix: 54f531f6e332 ('mtd: hisilicon: add a new NAND controller driver for hisilicon hip04 Soc')
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Pushed to l2-mtd.git. Thanks.

Hi Brian,

Thanks for the pushing.

Zhou Wang

> 
> Brian
> 
> 


