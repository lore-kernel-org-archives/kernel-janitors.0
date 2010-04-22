From: Christoph Hellwig <hch@infradead.org>
Date: Thu, 22 Apr 2010 10:29:14 +0000
Subject: Re: [patch] fs/sysv: dereferencing ERR_PTR()
Message-Id: <20100422102914.GB996@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100421103032.GB29647@bicker>
In-Reply-To: <20100421103032.GB29647@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Christoph Hellwig <hch@infradead.org>, Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Apr 21, 2010 at 12:30:32PM +0200, Dan Carpenter wrote:
> I moved the dir_put_page() inside the if condition so we don't dereference
> "page", if it's an ERR_PTR().
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Looks good,


Reviewed-by: Christoph Hellwig <hch@lst.de>

