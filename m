From: David Miller <davem@davemloft.net>
Date: Mon, 10 Jan 2011 02:13:36 +0000
Subject: Re: [patch] phonet: some signedness bugs
Message-Id: <20110109.181336.91348184.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110107203755.GB1959@bicker>
	<20110109.164548.58428218.davem@davemloft.net>
In-Reply-To: <20110109.164548.58428218.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: remi.denis-courmont@nokia.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, dan.j.rosenberg@gmail.com

From: David Miller <davem@davemloft.net>
Date: Sun, 09 Jan 2011 16:45:48 -0800 (PST)

> From: Dan Carpenter <error27@gmail.com>
> Date: Fri, 7 Jan 2011 23:37:55 +0300
> 
>> Dan Rosenberg pointed out that there were some signed comparison bugs
>> in the phonet protocol.
>> 
>> http://marc.info/?l=full-disclosure&m9424528425330&w=2
>> 
>> If you have already have CAP_SYS_ADMIN then you could use the bugs to
>> get root, or someone could cause an oops by mistake.
>> 
>> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> Applied and queued up for -stable, thanks Dan.

Actually I'm reverting this.

You can't change the prototype of pn_socket_create() because if you do
then it doesn't match up with the prototype required by
net_proto_family->create().

You didn't see this warning in your build?

net/phonet/af_phonet.c:124:2: warning: initialization from incompatible pointer type
