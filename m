From: Vinod Koul <vkoul@kernel.org>
Date: Thu, 25 Jun 2020 12:57:05 +0000
Subject: Re: [PATCH] phy: sun4i-usb: fix dereference of pointer phy0 before it is null checked
Message-Id: <20200625125655.GC6228@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200625124428.83564-1-colin.king@canonical.com>
In-Reply-To: <20200625124428.83564-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>, linux-arm-kernel@lists.infradead.org

On 25-06-20, 13:44, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently pointer phy0 is being dereferenced via the assignment of
> phy on the call to phy_get_drvdata before phy0 is null checked, this
> can lead to a null pointer dereference. Fix this by performing the
> null check on phy0 before the call to phy_get_drvdata. Also replace
> the phy0 = NULL check with the more usual !phy0 idiom.

Applied, thanks
-- 
~Vinod
