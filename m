From: Chris Metcalf <cmetcalf@mellanox.com>
Date: Mon, 24 Jul 2017 15:25:30 +0000
Subject: Re: [PATCH] tile: array underflow in setup_maxnodemem()
Message-Id: <536a0798-3fc3-61ed-f011-cf6f1b86cd0a@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170722073302.34qagmx66a6djxsi@mwanda>
In-Reply-To: <20170722073302.34qagmx66a6djxsi@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 7/22/2017 3:33 AM, Dan Carpenter wrote:
> My static checker correctly complains that we should have a lower bound
> on "node" to prevent an array underflow.
>
> Fixes: 867e359b97c9 ("arch/tile: core support for Tilera 32-bit chips.")
> Signed-off-by: Dan Carpenter<dan.carpenter@oracle.com>

Thanks, taken into the tile tree.

-- 
Chris Metcalf, Mellanox Technologies
http://www.mellanox.com

