From: David Miller <davem@davemloft.net>
Date: Tue, 11 Jan 2011 00:06:20 +0000
Subject: Re: [patch v2] phonet: some signedness bugs
Message-Id: <20110110.160620.133889003.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110107203755.GB1959@bicker>
	<201101100958.32549.remi.denis-courmont@nokia.com>
	<20110110140658.GB2721@bicker>
In-Reply-To: <20110110140658.GB2721@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: remi.denis-courmont@nokia.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, dan.j.rosenberg@gmail.com

From: Dan Carpenter <error27@gmail.com>
Date: Mon, 10 Jan 2011 17:06:58 +0300

> Dan Rosenberg pointed out that there were some signed comparison bugs
> in the phonet protocol.
> 
> http://marc.info/?l=full-disclosure&m9424528425330&w=2
> 
> The problem is that we check for array overflows but "protocol" is
> signed and we don't check for array underflows.  If you have already
> have CAP_SYS_ADMIN then you could use the bugs to get root, or someone
> could cause an oops by mistake.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
