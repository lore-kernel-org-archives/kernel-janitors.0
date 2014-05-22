From: David Miller <davem@davemloft.net>
Date: Thu, 22 May 2014 19:53:31 +0000
Subject: Re: [patch] net: cdc_ncm: fix typo in test for supported formats
Message-Id: <20140522.155331.410747192737674451.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140522075229.GA4346@mwanda>
In-Reply-To: <20140522075229.GA4346@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: oliver@neukum.org, bjorn@mork.no, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 May 2014 10:52:29 +0300

> There is a typo here where we test for USB_CDC_NCM_NTH32_SIGN instead
> of USB_CDC_NCM_NTB32_SUPPORTED.  The test probably still works as
> written because 0x686D636E has (1 << 1) set and doesn't have (1 << 0)
> set.
> 
> Fixes: f8afb73da375 ('net: cdc_ncm: factor out one-time device initialization')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to net-next, thanks.
