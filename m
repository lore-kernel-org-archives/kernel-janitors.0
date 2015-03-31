From: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 31 Mar 2015 00:47:10 +0000
Subject: Re: [patch] jffs2: remove an unneeded condition
Message-Id: <20150331004710.GH32500@ld-irv-0074>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150323093519.GB558@mwanda>
In-Reply-To: <20150323093519.GB558@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org

On Mon, Mar 23, 2015 at 12:35:19PM +0300, Dan Carpenter wrote:
> We know "rc" is set so there is no need to check again.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Pushed to l2-mtd.git.

Brian
