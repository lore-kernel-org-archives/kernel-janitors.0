From: Jiri Pirko <jiri@resnulli.us>
Date: Fri, 15 May 2015 10:30:17 +0000
Subject: Re: flow_dissect: use programable dissector in skb_flow_dissect and friends
Message-Id: <20150515103017.GA8595@nanopsycho.orion>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150515095431.GA24328@mwanda>
In-Reply-To: <20150515095431.GA24328@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fri, May 15, 2015 at 11:54:31AM CEST, dan.carpenter@oracle.com wrote:
>Hello Jiri Pirko,
>
>The patch 06635a35d13d: "flow_dissect: use programable dissector in
>skb_flow_dissect and friends" from May 12, 2015, leads to the
>following static checker warning:
>
>	net/core/flow_dissector.c:283 __skb_flow_dissect()
>	info: ignoring unreachable code.
>
>net/core/flow_dissector.c
>   279  
>   280                  if (skb_flow_dissector_uses_key(flow_dissector,
>   281                                                  FLOW_DISSECTOR_KEY_IPV6_HASH_ADDRS)) {
>   282                          return true;
>                                ^^^^^^^^^^^^
>   283                          key_addrs = skb_flow_dissector_target(flow_dissector,
>   284                                                                FLOW_DISSECTOR_KEY_IPV6_HASH_ADDRS,
>   285                                                                target_container);
>   286                          key_addrs->src = hdr->srcnode;
>   287                          key_addrs->dst = 0;
>   288                  }
>   289                  return true;
>
>regards,
>dan carpenter

Will fix that.

Thanks!

