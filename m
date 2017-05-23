From: Chanwoo Choi <cw00.choi@samsung.com>
Date: Tue, 23 May 2017 09:34:31 +0000
Subject: Re: [PATCH 0/3] Extcon: Fine-tuning for three functions
Message-Id: <59240227.4030505@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20170424123857epcas2p24390d04885c9fc4c1980838ed8a4db06@epcas2p2.samsung.com>
        <b650292b-4f5f-c50d-f0a3-604ba26bcbef@users.sourceforge.net>
In-Reply-To: <b650292b-4f5f-c50d-f0a3-604ba26bcbef@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, patches@opensource.wolfsonmicro.com, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 2017년 04월 24일 21:38, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 24 Apr 2017 14:26:54 +0200
> 
> Three update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (3):
>   Use devm_kcalloc() in extcon_dev_register()
>   Fix a typo in three comment lines
>   Use devm_kcalloc() in arizona_extcon_get_micd_configs()
> 
>  drivers/extcon/extcon-arizona.c |  4 +---
>  drivers/extcon/extcon.c         | 11 +++++------
>  2 files changed, 6 insertions(+), 9 deletions(-)
> 

Applied these patches.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
