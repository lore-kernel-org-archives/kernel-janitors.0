From: Vivek Gautam <vivek.gautam@codeaurora.org>
Date: Tue, 20 Jun 2017 08:57:40 +0000
Subject: Re: [PATCH] phy: brcm-sata: fix a timeout test in init
Message-Id: <c13b054d-2713-8303-c599-96d315521736@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170619105251.GA23911@elgon.mountain>
 <69b479f4-8939-4c11-2c16-2e188e02a625@codeaurora.org>
 <20170620084257.mr2xzz6lqlmp6rlc@mwanda>
In-Reply-To: <20170620084257.mr2xzz6lqlmp6rlc@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>, Heiko Stuebner <heiko@sntech.de>, Florian Fainelli <f.fainelli@gmail.com>, Axel Lin <axel.lin@ingics.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On 06/20/2017 02:12 PM, Dan Carpenter wrote:
> On Tue, Jun 20, 2017 at 01:56:35PM +0530, Vivek Gautam wrote:
>>
>> On 06/19/2017 04:26 PM, Dan Carpenter wrote:
>>> We want to timeout with try set to zero so this should be a pre-op
>>> instead of post-op.
>>>
>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>>
>>> diff --git a/drivers/phy/broadcom/phy-brcm-sata.c b/drivers/phy/broadcom/phy-brcm-sata.c
>>> index ccbc3d994998..48fb016ce689 100644
>>> --- a/drivers/phy/broadcom/phy-brcm-sata.c
>>> +++ b/drivers/phy/broadcom/phy-brcm-sata.c
>>> @@ -329,7 +329,7 @@ static int brcm_nsp_sata_init(struct brcm_sata_port *port)
>>>    	/* Wait for pll_seq_done bit */
>>>    	try = 50;
>>> -	while (try--) {
>>> +	while (--try) {
>> Do we want to try reading the status 50 times? If yes, won't your change
>> break that? It will rather run the loop 49 times.
>>
> Yeah.  I know.  I'm pretty sure that 50 is a rough number, and not an
> exact thing.

Right, I agree that this must be rough count.
nice catch btw.

Best regards
Vivek

>
> regards,
> dan carpenter
>

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

