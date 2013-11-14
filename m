From: David Miller <davem@davemloft.net>
Date: Thu, 14 Nov 2013 08:10:57 +0000
Subject: Re: [PATCH] net: cdc_ncm: cleanup a type issue in cdc_ncm_setup()
Message-Id: <20131114.031057.1514427325797937478.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131113074234.GB25541@elgon.mountain>
In-Reply-To: <20131113074234.GB25541@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: oliver@neukum.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Nov 2013 10:42:34 +0300

> This is harmless but cdc_ncm_setup() returns negative error codes
> truncated to u8 values.  There is only one caller and treats all
> non-zero returns as errors but doesn't store the the return code.  So
> the code works correctly but it's messy and upsets the static checkers.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
