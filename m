From: Jiri Pirko <jiri@resnulli.us>
Date: Tue, 30 Jul 2013 11:18:20 +0000
Subject: Re: [patch] net_sched: info leak in atm_tc_dump_class()
Message-Id: <20130730111820.GA1646@minipsycho.brq.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130730102339.GA14869@elgon.mountain>
In-Reply-To: <20130730102339.GA14869@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Tue, Jul 30, 2013 at 12:23:39PM CEST, dan.carpenter@oracle.com wrote:
>The "pvc" struct has a hole after pvc.sap_family which is not cleared.
>
>Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Jiri Pirko <jiri@resnulli.us>
