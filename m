From: David Miller <davem@davemloft.net>
Date: Sat, 17 Mar 2012 05:23:52 +0000
Subject: Re: [PATCH 3/3 v3] netxen: qlogic ethernet : Fix endian bug.
Message-Id: <20120316.222352.1067507516750800594.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331629104-3283-1-git-send-email-santoshprasadnayak@gmail.com>
In-Reply-To: <1331629104-3283-1-git-send-email-santoshprasadnayak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: santoshprasadnayak@gmail.com
Cc: sony.chacko@qlogic.com, rajesh.borundia@qlogic.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: santosh nayak <santoshprasadnayak@gmail.com>
Date: Tue, 13 Mar 2012 14:28:24 +0530

> From: Santosh Nayak <santoshprasadnayak@gmail.com>
> 
> Change the datatype of "ip_addr" to __be32 as 'ip' should be in
> big endian format.
> 
> Adapter needs "ip address" in big endian format stored at lower 32bit
> of req.word[1]. netxen_config_ipaddr() now receives 'ip' in big endian
> format. To satisfy adapter's need, use memcpy() to copy byte by byte
> of 'ip' into lower 32bit of req.word[1].
> 
> Mac address and serial number of adapter need to be in little endian format.
> Change the data type of the related  variables to __le32 / __le64 or cast it
> explicitly to __le32 / __le64 depending upon the requirement.
> 
> Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>

Applied.
