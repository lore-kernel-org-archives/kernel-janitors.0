From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 20 Apr 2020 14:35:37 +0000
Subject: Re: [PATCH v2 1/2] regmap: Simplify implementation of the regmap_read_poll_timeout() macro
Message-Id: <81379fcd-0ee4-069c-542d-7843ba34867b@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200420134647.9121-1-zhengdejin5@gmail.com>
 <20200420134647.9121-2-zhengdejin5@gmail.com>
In-Reply-To: <20200420134647.9121-2-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dejin Zheng <zhengdejin5@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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

* Would you like to delete double underscores from these variable names?

* I find another implementation detail suspicious.
  Should the parameters “sleep_us” and “timeout_us” be enclosed by
  additional parentheses (similar to four other macro arguments)?

* Can the tag “Fixes” be relevant also for such adjustments?

Regards,
Markus
