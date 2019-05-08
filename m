From: David Miller <davem@davemloft.net>
Date: Wed, 08 May 2019 20:13:57 +0000
Subject: Re: [PATCH][V3] net: dsa: sja1105: fix check on while loop exit
Message-Id: <20190508.131357.1972863276402672227.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190508133041.14435-1-colin.king@canonical.com>
In-Reply-To: <20190508133041.14435-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: olteanv@gmail.com, andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed,  8 May 2019 14:30:41 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The while-loop exit condition check is not correct; the
> loop should continue if the returns from the function calls are
> negative or the CRC status returns are invalid.  Currently it
> is ignoring the returns from the function calls.  Fix this by
> removing the status return checks and only break from the loop
> at the very end when we know that all the success condtions have
> been met.
> 
> Kudos to Dan Carpenter for describing the correct fix and
> Vladimir Oltean for noting the change to the check on the number
> of retries.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: 8aa9ebccae87 ("net: dsa: Introduce driver for NXP SJA1105 5-port L2 switch")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Tested-by: Vladimir Oltean <olteanv@gmail.com>

Applied, thank you.
