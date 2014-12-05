From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 05 Dec 2014 07:25:32 +0000
Subject: Re: [patch] ipvs: uninitialized data with IP_VS_IPV6
Message-Id: <20141205072531.GA4912@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141203101213.GC29583@mwanda>
 <alpine.LFD.2.11.1412042308100.4841@ja.home.ssi.bg>
In-Reply-To: <alpine.LFD.2.11.1412042308100.4841@ja.home.ssi.bg>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julian Anastasov <ja@ssi.bg>
Cc: Wensong Zhang <wensong@linux-vs.org>, Simon Horman <horms@verge.net.au>, Pablo Neira Ayuso <pablo@netfilter.org>, Patrick McHardy <kaber@trash.net>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, lvs-devel@vger.kernel.org, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, kernel-janitors@vger.kernel.org

On Thu, Dec 04, 2014 at 11:19:34PM +0200, Julian Anastasov wrote:
> 
> 	I guess ip_vs_ftp_in() needs the same fix?

Good catch.  Thanks for noticing that.  I'll send a v2.

regards,
dan carpenter

