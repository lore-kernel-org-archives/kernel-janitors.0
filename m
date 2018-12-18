From: David Miller <davem@davemloft.net>
Date: Tue, 18 Dec 2018 23:50:29 +0000
Subject: Re: [PATCH net] net: stmmac: Fix an error code in probe()
Message-Id: <20181218.155029.2167821582989659697.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181217080606.GA21139@kadam>
In-Reply-To: <20181217080606.GA21139@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: peppe.cavallaro@st.com, Jose.Abreu@synopsys.com, alexandre.torgue@st.com, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 17 Dec 2018 11:06:06 +0300

> The function should return an error if create_singlethread_workqueue()
> fails.
> 
> Fixes: 34877a15f787 ("net: stmmac: Rework and fix TX Timeout code")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
