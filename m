From: David Howells <dhowells@redhat.com>
Date: Sun, 12 May 2019 06:55:26 +0000
Subject: Re: [PATCH] afs: remove redundant assignment to variable ret
Message-Id: <26748.1557644126@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190511123603.3265-1-colin.king@canonical.com>
In-Reply-To: <20190511123603.3265-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> The variable ret is being assigned a value however this is never
> read and later it is being reassigned to a new value. The assignment
> is redundant and hence can be removed.

No.

>  	if (ret = 0) {
>  		ret = acl->size;
>  		if (size > 0) {
> -			ret = -ERANGE;
>  			if (acl->size > size)
>  				return -ERANGE;
>  			memcpy(buffer, acl->data, acl->size);

This is the wrong solution.  acl and key need releasing, so the return should
be a goto.

David
