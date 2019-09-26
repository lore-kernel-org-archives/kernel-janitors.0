From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 26 Sep 2019 17:51:20 +0000
Subject: Re: [PATCH net] net: stmmac: dwmac-meson8b: Fix signedness bug in probe
Message-Id: <CAFBinCDZRkJJa_PnM5aAzG=pZkf15jB2gLDRkCqA5BwHMvM+Mg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925105822.GH3264@mwanda>
In-Reply-To: <20190925105822.GH3264@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>, Kevin Hilman <khilman@baylibre.com>, kernel-janitors@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-amlogic@lists.infradead.org, "David S. Miller" <davem@davemloft.net>

+Cc linux-amlogic mailing list

On Wed, Sep 25, 2019 at 12:59 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The "dwmac->phy_mode" is an enum and in this context GCC treats it as
> an unsigned int so the error handling is never triggered.
>
> Fixes: 566e82516253 ("net: stmmac: add a glue driver for the Amlogic Meson 8b / GXBB DWMAC")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

thank you for catching and fixing this!


Martin
