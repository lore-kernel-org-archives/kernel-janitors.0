From: David Miller <davem@davemloft.net>
Date: Sat, 02 Nov 2013 06:09:33 +0000
Subject: Re: [patch -next] bonding: bond_get_size() returns wrong size
Message-Id: <20131102.020933.1387162682618832151.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131101101844.GA29795@longonot.mountain>
In-Reply-To: <20131101101844.GA29795@longonot.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: fubar@us.ibm.com, vfalico@redhat.com, andy@greyhouse.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, jiri@resnulli.us

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 1 Nov 2013 13:18:44 +0300

> There is an extra semi-colon so bond_get_size() doesn't return the
> correct value.
> 
> Fixes: ec76aa49855f ('bonding: add Netlink support active_slave option')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks a lot Dan.
