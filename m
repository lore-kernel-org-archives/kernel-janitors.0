From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Date: Tue, 19 May 2015 00:16:26 +0000
Subject: Re: [PATCH] regulator: max77686: fix gpio_enabled shift wrapping bug
Message-Id: <555A80DA.5030700@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150515092501.GB21508@mwanda> <5555C814.7030405@samsung.com>
 <1431968463.2870.34.camel@perches.com>
In-Reply-To: <1431968463.2870.34.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 19.05.2015 02:01, Joe Perches wrote:
> The code should handle more than 32 bits here because "id"
> can be a value up to MAX77686_REGULATORS (currently 34).
> 
> Convert the gpio_enabled type to DECLARE_BITMAP and use
> test_bit/set_bit.
> 
> Fixes: 3307e9025d29 ("regulator: max77686: Add GPIO control")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Joe Perches <joe@perches.com>

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Again - why you do not add CC-stable? If you need observational bug
effect to the commit message you can add:

<<When max77686 regulator was configured to GPIO controlled mode, the
overflow of 32 bit regulator ID could switch off completely different
regulators. This could happen because for other regulators the value of
"GPIO controlled mode" means "disabled".>>

Although I did not saw such effect of overflow in testing, it actually
should happen looking at the code.

Best regards,
Krzysztof

