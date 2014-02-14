From: Jon Maloy <jon.maloy@ericsson.com>
Date: Fri, 14 Feb 2014 15:55:02 +0000
Subject: RE: [net-next:master 96/108] net/tipc/node.c:258 tipc_node_detach_link() error: buffer overflow 'n_p
Message-Id: <A2BAEFC30C8FD34388F02C9B3121859D1C1E925C@eusaamb103.ericsson.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140214082644.GY26776@mwanda>
In-Reply-To: <20140214082644.GY26776@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Thank you both for the heads-up. I'll  submit a correction patch asap.

///jon

> -----Original Message-----
> From: walter harms [mailto:wharms@bfs.de]
> Sent: February-14-14 4:53 AM
> To: Dan Carpenter
> Cc: kbuild@01.org; Jon Maloy; kernel-janitors@vger.kernel.org
> Subject: Re: [net-next:master 96/108] net/tipc/node.c:258
> tipc_node_detach_link() error: buffer overflow 'n_ptr->links' 2 <= 2
> 
> 
> 
> Am 14.02.2014 09:26, schrieb Dan Carpenter:
> > This is a style question and not a real bug:
> >
> > Which is better:
> >
> > OPTION #1: ignore static checker warnings
> >
> > 	for (i = 0; i < ARRAY_SIZE(x); i++) {
> > 		if (found)
> > 			break;
> > 	}
> > 	x[i] = 0;
> >
> >
> > OPTION #2: stop on the last element
> >
> > 	for (i = 0; i < ARRAY_SIZE(x) - 1; i++) {
> > 		if (found)
> > 			break;
> > 	}
> > 	x[i] = 0;
> >
> >
> > OPTION #3: add a bogus error test
> >
> > 	for (i = 0; i < ARRAY_SIZE(x); i++) {
> > 		if (found)
> > 			break;
> > 	}
> > 	if (i = ARRAY_SIZE(x))
> > 		return;
> > 	x[i] = 0;
> 
> OPTION #3a
> 
> for (i = 0; i < ARRAY_SIZE(x); i++) {
>  		if (found)
> 			goto found;
>  	}
>  	return;
> found:
> 	x[i] = 0;
> 
> > OPTION #4: convoluted code
> >
> > 	for (i = 0; i < ARRAY_SIZE(x); i++) {
> > 		if (!found)
> > 			continue;
> > 		x[i] = 0;
> > 		break;
> > 	}
> >
> > It's not clear to me what the right answer is...
> 
> 
> 
> i prefer a variation of #4
> 
>  if (found) { x[i] = 0; break; }
> 
> reason:
> 1. ppl are bad with (!)
> 2. it is clear what happens if found
> 3. no side effects; i=ARRAY_SIZE(x) when nothing is found in loop
>    so using x[i] may cause trouble.
> 
> Of cause there is not THE answer in cases where {} is large you need a
> different solution.
> 
> re,
>  wh
> 
> > regards,
> > dan carpenter
> >
> > -----
> >
> > Hi Jon,
> >
> > FYI, there are new smatch warnings show up in
> >
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git
> master
> > head:   d4f2fa6ad61ec1db713569a179183df4d0fc6ae7
> > commit: 7d33939f475d403e79124e3143d7951dcfe8629f [96/108] tipc: delay
> > delete of link when failover is needed
> > :::::: branch date: 5 hours ago
> > :::::: commit date: 5 hours ago
> >
> > net/tipc/node.c:258 tipc_node_detach_link() error: buffer overflow
> > 'n_ptr->links' 2 <= 2
> >
> > git remote add net-next
> > git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git
> > git remote update net-next
> > git checkout 7d33939f475d403e79124e3143d7951dcfe8629f
> > vim +258 net/tipc/node.c
> >
> > b97bf3fd Per Liden       2006-01-02  242
> > a18c4bc3 Paul Gortmaker  2011-12-29  243  void
> tipc_node_attach_link(struct tipc_node *n_ptr, struct tipc_link *l_ptr)
> > b97bf3fd Per Liden       2006-01-02  244  {
> > 37b9c08a Allan Stephens  2011-02-28  245  	n_ptr->links[l_ptr->b_ptr-
> >identity] = l_ptr;
> > 37b9c08a Allan Stephens  2011-02-28  246
> 	atomic_inc(&tipc_num_links);
> > 37b9c08a Allan Stephens  2011-02-28  247  	n_ptr->link_cnt++;
> > b97bf3fd Per Liden       2006-01-02  248  }
> > b97bf3fd Per Liden       2006-01-02  249
> > a18c4bc3 Paul Gortmaker  2011-12-29  250  void
> tipc_node_detach_link(struct tipc_node *n_ptr, struct tipc_link *l_ptr)
> > b97bf3fd Per Liden       2006-01-02  251  {
> > 7d33939f Jon Paul Maloy  2014-02-13  252  	int i;
> > 7d33939f Jon Paul Maloy  2014-02-13  253
> > 7d33939f Jon Paul Maloy  2014-02-13  254  	for (i = 0; i < MAX_BEARERS;
> i++) {
> > 7d33939f Jon Paul Maloy  2014-02-13  255  		if (l_ptr = n_ptr-
> >links[i])
> > 7d33939f Jon Paul Maloy  2014-02-13  256  			break;
> > 7d33939f Jon Paul Maloy  2014-02-13  257  	}
> > 7d33939f Jon Paul Maloy  2014-02-13 @258  	n_ptr->links[i] = NULL;
> > d1bcb115 Allan Stephens  2011-02-25  259
> 	atomic_dec(&tipc_num_links);
> > b97bf3fd Per Liden       2006-01-02  260  	n_ptr->link_cnt--;
> > b97bf3fd Per Liden       2006-01-02  261  }
> > b97bf3fd Per Liden       2006-01-02  262
> > 6c00055a David S. Miller 2008-09-02  263  static void
> node_established_contact(struct tipc_node *n_ptr)
> > b97bf3fd Per Liden       2006-01-02  264  {
> > 51a8e4de Allan Stephens  2010-12-31  265
> 	tipc_k_signal((Handler)tipc_named_node_up, n_ptr->addr);
> > c64f7a6a Jon Maloy       2012-11-16  266  	n_ptr->bclink.oos_state = 0;
> >
> > ---
> > 0-DAY kernel build testing backend              Open Source Technology Center
> > http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
> > --
> > To unsubscribe from this list: send the line "unsubscribe
> > kernel-janitors" in the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
