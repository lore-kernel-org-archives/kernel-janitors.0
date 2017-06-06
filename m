From: David Miller <davem@davemloft.net>
Date: Tue, 06 Jun 2017 19:14:34 +0000
Subject: Re: [PATCH][V2] net: stmmac: ensure jumbo_frm error return is correctly checked for -ve value
Message-Id: <20170606.151434.1826178347509987461.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170605090452.30688-1-colin.king@canonical.com>
In-Reply-To: <20170605090452.30688-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: peppe.cavallaro@st.com, alexandre.torgue@st.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Mon,  5 Jun 2017 10:04:52 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The current comparison of entry < 0 will never be true since entry is an
> unsigned integer. Make entry an int to ensure -ve error return values
> from the call to jumbo_frm are correctly being caught.
> 
> Detected by CoverityScan, CID#1238760 ("Macro compares unsigned to 0")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

I know Julia asked for more comments, but I'm going to apply this
as-is for now as it is correct.

Thanks Colin.
