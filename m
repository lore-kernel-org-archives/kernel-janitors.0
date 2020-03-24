From: David Miller <davem@davemloft.net>
Date: Tue, 24 Mar 2020 04:05:58 +0000
Subject: Re: [PATCH net] NFC: fdp: Fix a signedness bug in fdp_nci_send_patch()
Message-Id: <20200323.210558.579490999359919534.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200320132117.GA95012@mwanda>
In-Reply-To: <20200320132117.GA95012@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: kstewart@linuxfoundation.org, robert.dolca@intel.com, gregkh@linuxfoundation.org, gustavo@embeddedor.com, sameo@linux.intel.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Mar 2020 16:21:17 +0300

> The nci_conn_max_data_pkt_payload_size() function sometimes returns
> -EPROTO so "max_size" needs to be signed for the error handling to
> work.  We can make "payload_size" an int as well.
> 
> Fixes: a06347c04c13 ("NFC: Add Intel Fields Peak NFC solution driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied and queued up for -stable, thanks Dan.
