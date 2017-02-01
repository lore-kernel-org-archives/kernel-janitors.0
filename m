From: David Miller <davem@davemloft.net>
Date: Wed, 01 Feb 2017 17:31:02 +0000
Subject: Re: [patch] ipv6: pointer math error in ip6_tnl_parse_tlv_enc_lim()
Message-Id: <20170201.123102.237978601616140108.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170201084632.GA29912@mwanda>
In-Reply-To: <20170201084632.GA29912@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: edumazet@google.com, kuznet@ms2.inr.ac.ru, jmorris@namei.org, yoshfuji@linux-ipv6.org, kaber@trash.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 1 Feb 2017 11:46:32 +0300

> Casting is a high precedence operation but "off" and "i" are in terms of
> bytes so we need to have some parenthesis here.
> 
> Fixes: fbfa743a9d2a ("ipv6: fix ip6_tnl_parse_tlv_enc_lim()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
