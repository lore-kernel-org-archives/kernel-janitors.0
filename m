From: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Date: Fri, 20 Jan 2017 00:10:35 +0000
Subject: Re: [PATCH] powerpc/rtas_flash: Move an assignment for the variable "rc" in manage_flash_write()
Message-Id: <8b00c266-f043-6f15-6b26-1927ea073da9@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <026724c5-0907-d342-1fb3-f7af0bd1c765@users.sourceforge.net>
In-Reply-To: <026724c5-0907-d342-1fb3-f7af0bd1c765@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 01/19/2017 12:33 PM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 19 Jan 2017 21:20:09 +0100
> 
> A local variable was set to an error code before a concrete error situation
> was detected. Thus move the corresponding assignment into an if branch
> to indicate a software failure there.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/powerpc/kernel/rtas_flash.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/rtas_flash.c b/arch/powerpc/kernel/rtas_flash.c
> index db2b482af658..663904beff67 100644
> --- a/arch/powerpc/kernel/rtas_flash.c
> +++ b/arch/powerpc/kernel/rtas_flash.c
> @@ -419,9 +419,10 @@ static ssize_t manage_flash_write(struct file *file, const char __user *buf,
>  	op = -1;
>  	if (buf) {
>  		if (count > 9) count = 9;
> -		rc = -EFAULT;
> -		if (copy_from_user (stkbuf, buf, count))
> +		if (copy_from_user(stkbuf, buf, count)) {
> +			rc = -EFAULT;
>  			goto error;
> +		}
>  		if (strncmp(stkbuf, reject_str, strlen(reject_str)) = 0) 
>  			op = RTAS_REJECT_TMP_IMG;
>  		else if (strncmp(stkbuf, commit_str, strlen(commit_str)) = 0) 
> 

Taking a closer look at the function in question I see that branching to
the "error" tag on a goto results in the rtas_manage_flash_mutex being
unlocked and the value of rc being returned to the caller.

error:
        mutex_unlock(&rtas_manage_flash_mutex);
        return rc;
}

There are only 2 places in this function that branch to the "error" tag,
and I wonder if it would be cleaner just to get rid of the "rc" variable
altogether and instead unlock the mutex and return the proper -EBADTHING
value at those two branch sites?

-Tyrel


