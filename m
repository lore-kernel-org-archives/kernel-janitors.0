From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 15 Jan 2014 10:14:01 +0000
Subject: Re: [patch] Staging: vt6655-6: potential NULL dereference in hostap_disable_hostapd()
Message-Id: <20140115101401.GO7444@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131107075543.GM21844@elgon.mountain>
In-Reply-To: <20131107075543.GM21844@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch was merged a long time ago, but we still could change
free_netdev() as well.  I say go for it!

regards,
dan carpenter

