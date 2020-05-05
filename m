From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 05 May 2020 08:15:05 +0000
Subject: Re: [PATCH] media: sun8i: Fix an error handling path in deinterlace_runtime_resume()
Message-Id: <75dd05b8-7895-e1cf-2c76-2327aa11f033@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200505075034.168296-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200505075034.168296-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Jernej Skrabec <jernej.skrabec@siol.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>

> It is spurious to call 'clk_disable_unprepare()' when
> 'clk_prepare_enable()' has not been called yet.

Can it be that the usage of the word “suspicious” would be more appropriate
for such a change description?


> Re-order the error handling path to avoid it.

Would it be also helpful to explicitly mention in the commit message
that you would like to move a call of the function “clk_rate_exclusive_put”
to the end of this function implementation for the correction
of the desired exception handling?

Regards,
Markus
