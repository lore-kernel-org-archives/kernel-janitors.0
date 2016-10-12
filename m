From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Oct 2016 06:10:11 +0000
Subject: [bug report] rxrpc: Add some additional call tracing
Message-Id: <20161012061011.GH12841@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello David Howells,

The patch a84a46d73050: "rxrpc: Add some additional call tracing"
from Sep 17, 2016, leads to the following static checker warning:

	net/rxrpc/call_object.c:279 rxrpc_new_client_call()
	warn: passing zero to 'ERR_PTR'

net/rxrpc/call_object.c
   270  
   271          /* Set up or get a connection record and set the protocol parameters,
   272           * including channel number and call ID.
   273           */
   274          ret = rxrpc_connect_call(call, cp, srx, gfp);
   275          if (ret < 0)
   276                  goto error;
   277  
   278          trace_rxrpc_call(call, rxrpc_call_connected, atomic_read(&call->usage),
   279                           here, ERR_PTR(ret));
                                       ^^^^^^^^^^^^
Pointless.

   280  

regards,
dan carpenter
