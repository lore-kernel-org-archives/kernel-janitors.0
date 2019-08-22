From: David Miller <davem@davemloft.net>
Date: Thu, 22 Aug 2019 03:50:58 +0000
Subject: Re: [PATCH v2 net] gve: Copy and paste bug in gve_get_stats()
Message-Id: <20190821.205058.7560855985510600.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190820090053.GA24410@mwanda>
        <20190820090739.GB1845@kadam>
In-Reply-To: <20190820090739.GB1845@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: csully@google.com, sagis@google.com, jonolson@google.com, willemb@google.com, lrizzo@google.com, hslester96@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 20 Aug 2019 12:11:44 +0300

> There is a copy and paste error so we have "rx" where "tx" was intended
> in the priv->tx[] array.
> 
> Fixes: f5cedc84a30d ("gve: Add transmit and receive support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: fix a typo in the subject: buy -> bug (Thanks Walter Harms)

Applied, thanks.
