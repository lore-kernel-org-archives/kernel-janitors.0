From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 05 May 2020 07:52:25 +0000
Subject: Re: [PATCH] media: sun8i: Fix an error handling path in 'deinterlace_runtime_resume()'
Message-Id: <CAGb2v65PhkepV=1RzKr7bmF_iyjOEM3iu2a772uYPYhy+7Db=Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200505075034.168296-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200505075034.168296-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, kernel-janitors@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Media Mailing List <linux-media@vger.kernel.org>

On Tue, May 5, 2020 at 3:50 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> It is spurious to call 'clk_disable_unprepare()' when
> 'clk_prepare_enable()' has not been called yet.
> Re-order the error handling path to avoid it.
>
> Fixes: a4260ea49547 ("media: sun4i: Add H3 deinterlace driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Chen-Yu Tsai <wens@csie.org>
