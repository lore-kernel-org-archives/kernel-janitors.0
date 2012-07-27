From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 27 Jul 2012 13:02:25 +0000
Subject: [next:akpm 147/308] net/sunrpc/clnt.c:720:36: sparse: dereference of noderef expression
Message-Id: <20120727130225.GA29912@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Mel,

There are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git akpm
head:   247109fa112ac912f31efc28e130ed2a0cc1764c
commit: 5bb176c86a868289d5d93d89919c3b5a339d6d20 [147/308] nfs: enable swap on NFS

All sparse warnings:

  net/sunrpc/clnt.c:1362:39: sparse: incorrect type in initializer (different address spaces)
  net/sunrpc/clnt.c:1362:39:    expected struct rpc_xprt *xprt
  net/sunrpc/clnt.c:1362:39:    got struct rpc_xprt [noderef] <asn:4>*cl_xprt
  net/sunrpc/clnt.c:1954:59: sparse: incorrect type in argument 1 (different address spaces)
  net/sunrpc/clnt.c:1954:59:    expected struct rpc_xprt *xprt
  net/sunrpc/clnt.c:1954:59:    got struct rpc_xprt [noderef] <asn:4>*cl_xprt
  net/sunrpc/clnt.c:1470:39: sparse: incorrect type in initializer (different address spaces)
  net/sunrpc/clnt.c:1470:39:    expected struct rpc_xprt *xprt
  net/sunrpc/clnt.c:1470:39:    got struct rpc_xprt [noderef] <asn:4>*cl_xprt
  net/sunrpc/clnt.c:1648:40: sparse: incorrect type in argument 1 (different address spaces)
  net/sunrpc/clnt.c:1648:40:    expected struct rpc_wait_queue *<noident>
  net/sunrpc/clnt.c:1648:40:    got struct rpc_wait_queue [noderef] <asn:4>*<noident>
  net/sunrpc/clnt.c:1748:51: sparse: incorrect type in argument 1 (different address spaces)
  net/sunrpc/clnt.c:1748:51:    expected struct rpc_xprt *xprt
  net/sunrpc/clnt.c:1748:51:    got struct rpc_xprt [noderef] <asn:4>*cl_xprt
  net/sunrpc/clnt.c:1800:59: sparse: incorrect type in argument 1 (different address spaces)
  net/sunrpc/clnt.c:1800:59:    expected struct rpc_xprt *xprt
  net/sunrpc/clnt.c:1800:59:    got struct rpc_xprt [noderef] <asn:4>*cl_xprt
  net/sunrpc/clnt.c:1564:39: sparse: incorrect type in initializer (different address spaces)
  net/sunrpc/clnt.c:1564:39:    expected struct rpc_xprt *xprt
  net/sunrpc/clnt.c:1564:39:    got struct rpc_xprt [noderef] <asn:4>*cl_xprt
  net/sunrpc/clnt.c:1968:46: sparse: incorrect type in argument 1 (different address spaces)
  net/sunrpc/clnt.c:1968:46:    expected struct rpc_xprt *xprt
  net/sunrpc/clnt.c:1968:46:    got struct rpc_xprt [noderef] <asn:4>*cl_xprt
+ net/sunrpc/clnt.c:720:36: sparse: dereference of noderef expression
  net/sunrpc/clnt.c:1851:25: sparse: context imbalance in 'call_timeout' - different lock contexts for basic block

vim +720 net/sunrpc/clnt.c
   717			atomic_inc(&clnt->cl_count);
   718			if (clnt->cl_softrtry)
   719				task->tk_flags |= RPC_TASK_SOFT;
 > 720			if (task->tk_client->cl_xprt->swapper)
   721				task->tk_flags |= RPC_TASK_SWAPPER;
   722			/* Add to the client's list of all tasks */
   723			spin_lock(&clnt->cl_lock);

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
