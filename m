From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 16 Sep 2019 10:32:46 +0000
Subject: Re: ss: Checking selected network ports
Message-Id: <9153b2b5-7988-92b4-e357-b5acfe19318e@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1556674718-5081-1-git-send-email-johunt@akamai.com>
 <3d1c67c8-7dfe-905b-4548-dae23592edc5@web.de>
 <20190601.164838.1496580524715275443.davem@davemloft.net>
In-Reply-To: <20190601.164838.1496580524715275443.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>, David Ahern <dsahern@gmail.com>, Stephen Hemminger <stephen@networkplumber.org>, netdev@vger.kernel.org
Cc: Josh Hunt <johunt@akamai.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> If you use netlink operations directly, you can have the kernel filter
> on various criteria and only get the socket entries you are interested in.

I suggest to take another look at software design options.


> This whole discussion has zero to do with what text format 'ss' outputs.

Is there a need to improve the software documentation any further?

Which programming interface should be used to check the receive queue
for a single port (without retrieving more network data before)?

Regards,
Markus
