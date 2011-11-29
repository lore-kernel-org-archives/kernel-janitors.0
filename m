From: David Miller <davem@davemloft.net>
Date: Tue, 29 Nov 2011 23:40:00 +0000
Subject: Re: [patch v2] isdn: make sure strings are null terminated
Message-Id: <20111129.184000.916136138216921151.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111123064204.GA6871@elgon.mountain>
	<1322031811.1298.38.camel@edumazet-laptop>
	<20111124124149.GH3195@mwanda>
In-Reply-To: <20111124124149.GH3195@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: eric.dumazet@gmail.com, isdn@linux-pingi.de, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Nov 2011 15:41:49 +0300

> These strings come from the user.  We strcpy() them inside
> cf_command() so we should check that they are NULL terminated and
> return an error if not.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: use strnlen() instead of strlen().

Applied.
