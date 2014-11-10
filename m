From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 10 Nov 2014 22:38:06 +0000
Subject: Re: [patch -mainline] netfilter: ipset: small potential read beyond the end of buffer
Message-Id: <20141110223806.GB5351@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141107062140.GA10905@mwanda>
 <20141110142446.GA29586@salvia>
 <alpine.DEB.2.10.1411101526480.2913@blackhole.kfki.hu>
 <20141110161121.GA7398@salvia>
In-Reply-To: <20141110161121.GA7398@salvia>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Patrick McHardy <kaber@trash.net>, "David S. Miller" <davem@davemloft.net>, Sergey Popovich <popovich_sergei@mail.ru>, Masanari Iida <standby24x7@gmail.com>, Anton Danilov <littlesmilingcloud@gmail.com>, stephen hemminger <stephen@networkplumber.org>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernddel.org, kernel-janitors@vger.kernel.org

On Mon, Nov 10, 2014 at 05:11:21PM +0100, Pablo Neira Ayuso wrote:

> OK, then does this look fine to you? I took over Dan's patch and gave
> it another spin. See it attached, thanks.

Looks good to me, thanks.

regards,
dan carpenter

