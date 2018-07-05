From: David Miller <davem@davemloft.net>
Date: Thu, 05 Jul 2018 10:52:29 +0000
Subject: Re: [PATCH] net: ethernet: sun: remove redundant variables adv and lpa
Message-Id: <20180705.195229.1643127099809491582.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180705093732.21650-1-colin.king@canonical.com>
        <20180705.193315.2106014813802269928.davem@davemloft.net>
        <dfecea10-87b5-2110-6efb-02f46e7b4e2c@canonical.com>
In-Reply-To: <dfecea10-87b5-2110-6efb-02f46e7b4e2c@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>
Date: Thu, 5 Jul 2018 11:50:01 +0100

> Just to clarify, just the MII_ADVERTISE and MII_LPA, or both these AND
> also MII_ESTATUS too?

I think you can safely remove all three.
