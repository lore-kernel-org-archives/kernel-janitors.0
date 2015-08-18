From: Axel Lin <axel.lin@ingics.com>
Date: Tue, 18 Aug 2015 23:59:01 +0000
Subject: Re: [patch] i2c: xgene-slimpro: dma_mapping_error() doesn't return an error code
Message-Id: <CAFRkauCLM+g5sipBbzYVYLDp819hajHXGhWRU11Te-0RmcPiEQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150818091219.GB3965@mwanda>
In-Reply-To: <20150818091219.GB3965@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Feng Kan <fkan@apm.com>, Hieu Le <hnle@apm.com>, linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org

2015-08-18 17:12 GMT+08:00 Dan Carpenter <dan.carpenter@oracle.com>:
> The dma_mapping_error() function returns true if there is an error, it
> doesn't return an error code.  We should return -ENOMEM.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Axel Lin <axel.lin@ingics.com>
