From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 16 Feb 2017 20:11:27 +0000
Subject: [bug report] net: Prepare gro for packet consuming gro callbacks
Message-Id: <20170216201127.GA11170@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Steffen Klassert,

The patch 25393d3fc055: "net: Prepare gro for packet consuming gro
callbacks" from Feb 15, 2017, leads to the following Smatch
warning:

	net/core/dev.c:4522 dev_gro_receive()
	error: 'pp' dereferencing possible ERR_PTR()

net/core/dev.c
  4510          if (&ptype->list = head)
  4511                  goto normal;
  4512  
  4513          if (IS_ERR(pp) && PTR_ERR(pp) = -EINPROGRESS) {


Smatch sees this and assumes that it's possible for "pp" to be an error
pointer that's not -EINPROGRESS.


  4514                  ret = GRO_CONSUMED;
  4515                  goto ok;
  4516          }
  4517  
  4518          same_flow = NAPI_GRO_CB(skb)->same_flow;
  4519          ret = NAPI_GRO_CB(skb)->free ? GRO_MERGED_FREE : GRO_MERGED;
  4520  
  4521          if (pp) {
  4522                  struct sk_buff *nskb = *pp;
                                               ^^^
Leading to an oops.

  4523  
  4524                  *pp = nskb->next;
  4525                  nskb->next = NULL;
  4526                  napi_gro_complete(nskb);
  4527                  napi->gro_count--;
  4528          }

regards,
dan carpenter
