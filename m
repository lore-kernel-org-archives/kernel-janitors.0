From: Hayes Wang <hayeswang@realtek.com>
Date: Mon, 22 Sep 2014 02:30:36 +0000
Subject: RE: [patch -next] r8169: fix an if condition
Message-Id: <0835B3720019904CB8F7AA43166CEEB2525102@RTITMBSV03.realtek.com.tw>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140919104025.GA26391@mwanda>
In-Reply-To: <20140919104025.GA26391@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, nic_swsd <nic_swsd@realtek.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

 From: Dan Carpenter [mailto:dan.carpenter@oracle.com] 
> Sent: Friday, September 19, 2014 6:40 PM
[...]
> There is an extra semi-colon so __rtl8169_set_features() is 
> called every
> time.

Acked-by: Hayes Wang <hayeswang@realtek.com>