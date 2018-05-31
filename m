From: Mimi Zohar <zohar@linux.vnet.ibm.com>
Date: Thu, 31 May 2018 15:00:22 +0000
Subject: Re: [PATCH][next] EVM: fix memory leak of temporary buffer 'temp'
Message-Id: <1527778822.3427.13.camel@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180527221502.25073-1-colin.king@canonical.com>
In-Reply-To: <20180527221502.25073-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Matthew Garrett <mjg59@google.com>, James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 2018-05-27 at 23:15 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The allocation of 'temp' is not kfree'd and hence there is a memory
> leak on each call of evm_read_xattrs.  Fix this by kfree'ing it
> after copying data from it back to the user space buffer 'buf'.
> 
> Detected by CoverityScan, CID#1469386 ("Resource Leak")
> 
> Fixes: fa516b66a1bf ("EVM: Allow runtime modification of the set of verified xattrs")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, this patch and "EVM: Fix null dereference on xattr when xattr
fails to allocate" are queued in the next-integrity branch.

Mimi

> ---
>  security/integrity/evm/evm_secfs.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/security/integrity/evm/evm_secfs.c b/security/integrity/evm/evm_secfs.c
> index a7a0a1acae99..fb8bc950aceb 100644
> --- a/security/integrity/evm/evm_secfs.c
> +++ b/security/integrity/evm/evm_secfs.c
> @@ -158,6 +158,8 @@ static ssize_t evm_read_xattrs(struct file *filp, char __user *buf,
>  	mutex_unlock(&xattr_list_mutex);
>  	rc = simple_read_from_buffer(buf, count, ppos, temp, strlen(temp));
> 
> +	kfree(temp);
> +
>  	return rc;
>  }
> 

