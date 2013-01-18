From: David Miller <davem@davemloft.net>
Date: Fri, 18 Jan 2013 19:35:22 +0000
Subject: Re: [patch] enic: change sprintf() to snprintf()
Message-Id: <20130118.143522.943294381617599481.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130118074618.GC31793@elgon.mountain>
In-Reply-To: <20130118074618.GC31793@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: benve@cisco.com, roprabhu@cisco.com, neepatel@cisco.com, nistrive@cisco.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 Jan 2013 10:46:18 +0300

> These are copying data into 16 char arrays.  They all specify that the
> first string can't be more than 11 characters but once you add on the
> "-rx-" and the NUL character there isn't space for the %d.
> 
> The first string is probably never going to be 11 characters, but if it
> is then let's truncate the string instead of corrupting memory.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to net-next, thanks.
