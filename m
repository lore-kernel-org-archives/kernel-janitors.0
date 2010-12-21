From: David Miller <davem@davemloft.net>
Date: Tue, 21 Dec 2010 18:53:30 +0000
Subject: Re: [patch -next] stmmac: unwind properly in stmmac_dvr_probe()
Message-Id: <20101221.105330.104073991.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101221073456.GG1936@bicker>
In-Reply-To: <20101221073456.GG1936@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: peppe.cavallaro@st.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Tue, 21 Dec 2010 10:34:56 +0300

> The original code had a several problems:
> *) It had potential null dereferences of "priv" and "res".
> *) It released the memory region before it was aquired.
> *) It didn't free "ndev" after it was allocated.
> *) It didn't call unregister_netdev() after calling stmmac_probe().
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Nice work, applied.

Thanks Dan.
