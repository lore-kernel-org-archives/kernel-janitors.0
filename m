From: Stephen Boyd <sboyd@kernel.org>
Date: Fri, 30 Nov 2018 07:13:41 +0000
Subject: Re: [PATCH -next] clk: stm32mp1: drop pointless static qualifier in stm32_register_hw_clk()
Message-Id: <154356202192.88331.9059182727616559057@swboyd.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1542281788-129746-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1542281788-129746-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, YueHaibing <yuehaibing@huawei.com>
Cc: kernel-janitors@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Quoting YueHaibing (2018-11-15 03:36:28)
> There is no need to have the 'struct clk_hw **hws' variable static
> since new value always be assigned before use it.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---

Applied to clk-next
