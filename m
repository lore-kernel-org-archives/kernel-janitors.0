From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Wed, 13 Nov 2013 12:29:07 +0000
Subject: Re: [patch] aio: checking for NULL instead of IS_ERR
Message-Id: <20131113122907.GA13318@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131113074940.GG25541@elgon.mountain>
In-Reply-To: <20131113074940.GG25541@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Benjamin LaHaise <bcrl@kvack.org>, linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Nov 13, 2013 at 10:49:40AM +0300, Dan Carpenter wrote:
> alloc_anon_inode() returns an ERR_PTR(), it doesn't return NULL.
> 
> Fixes: 71ad7490c1f3 ('rework aio migrate pages to use aio fs')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
