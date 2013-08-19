From: =?ISO-8859-1?Q?Svenning_S=F8rensen?= <sss@secomea.dk>
Date: Mon, 19 Aug 2013 11:59:28 +0000
Subject: Re: [PATCH 4/6] usb: musb: dsps: simplify platform_get_resource_byname/devm_ioremap_resource
Message-Id: <521208A0.5010602@secomea.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376902316-18520-1-git-send-email-Julia.Lawall@lip6.fr> <1376902316-18520-5-git-send-email-Julia.Lawall@lip6.fr> <5211FED3.4090102@secomea.dk> <alpine.DEB.2.02.1308191334340.2313@hadrien>
In-Reply-To: <alpine.DEB.2.02.1308191334340.2313@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Felipe Balbi <balbi@ti.com>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org


On 19-08-2013 13:35, Julia Lawall wrote:
>    	reg_base = devm_ioremap_resource(dev, r);
>    	if (!musb->ctrl_base)
>    		return -EINVAL;
>> Not really related to Julia's patch, apart from making it more obvious that
>> there's a bug here.
>> I believe it is reg_base that needs to be checked, right?
> Indeed, it is all backwards.  I could extend the patch, if you want.
>
I'll let Felipe decide on that, but I can't imagine any objections.
IS_ERR() is the proper test, of course :)

Svenning
