From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Apr 2018 11:19:16 +0000
Subject: [bug report] net/ipv6: separate handling of FIB entries from dst based routes
Message-Id: <20180420111916.GA18520@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello David Ahern,

This is a semi-automatic email about new static checker warnings.

The patch 93531c674315: "net/ipv6: separate handling of FIB entries 
from dst based routes" from Apr 17, 2018, leads to the following 
Smatch complaint:

    net/ipv6/route.c:2128 fib6_check()
    error: we previously assumed 'f6i' could be null (see line 2124)

net/ipv6/route.c
  2123	/*
  2124	 *	Destination cache support functions
  2125	 */
  2126	
  2127	static bool fib6_check(struct fib6_info *f6i, u32 cookie)
  2128	{
  2129		u32 rt_cookie = 0;
  2130	
  2131          if ((f6i && !rt6_get_cookie_safe(f6i, &rt_cookie)) ||
                     ^^^
Check

  2132               rt_cookie != cookie)
  2133                  return false;
  2134  
  2135          if (fib6_check_expired(f6i))
                                       ^^^
Unchecked dereference inside function.

  2136                  return false;
  2137  
  2138          return true;
  2139  }

regards,
dan carpenter
