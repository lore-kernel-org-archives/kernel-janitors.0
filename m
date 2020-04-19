From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 19 Apr 2020 17:09:14 +0000
Subject: Re: [PATCH v1 1/2] regmap: redefined regmap_read_poll_timeout to simplify code
Message-Id: <3376dcba-4285-c894-915e-2f41cbf23caa@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dejin Zheng <zhengdejin5@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> use read_poll_timeout macro to redefined regmap_read_poll_timeout
> and also remove the duplicate code.

How do you think about a wording variant like the following?

   Subject:
   [PATCH 1/2] regmap: Simplify implementation of the regmap_read_poll_timeout() macro

   Change description:
   Simplify the implementation of the macro “regmap_read_poll_timeout”
   by using the macro “read_poll_timeout”.


…
> +++ b/include/linux/regmap.h
…
> @@ -122,26 +123,10 @@ struct reg_sequence {
>   */
>  #define regmap_read_poll_timeout(map, addr, val, cond, sleep_us, timeout_us) \
>  ({ \
…
> +	int __ret, __tmp; \
> +	__tmp = read_poll_timeout(regmap_read, __ret, __ret || (cond), \
> +			sleep_us, timeout_us, false, (map), (addr), &(val)); \
> +	__ret ?: __tmp; \
>  })

* Can this macro work also with variable names which do not contain
  double underscores?

* Can the tag “Fixes” be relevant for such an adjustment?

Regards,
Markus
