From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 24 Apr 2015 12:04:53 +0000
Subject: Re: [PATCH] fs/compat: remove redundant 'less than zero' check
Message-Id: <20150424120453.GO14154@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1429870070-30310-1-git-send-email-firogm@gmail.com>
In-Reply-To: <1429870070-30310-1-git-send-email-firogm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Firo Yang <firogm@gmail.com>
Cc: viro@zeniv.linux.org.uk, kernel-janitors@vger.kernel.org, linux-fsdevel@vger.kernel.org

On Fri, Apr 24, 2015 at 06:07:50PM +0800, Firo Yang wrote:

> -	if (nr_segs > UIO_MAXIOV || nr_segs < 0)
> +	if (nr_segs > UIO_MAXIOV)

Linus said at kernel summit that he thinks this kind of checks are ok.

Smatch already ignores checks like:

	if (nr_segs < 0 || nr_segs > UIO_MAXIOV)

So making it ignore this one as well shouldn't be hard...  I'll change
Smatch to ignore this one as well.

regards,
dan carpenter

