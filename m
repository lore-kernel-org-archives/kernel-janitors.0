From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 06 Nov 2019 14:25:42 +0000
Subject: Re: [PATCH -next] ptp: Fix missing unlock on error in idtcm_probe()
Message-Id: <20191106142542.GK10409@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191106115308.112645-1-weiyongjun1@huawei.com>
 <20191106140228.GA28081@renesas.com>
In-Reply-To: <20191106140228.GA28081@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vincent Cheng <vincent.cheng.xh@renesas.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, Richard Cochran <richardcochran@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

The prefix should probably be "ptp: ptp_clockmatrix: Fix missing ..." or
something.  This is a problem when we don't set a prefix when the driver
is first merged and then the first person to send a fix has to guess
what the maintainers are going to want to use.

The only other patch to this driver is commit 3a6ba7dc7799 ("ptp: Add a
ptp clock driver for IDT ClockMatrix.") so it's impossible to know.

regards,
dan carpenter
