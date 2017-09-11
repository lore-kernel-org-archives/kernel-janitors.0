From: David Miller <davem@davemloft.net>
Date: Mon, 11 Sep 2017 19:34:16 +0000
Subject: Re: [PATCH] datapath: Fix an error handling path in 'ovs_nla_init_match_and_action()'
Message-Id: <20170911.123416.2215251870720556239.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170911192015.17553-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170911192015.17553-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: pshelar@nicira.com, xiangxia.m.yue@gmail.com, netdev@vger.kernel.org, dev@openvswitch.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


Please use a proper Subject subsystem prefix for openvswitch patches.
"datapath" isn't very specific in the global kernel namespace at all.

The entire networking stack packet processing path is a "datapath"

"openvswitch: " would have been much better.
