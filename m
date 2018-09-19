From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 19 Sep 2018 12:01:18 +0000
Subject: [bug report] devlink: Add support for resource abstraction
Message-Id: <20180919120118.GA30149@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[ It's weird that I didn't send this email earlier - dan ]

Hello Arkadi Sharshevsky,

The patch d9f9b9a4d05f: "devlink: Add support for resource
abstraction" from Jan 15, 2018, leads to the following static checker
warning:

	net/core/devlink.c:2604 devlink_resource_fill()
	error: double free of 'skb'

net/core/devlink.c
  2582                  }
  2583                  i++;
  2584          }
  2585          nla_nest_end(skb, resources_attr);
  2586          genlmsg_end(skb, hdr);
  2587          if (incomplete)
  2588                  goto start_again;
  2589  send_done:
  2590          nlh = nlmsg_put(skb, info->snd_portid, info->snd_seq,
  2591                          NLMSG_DONE, 0, flags | NLM_F_MULTI);
  2592          if (!nlh) {
  2593                  err = devlink_dpipe_send_and_alloc_skb(&skb, info);
                                                               ^^^^
Smatch says that some error paths free *pskb.  This seems like a legit
thing.  Of course, kfree_skb() only really frees it after we drop
the last reference and I don't know how the refcounting works here.

  2594                  if (err)
  2595                          goto err_skb_send_alloc;
                                ^^^^^^^^^^^^^^^^^^^^^^^^
  2596                  goto send_done;
  2597          }
  2598          return genlmsg_reply(skb, info);
  2599  
  2600  nla_put_failure:
  2601          err = -EMSGSIZE;
  2602  err_resource_put:
  2603  err_skb_send_alloc:
  2604          nlmsg_free(skb);
                           ^^^
  2605          return err;
  2606  }

regards,
dan carpenter
