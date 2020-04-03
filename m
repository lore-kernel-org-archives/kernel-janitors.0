From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 03 Apr 2020 08:11:04 +0000
Subject: Re: [PATCH] mfd: asic3: Delete redundant variable definition
Message-Id: <b2a0e5f6-1f07-a7bd-2f3c-c95119efe635@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tang Bin <tangbin@cmss.chinamobile.com>, Lee Jones <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> In this function, 'ret' is always assigned, even if 'pdata->leds'
> don't carry out,

I notice possibilities again to improve such a commit message.


> it has already been assigned a value in the above code, including '0',

The variable assignment will eventually be performed only in if branches.


> so it's redundant.

I suggest to reconsider this interpretation of the source code here.
Would you like to move the mentioned statement into an else branch
at the end?

Regards,
Markus
