From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Date: Mon, 08 Feb 2021 08:42:28 +0000
Subject: Re: [PATCH] MAINTAINERS: rectify BROADCOM PMB (POWER MANAGEMENT BUS) DRIVER
Message-Id: <883902e16721c9a439a7caaa897a317b@milecki.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210208071619.3234-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210208071619.3234-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 2021-02-08 08:16, Lukas Bulwahn wrote:
> Commit 8bcac4011ebe ("soc: bcm: add PM driver for Broadcom's PMB") 
> includes
> a new MAINTAINERS section BROADCOM PMB (POWER MANAGEMENT BUS) DRIVER 
> with
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

Thanks!

Acked-by: Rafał Miłecki <rafal@milecki.pl>
