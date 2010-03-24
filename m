From: jamal <hadi@cyberus.ca>
Date: Wed, 24 Mar 2010 13:46:23 +0000
Subject: Re: [patch] af_key: return error if pfkey_xfrm_policy2msg_prep()
Message-Id: <1269438383.4089.15.camel@bigi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100324114700.GB21571@bicker>
In-Reply-To: <20100324114700.GB21571@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <eric.dumazet@gmail.com>, Stephen Hemminger <shemminger@vyatta.com>, Alexey Dobriyan <adobriyan@gmail.com>, kernel-janitors@vger.kernel.org

On Wed, 2010-03-24 at 14:47 +0300, Dan Carpenter wrote:
> The original code saved the error value but just returned 0 in the end.

Looks reasonable and harmless. 
If you have time - can you try this one test with your patch and see if
any strange message shows up when you delete? add a policy on window1,
on window2 run ip xfrm mon and then back on window1 delete it and watch
the event on window2

----
window2: ip xfrm mon

window1, add:
ip xfrm policy add src 172.16.2.0/24 dst 172.16.1.0/24 \
        dir fwd ptype main \
        tmpl src 192.168.2.100 dst 192.168.1.100 \
        proto esp mode tunnel


window1, delete:
ip xfrm pol del src 172.16.2.0/24 dst 172.16.1.0/24 dir fwd
----

cheers,
jamal

