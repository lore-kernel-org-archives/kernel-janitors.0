From: Brian Norris <computersforpeace@gmail.com>
Date: Sun, 10 Jul 2016 01:50:08 +0000
Subject: Re: [patch] mtd: silence some uninitialized variable warnings
Message-Id: <20160710015008.GA7547@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160413064234.GE8092@mwanda>
In-Reply-To: <20160413064234.GE8092@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org

On Wed, Apr 13, 2016 at 09:42:34AM +0300, Dan Carpenter wrote:
> The "tmp_retlen" variable can be uninitialized if action() fails.  It's
> harmless except for the static checker warning.  I have moved the error
> handling earlier to fix it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to l2-mtd.git
