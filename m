From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Date: Fri, 15 May 2015 10:12:12 +0000
Subject: Re: [patch] regulator: max77686: fix a shift wrapping bug
Message-Id: <CAJKOXPdVgKiDjcRfTV8FGeYeSvJ5=qx44ps+nTnF79+wOZhoQQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150515092501.GB21508@mwanda>
In-Reply-To: <20150515092501.GB21508@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

2015-05-15 18:25 GMT+09:00 Dan Carpenter <dan.carpenter@oracle.com>:
> We need to be able to handle more than 32 bits here because "id" can go
> up to MAX77686_BUCK9 (34).  ->gpio_enabled is a u64 so that's fine
> already.
>
> Fixes: 3307e9025d29 ('regulator: max77686: Add GPIO control')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Could you add "Cc: <stable@vger.kernel.org>" please?

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
