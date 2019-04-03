From: Al Viro <viro@zeniv.linux.org.uk>
Date: Wed, 03 Apr 2019 16:46:52 +0000
Subject: Re: [PATCH] aio: Fix an error code in __io_submit_one()
Message-Id: <20190403164652.GP2217@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190403062235.GA1343@kadam>
In-Reply-To: <20190403062235.GA1343@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Apr 03, 2019 at 09:22:35AM +0300, Dan Carpenter wrote:
> This accidentally returns the wrong variable.  The "req->ki_eventfd"
> pointer is NULL so this return success.

Applied.
