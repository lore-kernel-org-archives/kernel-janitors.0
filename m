From: David Miller <davem@davemloft.net>
Date: Wed, 13 Sep 2017 03:38:54 +0000
Subject: Re: [PATCH v2] openvswitch: Fix an error handling path in 'ovs_nla_init_match_and_action()'
Message-Id: <20170912.203854.934620252544016023.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170911195620.17931-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170911195620.17931-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: pshelar@nicira.com, xiangxia.m.yue@gmail.com, netdev@vger.kernel.org, dev@openvswitch.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 11 Sep 2017 21:56:20 +0200

> All other error handling paths in this function go through the 'error'
> label. This one should do the same.
> 
> Fixes: 9cc9a5cb176c ("datapath: Avoid using stack larger than 1024.")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
