From: David Miller <davem@davemloft.net>
Date: Thu, 14 Apr 2016 02:43:48 +0000
Subject: Re: [PATCH net-next] net: ethernet: stmmac: GMAC4.xx: Fix TX descriptor preparation
Message-Id: <20160413.224348.277274080784977510.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1460107083-25577-1-git-send-email-alexandre.torgue@st.com>
In-Reply-To: <1460107083-25577-1-git-send-email-alexandre.torgue@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alexandre.torgue@st.com
Cc: netdev@vger.kernel.org, peppe.cavallaro@st.com, dan.carpenter@oracle.com, kernel-janitors@vger.kernel.org

From: Alexandre TORGUE <alexandre.torgue@st.com>
Date: Fri, 8 Apr 2016 11:18:03 +0200

> On GMAC4.xx each descriptor contains 2 buffers of 16KB (each).
> Initially, those 2 buffers was filled in dwmac4_rd_prepare_tx_desc but
> it is actually not needed. Indeed, stmmac driver supports frame up to
> 9000 bytes (jumbo). So only one buffer is needed.
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Alexandre TORGUE <alexandre.torgue@st.com>

Applied.
