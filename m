From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Date: Sat, 16 May 2015 00:27:09 +0000
Subject: Re: [patch] regulator: max77686: fix a shift wrapping bug
Message-Id: <CAJKOXPd3aTSt2t4EmDj2guSnX5qS21exUM84FmKKoGsxa0vZ2A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150515092501.GB21508@mwanda>
	<5555C814.7030405@samsung.com>
	<1431709826.15709.15.camel@perches.com>
In-Reply-To: <1431709826.15709.15.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

2015-05-16 2:10 GMT+09:00 Joe Perches <joe@perches.com>:
> On Fri, 2015-05-15 at 19:19 +0900, Chanwoo Choi wrote:
>> On 05/15/2015 06:25 PM, Dan Carpenter wrote:
>> > We need to be able to handle more than 32 bits here because "id" can go
>> > up to MAX77686_BUCK9 (34).  ->gpio_enabled is a u64 so that's fine
>> > already.
>> >
>> > Fixes: 3307e9025d29 ('regulator: max77686: Add GPIO control')
>> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Alternate suggested patch below:
>
>> > diff --git a/drivers/regulator/max77686.c b/drivers/regulator/max77686.c
> []
>> > @@ -121,7 +121,7 @@ static unsigned int max77686_map_normal_mode(struct max77686_data *max77686,
>> > -           if (max77686->gpio_enabled & (1 << id))
>> > +           if (max77686->gpio_enabled & (1ULL << id))
> []
>> > @@ -277,7 +277,7 @@ static int max77686_of_parse_cb(struct device_node *np,
>> >     if (gpio_is_valid(config->ena_gpio)) {
>> > -           max77686->gpio_enabled |= (1 << desc->id);
>> > +           max77686->gpio_enabled |= (1ULL << desc->id);
> []
>> Looks good to me.
>> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
>
> This could be better with DECLARE_BITMAP and test_bit/set_bit

Yes, this looks better - it clearly shows the purpose of
"gpio_enabled" member. Joe or Dan, can you resend with new solution
and respective tags? (Cc stable, reported-by Dan if patch comes from
Joe)

Anyway my reviewed-by may stay on for both solutions.

Thanks,
Krzysztof
