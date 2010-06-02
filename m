From: Roland Dreier <rdreier@cisco.com>
Date: Wed, 02 Jun 2010 21:56:44 +0000
Subject: Re: [patch 1/2] infiniband/cxgb4: remove unneeded assignment
Message-Id: <adaiq61qesj.fsf@roland-alpha.cisco.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100531140053.GT5483@bicker>
In-Reply-To: <20100531140053.GT5483@bicker> (Dan Carpenter's message of "Mon,
	31 May 2010 16:00:53 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Steve Wise <swise-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org>, Roland Dreier <rolandd-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Looks fine to me... in fact I don't see how this could have avoided a
NULL deref here unless the compiler is already optimizing out this
assignment, since two lines above is

 	struct sk_buff *skb = NULL;

before we do

-	struct cpl_act_establish *rpl = cplhdr(skb);

Steve?
-- 
Roland Dreier <rolandd@cisco.com> || For corporate legal information go to:
http://www.cisco.com/web/about/doing_business/legal/cri/index.html
