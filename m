From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Jan 2017 13:11:15 +0000
Subject: [bug report] xfrm: add and use xfrm_state_afinfo_get_rcu
Message-Id: <20170113131115.GA12283@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Florian Westphal,

This is a semi-automatic email about new static checker warnings.

The patch 711059b9752a: "xfrm: add and use xfrm_state_afinfo_get_rcu" 
from Jan 9, 2017, leads to the following Smatch complaint:

net/xfrm/xfrm_state.c:659 xfrm_init_tempstate()
	 error: we previously assumed 'afinfo' could be null (see line 651)

net/xfrm/xfrm_state.c
   643  static void
   644  xfrm_init_tempstate(struct xfrm_state *x, const struct flowi *fl,
   645                      const struct xfrm_tmpl *tmpl,
   646                      const xfrm_address_t *daddr, const xfrm_address_t *saddr,
   647                      unsigned short family)
   648  {
   649          struct xfrm_state_afinfo *afinfo = xfrm_state_afinfo_get_rcu(family);
   650	
   651		if (afinfo)
                    ^^^^^^
Checked.

   652			afinfo->init_tempsel(&x->sel, fl);
   653	
   654		if (family != tmpl->encap_family) {
   655			afinfo = xfrm_state_afinfo_get_rcu(tmpl->encap_family);
   656			if (!afinfo)
   657				return;
   658		}
   659		afinfo->init_temprop(x, tmpl, daddr, saddr);
                ^^^^^^^^^^^^^^^^^^^^
Dereference.  Is it possible for "family = tmpl->encap_family" and
xfrm_state_afinfo_get_rcu() to return NULL?

   660	}
   661	

regards,
dan carpenter
