From: Julia Lawall <julia.lawall@lip6.fr>
Date: Wed, 23 Dec 2015 07:20:43 +0000
Subject: Re: [PATCH] regulator: s2m,s5m: constify regulator_ops structures
Message-Id: <alpine.DEB.2.02.1512230819490.2081@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1450537080-17387-1-git-send-email-Julia.Lawall@lip6.fr> <20151223000043.GE16023@sirena.org.uk>
In-Reply-To: <20151223000043.GE16023@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>, kernel-janitors@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org



On Wed, 23 Dec 2015, Mark Brown wrote:

> On Sat, Dec 19, 2015 at 03:58:00PM +0100, Julia Lawall wrote:
> > The regulator_ops structures are never modified, so declare them as const.
> > 
> > Done with the help of Coccinelle.
> 
> This doesn't apply against current code, please check and resend.

It works fine for me on today's linux-next (80c75a0f1d).  What goes wrong?

julia
