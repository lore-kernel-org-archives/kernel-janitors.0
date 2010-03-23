From: David Miller <davem@davemloft.net>
Date: Tue, 23 Mar 2010 01:33:31 +0000
Subject: Re: [patch] ewrk3: range checking problem
Message-Id: <20100322.183331.45148439.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100322120728.GD21571@bicker>
In-Reply-To: <20100322120728.GD21571@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: netdev@vger.kernel.org, shemminger@vyatta.com, kaber@trash.net, jpirko@redhat.com, adobriyan@gmail.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Mon, 22 Mar 2010 15:07:28 +0300

> The range checking here is wrong.  It should be HASH_TABLE_LEN which 
> is 512.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
