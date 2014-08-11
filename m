From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Aug 2014 06:56:16 +0000
Subject: Re: [patch 1/2] pinctrl: tegra-xusb: fix an off by one test
Message-Id: <CACRpkdZgvTrKa_5Nyszmxo6mrUzxmYOBm_HXjKsdVLVq=DY6GA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140731152217.GD31539@mwanda>
	<53DA6217.1050604@wwwdotorg.org>
In-Reply-To: <53DA6217.1050604@wwwdotorg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Thierry Reding <thierry.reding@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Jul 31, 2014 at 5:34 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 07/31/2014 09:22 AM, Dan Carpenter wrote:
>>
>> This shoudld be ">= ARRAY_SIZE()" instead of "> ARRAY_SIZE()".
>>
>> Fixes: dc0a39386687 ('pinctrl: Add NVIDIA Tegra XUSB pad controller
>> support')
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
>
> This series looks fine to me.

I record this as an Acked-by.

> Linus, since the XUSB driver got merged through the Tegra tree, should I
> send these fixes through arm-soc on top of the driver addition patches
> (hoping to get them in before -rc1), or will you take them through the
> pinctrl tree immediately after -rc1? The latter might be simpler.

Yeah I'm carrying them.

Thanks!
Linus Walleij
