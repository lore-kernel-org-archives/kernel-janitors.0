From: Florian Fainelli <f.fainelli@gmail.com>
Date: Mon, 08 Feb 2021 21:19:58 +0000
Subject: Re: [PATCH] MAINTAINERS: rectify BROADCOM PMB (POWER MANAGEMENT BUS) DRIVER
Message-Id: <f29d6d17-2524-ad13-6d0c-a4320a2c50a9@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210208071619.3234-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210208071619.3234-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 2/7/21 11:16 PM, Lukas Bulwahn wrote:
> Commit 8bcac4011ebe ("soc: bcm: add PM driver for Broadcom's PMB") includes
> a new MAINTAINERS section BROADCOM PMB (POWER MANAGEMENT BUS) DRIVER with
> 'drivers/soc/bcm/bcm-pmb.c', but the file was actually added at
> 'drivers/soc/bcm/bcm63xx/bcm-pmb.c'.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> 
>   warning: no file matches  F:    drivers/soc/bcm/bcm-pmb.c
> 
> Point the file entry to the right location.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on next-20210205
> 
> Rafal, please ack.
> Florian, please pick this minor fixup patch for soc next tree.

Applied, thanks Lukas.
-- 
Florian
