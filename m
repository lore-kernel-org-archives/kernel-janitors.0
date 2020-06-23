From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 23 Jun 2020 16:26:15 +0000
Subject: Re: [PATCH] afs: Fix the memory leak in afs_mkdir
Message-Id: <91acdece-92a1-c23b-f835-34c8e8f3aad0@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Chen Tao <chentao107@huawei.com>, linux-afs@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, David Howells <dhowells@redhat.com>

…
> +++ b/fs/afs/dir.c
> @@ -1599,17 +1599,17 @@ static int afs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
…
>  	scb = kcalloc(2, sizeof(struct afs_status_cb), GFP_KERNEL);
>  	if (!scb)
>  		goto error_scb;

I suggest to adjust also this jump target so that a call of the function “kfree”
with a null pointer can be avoided.


…
> @@ -1645,10 +1645,10 @@  static int afs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
…
>  error_key:
>  	key_put(key);
> +error_scb:
> +	kfree(scb);
>  error:
>  	d_drop(dentry);
…

Can an other label than “error” be nicer here?

Regards,
Markus
