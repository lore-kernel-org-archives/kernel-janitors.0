From: Jing Xiangfeng <jingxiangfeng@huawei.com>
Date: Fri, 06 Nov 2020 00:54:03 +0000
Subject: Re: [PATCH] mfd: htc-i2cpld: Add the missed i2c_put_adapter() in htcpld_register_chip_i2c()
Message-Id: <5FA49EAB.2020308@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201104063158.102048-1-jingxiangfeng@huawei.com>
 <ec8f256f-d796-1311-1faa-443e33631ced@web.de>
In-Reply-To: <ec8f256f-d796-1311-1faa-443e33631ced@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, Lee Jones <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On 2020/11/4 14:50, Markus Elfring wrote:
>> htcpld_register_chip_i2c() misses to call i2c_put_adapter() in an error
>> path. Add the missed function call to fix it.
> Would you like to add the tag “Fixes”?
OK, I'll send a v2 with it.

  Thanks
>
> Regards,
> Markus
> .
>
