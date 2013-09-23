From: David Miller <davem@davemloft.net>
Date: Mon, 23 Sep 2013 21:38:37 +0000
Subject: Re: [PATCH 09/19] net: Change variable type to bool
Message-Id: <20130923.173837.1100130860877105243.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1379802471-30252-1-git-send-email-peter.senna@gmail.com>
	<1379802471-30252-9-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1379802471-30252-9-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: peter.senna@gmail.com
Cc: eilong@broadcom.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


Using the same prefix, "net: " for several patches gives no information
to the person reading the shortlog.

Use more specific subsystem prefixes, such as "bnx2x: "myri10ge: ",
"ipv6: ", etc.
