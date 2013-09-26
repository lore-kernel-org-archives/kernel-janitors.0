From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 26 Sep 2013 21:07:03 +0000
Subject: Re: [patch] mwifiex: potential integer underflow in mwifiex_ret_wmm_get_status()
Message-Id: <20130926210703.GE6247@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130925085729.GC6661@elgon.mountain>
 <477F20668A386D41ADCC57781B1F70430F45077CDA@SC-VEXCH1.marvell.com>
 <20130925182359.GV6247@mwanda>
 <477F20668A386D41ADCC57781B1F70430F45077E52@SC-VEXCH1.marvell.com>
 <477F20668A386D41ADCC57781B1F70430F45078155@SC-VEXCH1.marvell.com>
In-Reply-To: <477F20668A386D41ADCC57781B1F70430F45078155@SC-VEXCH1.marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bing Zhao <bzhao@marvell.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

There are several other similar functions as well.  For example, the
while loops in mwifiex_ret_tx_rate_cfg() and mwifiex_get_power_level().

regards,
dan carpenter
