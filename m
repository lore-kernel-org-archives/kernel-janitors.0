From: David Miller <davem@davemloft.net>
Date: Mon, 04 May 2020 18:57:38 +0000
Subject: Re: [PATCH] net: stmmac: gmac5+: fix potential integer overflow on 32 bit multiply
Message-Id: <20200504.115738.1197878174801820355.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200501141016.290699-1-colin.king@canonical.com>
In-Reply-To: <20200501141016.290699-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: alexandre.torgue@st.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org

From: Colin King <colin.king@canonical.com>
Date: Fri,  1 May 2020 15:10:16 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The multiplication of cfg->ctr[1] by 1000000000 is performed using a
> 32 bit multiplication (since cfg->ctr[1] is a u32) and this can lead
> to a potential overflow. Fix this by making the constant a ULL to
> ensure a 64 bit multiply occurs.
> 
> Fixes: 504723af0d85 ("net: stmmac: Add basic EST support for GMAC5+")
> Addresses-Coverity: ("Unintentional integer overflow")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
