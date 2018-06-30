From: David Miller <davem@davemloft.net>
Date: Sat, 30 Jun 2018 09:47:18 +0000
Subject: Re: [PATCH net] cnic: tidy up a size calculation
Message-Id: <20180630.184718.598532128874621636.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180628093125.6qamire66fzkv47l@kili.mountain>
In-Reply-To: <20180628093125.6qamire66fzkv47l@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: christophe.jaillet@wanadoo.fr, keescook@chromium.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 Jun 2018 12:31:25 +0300

> Static checkers complain that id_tbl->table points to longs and 4 bytes
> is smaller than sizeof(long).  But the since other side is dividing by
> 32 instead of sizeof(long), that means the current code works fine.
> 
> Anyway, it's more conventional to use the BITS_TO_LONGS() macro when
> we're allocating a bitmap.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
