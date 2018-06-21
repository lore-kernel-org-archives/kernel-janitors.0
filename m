From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 21 Jun 2018 13:50:55 +0000
Subject: [bug report] netlink: have netlink per-protocol bind function return an error code.
Message-Id: <20180621135054.abihwzh2j6e46zgl@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Richard Guy Briggs,

This is a semi-automatic email about new static checker warnings.

The patch 4f520900522f: "netlink: have netlink per-protocol bind 
function return an error code." from Apr 22, 2014, leads to the 
following Smatch complaint:

    net/netlink/af_netlink.c:1056 netlink_bind()
     error: we previously assumed 'nlk->groups' could be null (see line 1049)

net/netlink/af_netlink.c
  1048	
  1049		if (!groups && (nlk->groups = NULL || !(u32)nlk->groups[0]))
                    ^^^^^^^

  1050			goto unlock;
  1051		netlink_unlock_table();
  1052	
  1053		netlink_table_grab();
  1054		netlink_update_subscriptions(sk, nlk->subscriptions +
  1055						 hweight32(groups) -
  1056						 hweight32(nlk->groups[0]));
                                                           ^^^^^^^^^^^^^^
Say groups is non-NULL and nlk->groups is NULL then this would be an
issue.  Is that possible?  I don't know why Smatch is just now suddenly
complaining about a 4 year old patch.

  1057		nlk->groups[0] = (nlk->groups[0] & ~0xffffffffUL) | groups;
  1058		netlink_update_listeners(sk);

regards,
dan carpenter
