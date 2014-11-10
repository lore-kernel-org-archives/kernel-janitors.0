From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Mon, 10 Nov 2014 16:11:21 +0000
Subject: Re: [patch -mainline] netfilter: ipset: small potential read beyond the end of buffer
Message-Id: <20141110161121.GA7398@salvia>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="UlVJffcvxoiEqYs2"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141107062140.GA10905@mwanda>
 <20141110142446.GA29586@salvia>
 <alpine.DEB.2.10.1411101526480.2913@blackhole.kfki.hu>
In-Reply-To: <alpine.DEB.2.10.1411101526480.2913@blackhole.kfki.hu>
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Patrick McHardy <kaber@trash.net>, "David S. Miller" <davem@davemloft.net>, Sergey Popovich <popovich_sergei@mail.ru>, Masanari Iida <standby24x7@gmail.com>, Anton Danilov <littlesmilingcloud@gmail.com>, stephen hemminger <stephen@networkplumber.org>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernddel.org, kernel-janitors@vger.kernel.org


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 10, 2014 at 03:27:51PM +0100, Jozsef Kadlecsik wrote:
> On Mon, 10 Nov 2014, Pablo Neira Ayuso wrote:
> > >From other similar code in that location, I can see Jozsef is using
> > this pattern:
> > 
> >                 if (*len != sizeof(struct ip_set_req_version)) {
> >                         ret = -EINVAL;
> >                         goto done;
> >                 }
> > 
> > I think it would be good to stick to that for consistency. Thanks.
> 
> Absolutely, yes.
> 
> Acked-by: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>

OK, then does this look fine to you? I took over Dan's patch and gave
it another spin. See it attached, thanks.

--UlVJffcvxoiEqYs2
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-netfilter-ipset-small-potential-read-beyond-the-end-.patch"

From d67bad383d4ea9dea8872e3999324ccbeb2a5815 Mon Sep 17 00:00:00 2001
From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 7 Nov 2014 09:21:40 +0300
Subject: [PATCH] netfilter: ipset: small potential read beyond the end of
 buffer

We could be reading 8 bytes into a 4 byte buffer here.  It seems
harmless but adding a check is the right thing to do and it silences a
static checker warning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
---
 net/netfilter/ipset/ip_set_core.c |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/netfilter/ipset/ip_set_core.c b/net/netfilter/ipset/ip_set_core.c
index 86f9d76..d259da3 100644
--- a/net/netfilter/ipset/ip_set_core.c
+++ b/net/netfilter/ipset/ip_set_core.c
@@ -1863,6 +1863,12 @@ ip_set_sockfn_get(struct sock *sk, int optval, void __user *user, int *len)
 	if (*op < IP_SET_OP_VERSION) {
 		/* Check the version at the beginning of operations */
 		struct ip_set_req_version *req_version = data;
+
+		if (*len < sizeof(struct ip_set_req_version)) {
+			ret = -EINVAL;
+			goto done;
+		}
+
 		if (req_version->version != IPSET_PROTOCOL) {
 			ret = -EPROTO;
 			goto done;
-- 
1.7.10.4


--UlVJffcvxoiEqYs2--
