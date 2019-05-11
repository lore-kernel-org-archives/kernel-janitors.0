From: Joe Perches <joe@perches.com>
Date: Sat, 11 May 2019 15:35:52 +0000
Subject: Re: [PATCH] afs: remove redundant assignment to variable ret
Message-Id: <eb1862ebb97f41dcdf85abbea43a22d51ec94c9c.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190511123603.3265-1-colin.king@canonical.com>
In-Reply-To: <20190511123603.3265-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, David Howells <dhowells@redhat.com>, linux-afs@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 2019-05-11 at 13:36 +0100, Colin King wrote:
> The variable ret is being assigned a value however this is never
> read and later it is being reassigned to a new value. The assignment
> is redundant and hence can be removed.
[]
> diff --git a/fs/afs/xattr.c b/fs/afs/xattr.c
[]
> @@ -71,7 +71,6 @@ static int afs_xattr_get_acl(const struct xattr_handler *handler,
>  	if (ret = 0) {
>  		ret = acl->size;
>  		if (size > 0) {
> -			ret = -ERANGE;
>  			if (acl->size > size)
>  				return -ERANGE;
>  			memcpy(buffer, acl->data, acl->size);

It looks like the ret = acl->size immediately
after the memcpy should be removed as well.
---
 fs/afs/xattr.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/afs/xattr.c b/fs/afs/xattr.c
index c81f85003fc7..e21de2f166a4 100644
--- a/fs/afs/xattr.c
+++ b/fs/afs/xattr.c
@@ -71,11 +71,9 @@ static int afs_xattr_get_acl(const struct xattr_handler *handler,
 	if (ret = 0) {
 		ret = acl->size;
 		if (size > 0) {
-			ret = -ERANGE;
 			if (acl->size > size)
 				return -ERANGE;
 			memcpy(buffer, acl->data, acl->size);
-			ret = acl->size;
 		}
 		kfree(acl);
 	}
