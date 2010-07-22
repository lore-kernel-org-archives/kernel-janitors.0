From: David Miller <davem@davemloft.net>
Date: Thu, 22 Jul 2010 21:13:24 +0000
Subject: Re: [patch -next] stmmac: handle allocation errors in setup
Message-Id: <20100722.141324.76106225.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100722111648.GD17585@bicker>
In-Reply-To: <20100722111648.GD17585@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: peppe.cavallaro@st.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Thu, 22 Jul 2010 13:16:48 +0200

> If the allocations fail in either dwmac1000_setup() or dwmac100_setup()
> then return NULL.  These are called from stmmac_mac_device_setup().  The 
> check for NULL returns in stmmac_mac_device_setup() needed to be moved 
> forward a couple lines.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
