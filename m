From: Pieter Jansen van Vuuren <pieter.jansenvanvuuren@netronome.com>
Date: Wed, 08 May 2019 08:53:53 +0000
Subject: Re: [bug report] net/sched: use the hardware intermediate representation for matchall
Message-Id: <34551f9c-279e-abe7-8843-0b68be563c07@netronome.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190508071704.GA11889@mwanda>
In-Reply-To: <20190508071704.GA11889@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 08/05/2019 09:19, Dan Carpenter wrote:
> On Wed, May 08, 2019 at 08:41:13AM +0100, Pieter Jansen van Vuuren wrote:
>> On 08/05/2019 08:17, Dan Carpenter wrote:
>>> Hello Pieter Jansen van Vuuren,
>>>
>>> The patch f00cbf196814: "net/sched: use the hardware intermediate
>>> representation for matchall" from May 4, 2019, leads to the following
>>> static checker warning:
>>>
>>> 	net/sched/cls_matchall.c:317 mall_reoffload()
>>> 	error: double free of 'cls_mall.rule'
>>>
>>> net/sched/cls_matchall.c
>>>    286  static int mall_reoffload(struct tcf_proto *tp, bool add, tc_setup_cb_t *cb,
>>>    287                            void *cb_priv, struct netlink_ext_ack *extack)
>>>    288  {
>>>    289          struct cls_mall_head *head = rtnl_dereference(tp->root);
>>>    290          struct tc_cls_matchall_offload cls_mall = {};
>>>    291          struct tcf_block *block = tp->chain->block;
>>>    292          int err;
>>>    293  
>>>    294          if (tc_skip_hw(head->flags))
>>>    295                  return 0;
>>>    296  
>>>    297          cls_mall.rule = flow_rule_alloc(tcf_exts_num_actions(&head->exts));
>>>    298          if (!cls_mall.rule)
>>>    299                  return -ENOMEM;
>>>    300  
>>>    301          tc_cls_common_offload_init(&cls_mall.common, tp, head->flags, block,
>>>    302                                     extack);
>>>    303          cls_mall.command = add ?
>>>    304                  TC_CLSMATCHALL_REPLACE : TC_CLSMATCHALL_DESTROY;
>>>    305          cls_mall.cookie = (unsigned long)head;
>>>    306  
>>>    307          err = tc_setup_flow_action(&cls_mall.rule->action, &head->exts);
>>>    308          if (err) {
>>>    309                  kfree(cls_mall.rule);
>>>                         ^^^^^^^^^^^^^^^^^^^
>>>    310                  if (add && tc_skip_sw(head->flags)) {
>>>    311                          NL_SET_ERR_MSG_MOD(extack, "Failed to setup flow action");
>>>    312                          return err;
>>>    313                  }
>>>
>>> My guess is that there should be a "return err;" here?
>>
>> Thank you. Yes, I think this should be "return 0;" instead of "return err;"
> 
> You would know the code better, than I.  :)
> 
> Could you send a patch to Dave?  The merge window is open but he still
> accepts bug fixes.
> 
> regards,
> dan carpenter
> 

Will do. And thank you again.
