From: David Miller <davem@davemloft.net>
Date: Sat, 06 Apr 2019 22:04:33 +0000
Subject: Re: [PATCH 1/2 net] NFC: nci: Add some bounds checking in nci_hci_cmd_received()
Message-Id: <20190406.150433.1815979462207649083.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190403071248.GA5758@kadam>
In-Reply-To: <20190403071248.GA5758@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: sameo@linux.intel.com, christophe.ricard@gmail.com, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, surenb@google.com

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 3 Apr 2019 10:12:48 +0300

> This is similar to commit 674d9de02aa7 ("NFC: Fix possible memory
> corruption when handling SHDLC I-Frame commands").
> 
> I'm not totally sure, but I think that commit description may have
> overstated the danger.  I was under the impression that this data came
> from the firmware?  If you can't trust your networking firmware, then
> you're already in trouble.
> 
> Anyway, these days we add bounds checking where ever we can and we call
> it kernel hardening.  Better safe than sorry.
> 
> Fixes: 11f54f228643 ("NFC: nci: Add HCI over NCI protocol support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
