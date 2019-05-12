From: David Howells <dhowells@redhat.com>
Date: Sun, 12 May 2019 06:56:58 +0000
Subject: Re: [PATCH] afs: remove redundant assignment to variable ret
Message-Id: <26840.1557644218@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <eb1862ebb97f41dcdf85abbea43a22d51ec94c9c.camel@perches.com> <20190511123603.3265-1-colin.king@canonical.com>
In-Reply-To: <eb1862ebb97f41dcdf85abbea43a22d51ec94c9c.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: dhowells@redhat.com, Colin King <colin.king@canonical.com>, linux-afs@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Joe Perches <joe@perches.com> wrote:

> @@ -71,11 +71,9 @@ static int afs_xattr_get_acl(const struct xattr_handler *handler,
>  	if (ret = 0) {
>  		ret = acl->size;
>  		if (size > 0) {
> -			ret = -ERANGE;
>  			if (acl->size > size)
>  				return -ERANGE;
>  			memcpy(buffer, acl->data, acl->size);
> -			ret = acl->size;
>  		}
>  		kfree(acl);
>  	}

This is also the wrong solution.  See my reply to Colin.

David
