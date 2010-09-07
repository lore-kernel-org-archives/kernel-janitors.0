From: David Miller <davem@davemloft.net>
Date: Tue, 07 Sep 2010 01:30:20 +0000
Subject: Re: [patch] isdn: cleanup: make buffer smaller
Message-Id: <20100906.183020.233685314.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100904183303.GN5437@bicker>
In-Reply-To: <20100904183303.GN5437@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: isdn@linux-pingi.de, tilman@imap.cc, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Sat, 4 Sep 2010 20:33:03 +0200

> This showed up in my audit because we use strcpy() to copy "ds" into a
> 32 character buffer inside the isdn_tty_dial() function.  But it turns
> out that we only ever use the first 32 characters so it's OK.  I have
> changed the declaration to make the static checkers happy.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
