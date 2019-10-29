From: David Miller <davem@davemloft.net>
Date: Tue, 29 Oct 2019 17:48:14 +0000
Subject: Re: [PATCH][next] net: aquantia: fix unintention integer overflow on left shift
Message-Id: <20191029.104814.1303198183585893748.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191025115811.20433-1-colin.king@canonical.com>
In-Reply-To: <20191025115811.20433-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: epomozov@marvell.com, igor.russkikh@aquantia.com, dmitry.bezrukov@aquantia.com, sergey.samoilenko@aquantia.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri, 25 Oct 2019 12:58:11 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Shifting the integer value 1 is evaluated using 32-bit
> arithmetic and then used in an expression that expects a 64-bit
> value, so there is potentially an integer overflow. Fix this
> by using the BIT_ULL macro to perform the shift and avoid the
> overflow.
> 
> Addresses-Coverity: ("Unintentional integer overflow")
> Fixes: 04a1839950d9 ("net: aquantia: implement data PTP datapath")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
