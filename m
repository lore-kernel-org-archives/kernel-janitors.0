From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 31 Aug 2016 17:43:15 +0000
Subject: Re: [PATCH] rtc: constify rtc_class_ops structures
Message-Id: <20160831174315.4djfepwsrxmuhp56@tarshish>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1472630725-25465-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1472630725-25465-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Hi Julia,

On Wed, Aug 31, 2016 at 10:05:25AM +0200, Julia Lawall wrote:
> Check for rtc_class_ops structures that are only passed to
> devm_rtc_device_register, rtc_device_register,
> platform_device_register_data, all of which declare the corresponding
> parameter as const.  Declare rtc_class_ops structures that have these
> properties as const.

[...]

> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

For rtc-digicolor.c:

Acked-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
