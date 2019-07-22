From: Stephen Boyd <sboyd@kernel.org>
Date: Mon, 22 Jul 2019 22:24:25 +0000
Subject: Re: [PATCH][next] clk: Si5341/Si5340: remove redundant assignment to n_den
Message-Id: <20190722222426.4980221985@mail.kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190701165020.19840-1-colin.king@canonical.com> <20190722212414.6EF8D21900@mail.kernel.org> <d1cd2b10-8fd4-f224-3bcd-5b938f72d249@wanadoo.fr> <20190722215314.9F4F121951@mail.kernel.org> <a92ca50d-b33e-8779-294c-301535d0f0d5@wanadoo.fr>
In-Reply-To: <a92ca50d-b33e-8779-294c-301535d0f0d5@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Colin King <colin.king@canonical.com>, linux-clk@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Quoting Christophe JAILLET (2019-07-22 15:00:24)
>
> I don't use it explicitly, but the suggestions I get include some git 
> history, so I guess that it is on by default.
> 
> I was thinking at parsing files to see if MODULE_AUTHOR includes an email.
> 

Ok. Feel free to write a patch. Just know that MODULE_AUTHOR isn't
always there so it's not a substitute for looking at git history or git
blame to figure out who wrote the code.

I suspect it's better to try to work on code and infrastructure to make
these sorts of patches and questions irrelevant by detecting these
problems before the code is merged, instead of after, by trawling the
mailing lists and trying to apply patches and test them for common
problems and then notifying the people working on the code. I don't have
unlimited time in my life, so getting patches like this just makes me
spend more time doing mundane tasks I don't want to do.

TL;DR: Please help automate this sort of stuff!
