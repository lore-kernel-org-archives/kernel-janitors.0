From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Tue, 24 Feb 2004 21:53:59 +0000
Subject: Re: [Kernel-janitors] Re: 2.6.1: net/ipv4/fib_hash.c: check
Message-Id: <20040224135359.063837fa.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040217095525.GD29263@conectiva.com.br>
In-Reply-To: <20040217095525.GD29263@conectiva.com.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 20 Feb 2004 00:02:13 +0100 Francois Romieu wrote:

| Walter Harms <WHarms@bfs.de> :
| [...]
| > nice idea to turn the problem on its head. I would prefer a
| > if (!tb)
| >    return NULL;
| > instead a goto (as opposed to acme) i dont like goto's if called only once :)
| 
| It is called twice to have a single return point in the function.
| 
| We do not want to cross the streams, do we ?

Hm, well, ok .... I've just reviewed 15 emails about ipv4/fib_hash.c,
and (sadly ?) I've come to the conclusion that Walter's very first
patch (at least first that I see now) is the best one I've seen for
this.  However, I'm probably missing something, so tell me what/why...

--
~Randy


Walter's first patch for ipv4/fib_hash.c:

--- net/ipv4/fib_hash.c.org     2004-01-24 12:42:41.662419720 +0100
+++ net/ipv4/fib_hash.c 2004-01-24 12:44:19.357567800 +0100
@@ -876,6 +876,8 @@
                                                 sizeof(struct fib_node),
                                                 0, SLAB_HWCACHE_ALIGN,
                                                 NULL, NULL);
+       if (!fn_hash_kmem)
+               return NULL;
 
        tb = kmalloc(sizeof(struct fib_table) + sizeof(struct fn_hash), GFP_KERNEL);
        if (tb = NULL)
_______________________________________________
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
