From: David Miller <davem@davemloft.net>
Date: Thu, 01 Mar 2012 22:24:08 +0000
Subject: Re: [patch] enic: fix an endian bug in enic_probe()
Message-Id: <20120301.172408.1182768164929080163.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120301071954.GA7152@elgon.mountain>
In-Reply-To: <20120301071954.GA7152@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: roprabhu@cisco.com, benve@cisco.com, neepatel@cisco.com, nistrive@cisco.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 1 Mar 2012 10:19:54 +0300

> "num_vfs" is a u32 but we only use the high 16 bits and the low 16bits
> are left as zero.  That isn't a problem for little endian systems but it
> will break on big endian ones.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
