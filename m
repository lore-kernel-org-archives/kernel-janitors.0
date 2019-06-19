From: David Miller <davem@davemloft.net>
Date: Wed, 19 Jun 2019 01:04:30 +0000
Subject: Re: [PATCH] net: stmmac: add sanity check to device_property_read_u32_array call
Message-Id: <20190618.210430.1199248693691754077.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190617165836.4673-1-colin.king@canonical.com>
In-Reply-To: <20190617165836.4673-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: alexandre.torgue@st.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org

From: Colin King <colin.king@canonical.com>
Date: Mon, 17 Jun 2019 17:58:36 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the call to device_property_read_u32_array is not error checked
> leading to potential garbage values in the delays array that are then used
> in msleep delays.  Add a sanity check to the property fetching.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next, thanks Colin.

Please make the destination tree explicit in the future by putting
something like "[PATCH net-next]" in the Subject line.

Thank you.
