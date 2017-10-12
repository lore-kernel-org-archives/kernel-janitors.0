From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Oct 2017 21:21:13 +0000
Subject: [bug report] ipv6: replace rwlock with rcu and spinlock in fib6_table
Message-Id: <20171012212113.uybjxah2yv7erkim@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Wei Wang,

This is a semi-automatic email about new static checker warnings.

The patch 66f5d6ce53e6: "ipv6: replace rwlock with rcu and spinlock 
in fib6_table" from Oct 6, 2017, leads to the following Smatch 
complaint:

net/ipv6/ip6_fib.c:1462 fib6_locate()
	 warn: variable dereferenced before check 'fn' (see line 1459)

net/ipv6/ip6_fib.c
  1458		if (src_len) {
  1459			struct fib6_node *subtree = FIB6_SUBTREE(fn);
                                                    ^^^^^^^^^^^^^^^^
We shifted this dereference

  1460	
  1461			WARN_ON(saddr = NULL);
  1462			if (fn && subtree)
                            ^^
before the check for NULL.

  1463				fn = fib6_locate_1(subtree, saddr, src_len,
  1464						   offsetof(struct rt6_info, rt6i_src),

regards,
dan carpenter
