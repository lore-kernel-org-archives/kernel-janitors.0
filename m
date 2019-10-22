From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 22 Oct 2019 06:00:49 +0000
Subject: Re: [RFC] ss: Checking selected network ports
Message-Id: <93483314-22eb-0ed6-70b3-044e6e007a34@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190601.164838.1496580524715275443.davem@davemloft.net>
In-Reply-To: <20190601.164838.1496580524715275443.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, David Ahern <dsahern@gmail.com>, David Miller <davem@davemloft.net>, Josh Hunt <johunt@akamai.com>, Stephen Hemminger <stephen@networkplumber.org>

> If you use netlink operations directly, you can have the kernel filter
> on various criteria and only get the socket entries you are interested in.

Do any developers care to take another look at current software design options?


> This whole discussion has zero to do with what text format 'ss' outputs.

Is there a need to improve the software documentation any further?

Which programming interface should be used to check the receive queue
for a single port (without retrieving more network data before)?

Regards,
Markus
