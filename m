From: David Miller <davem@davemloft.net>
Date: Sat, 15 Oct 2016 21:35:43 +0000
Subject: Re: [patch] stmmac: fix an error code in stmmac_ptp_register()
Message-Id: <20161015.173543.1886751731467613909.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161014192417.GC21917@mwanda>
In-Reply-To: <20161014192417.GC21917@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: peppe.cavallaro@st.com, alexandre.torgue@st.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Oct 2016 22:26:11 +0300

> PTR_ERR(NULL) is success.  We have to preserve the error code earlier.
> 
> Fixes: 7086605a6ab5 ("stmmac: fix error check when init ptp")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Good catch, applied.
