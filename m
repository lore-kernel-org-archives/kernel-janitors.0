From: David Miller <davem@davemloft.net>
Date: Wed, 13 Nov 2019 22:38:30 +0000
Subject: Re: [PATCH net] net: cdc_ncm: Signedness bug in cdc_ncm_set_dgram_size()
Message-Id: <20191113.143830.141205006149266294.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191113182831.yjbmhwacirh6kgzr@kili.mountain>
In-Reply-To: <20191113182831.yjbmhwacirh6kgzr@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: oliver@neukum.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Nov 2019 21:28:31 +0300

> This code is supposed to test for negative error codes and partial
> reads, but because sizeof() is size_t (unsigned) type then negative
> error codes are type promoted to high positive values and the condition
> doesn't work as expected.
> 
> Fixes: 332f989a3b00 ("CDC-NCM: handle incomplete transfer of MTU")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
