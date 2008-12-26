From: David Miller <davem@davemloft.net>
Date: Fri, 26 Dec 2008 02:03:52 +0000
Subject: Re: [PATCH 4/13] drivers/net/au1000_eth.c: Remove redundant test
Message-Id: <20081225.180352.13096040.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812211637180.9555@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0812211637180.9555@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: manuel.lauss@gmail.com, jgarzik@pobox.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Sun, 21 Dec 2008 16:37:36 +0100 (CET)

> phydev is checked to be not NULL a few lines above.

Applied.
