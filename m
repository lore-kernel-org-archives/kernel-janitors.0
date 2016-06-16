From: Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Thu, 16 Jun 2016 11:04:23 +0000
Subject: Re: [patch] clocksource: timer-imx-gpt: make driver work again
Message-Id: <576287B7.7080401@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160616104225.GA24067@mwanda>
In-Reply-To: <20160616104225.GA24067@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 06/16/2016 12:42 PM, Dan Carpenter wrote:
> We accidentally made mxc_timer_init_dt() return unconditionally.
>
> Fixes: e93432390ec1 ('clocksource/drivers/timer-imx-gpt: Convert init fun=
ction to return error')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>

Thanks, I will merge this change with the commit e93432390ec1.

   -- Daniel

--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for AR=
M SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
