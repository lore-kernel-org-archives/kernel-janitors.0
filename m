From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 27 Jun 2018 13:32:11 +0000
Subject: [bug report] xfrm: Add virtual xfrm interfaces
Message-Id: <20180627133211.pzidhbi55hbku2ug@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Steffen Klassert,

This is a semi-automatic email about new static checker warnings.

The patch f203b76d7809: "xfrm: Add virtual xfrm interfaces" from Jun
12, 2018, leads to the following Smatch complaint:

    net/xfrm/xfrm_interface.c:248 xfrmi_rcv_cb()
    error: we previously assumed 'skb->sp' could be null (see line 245)

net/xfrm/xfrm_interface.c
   244	
   245		if (err && !skb->sp)
                    ^^^^^^^^^^^^^^^
Can skb->sp be NULL when err is zero?  If not then we could just write

		if (!skb->sp)
			return 0;

   246			return 0;
   247	
   248		x = xfrm_input_state(skb);
                                     ^^^
Dereferenced inside the function.

   249	
   250		xi = xfrmi_lookup(xs_net(x), x);

regards,
dan carpenter
