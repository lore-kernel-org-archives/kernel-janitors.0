From: David Miller <davem@davemloft.net>
Date: Wed, 31 Jul 2013 22:04:49 +0000
Subject: Re: [patch] net_sched: info leak in atm_tc_dump_class()
Message-Id: <20130731.150449.1217293911356333498.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130730102339.GA14869@elgon.mountain>
	<20130730111820.GA1646@minipsycho.brq.redhat.com>
In-Reply-To: <20130730111820.GA1646@minipsycho.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jiri@resnulli.us
Cc: dan.carpenter@oracle.com, jhs@mojatatu.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Jiri Pirko <jiri@resnulli.us>
Date: Tue, 30 Jul 2013 13:18:20 +0200

> Tue, Jul 30, 2013 at 12:23:39PM CEST, dan.carpenter@oracle.com wrote:
>>The "pvc" struct has a hole after pvc.sap_family which is not cleared.
>>
>>Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Jiri Pirko <jiri@resnulli.us>

Applied and queued up for -stable, thanks.
