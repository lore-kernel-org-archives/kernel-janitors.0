From: David Miller <davem@davemloft.net>
Date: Fri, 15 May 2015 02:36:46 +0000
Subject: Re: [PATCH net-next] netns: fix unbalanced spin_lock on error
Message-Id: <20150514.223646.1372201078149333495.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <55533771.6080406@6wind.com>
	<1431517389-19937-1-git-send-email-nicolas.dichtel@6wind.com>
In-Reply-To: <1431517389-19937-1-git-send-email-nicolas.dichtel@6wind.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: nicolas.dichtel@6wind.com
Cc: dan.carpenter@oracle.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Date: Wed, 13 May 2015 13:43:09 +0200

> Unlock was missing on error path.
> 
> Fixes: 95f38411df05 ("netns: use a spin_lock to protect nsid management")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>

Applied.
