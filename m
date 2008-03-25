From: Julia Lawall <julia@diku.dk>
Date: Tue, 25 Mar 2008 08:55:38 +0000
Subject: useless variable initializations
Message-Id: <Pine.LNX.4.64.0803250951380.22289@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Is there any policy about useless variable intializations, such as:

struct foo *x = NULL;
...
x = kmalloc(...);

where the original value of x is never used?


Another example is (fs/nfs/client.c):

struct rpc_clnt *clnt = NULL;
...
clnt = rpc_create(&args);

This could actually be slightly misleading, because rpc_create returns 
either a valid pointer or a value created with ERR_PTR, never NULL, so 
NULL is not really in the set of reasonable values for clnt.

julia

