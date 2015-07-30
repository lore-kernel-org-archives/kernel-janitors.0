From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Thu, 30 Jul 2015 12:26:42 +0000
Subject: Re: [patch -master] netfilter: xt_CT: checking for IS_ERR() instead of NULL
Message-Id: <20150730122642.GA3121@salvia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150727224228.GA10367@mwanda>
 <20150730115743.GA7077@salvia>
 <20150730120108.GH5096@mwanda>
In-Reply-To: <20150730120108.GH5096@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, f@salvia
Cc: Patrick McHardy <kaber@trash.net>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, "David S. Miller" <davem@davemloft.net>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jul 30, 2015 at 03:01:08PM +0300, Dan Carpenter wrote:
> On Thu, Jul 30, 2015 at 01:57:43PM +0200, Pablo Neira Ayuso wrote:
> > I have also appended this chunk, since synproxy is also affected:
> 
> Thanks.  I have rechecked my scripts and I *should* have caught that.
> I'm not sure what went wrong...

Never trust robots :-P
