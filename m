From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Mon, 16 Feb 2004 21:28:09 +0000
Subject: Re: [Kernel-janitors] net/ipv4/fib_hash.c: check
Message-Id: <20040216132809.0606909c.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 25 Jan 2004 15:08:22 +0100 <WHarms@bfs.de>(Walter Harms) wrote:

| 
| 
| --- net/ipv4/fib_hash.c.org     2004-01-24 12:42:41.662419720 +0100
| +++ net/ipv4/fib_hash.c 2004-01-24 12:44:19.357567800 +0100
| @@ -876,6 +876,8 @@
|                                                  sizeof(struct fib_node),
|                                                  0, SLAB_HWCACHE_ALIGN,
|                                                  NULL, NULL);
| +       if(!fn_hash_kmem)
| +               return NULL;
|  
|         tb = kmalloc(sizeof(struct fib_table) + sizeof(struct fn_hash), GFP_KERNEL);
|         if (tb = NULL)
| _______________________________________________

1.  Walter, have you fixed your editor so that it doesn't convert
tabs to spaces?

2.  Please make patches so that they apply with "patch -p1"
when inside the kernel source top-level directory.

3.  In the function above, if (tb = NULL) and it returns NULL,
does fn_hash_kmem need to be freed also?  I think so...

--
~Randy
kernel-janitors project:  http://janitor.kernelnewbies.org/
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
