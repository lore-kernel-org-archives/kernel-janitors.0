From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 17 May 2014 19:54:11 +0000
Subject: Re: [PATCH 1/4] VMCI: Remove redundant error check
Message-Id: <20140517195411.GE15585@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400350980-30455-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1400350980-30455-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

I like this.  There is way too much code where it sets a variable and
then checks it again a couple lines down instead of just handling it
immediately so that every line is clear without having to keep track
so many variables.

But the automated patch doesn't really go far enough in cleaning up this
function.

On Sat, May 17, 2014 at 08:22:57PM +0200, Peter Senna Tschudin wrote:
>  drivers/misc/vmw_vmci/vmci_context.c |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/misc/vmw_vmci/vmci_context.c b/drivers/misc/vmw_vmci/vmci_context.c
> index f866a4b..3995e64 100644
> --- a/drivers/misc/vmw_vmci/vmci_context.c
> +++ b/drivers/misc/vmw_vmci/vmci_context.c
> @@ -836,12 +836,12 @@ int vmci_ctx_set_chkpt_state(u32 context_id,
>  	for (i = 0; i < num_ids && result = VMCI_SUCCESS; i++) {

This for loop is nonsense.  Probably it was left over cruft.  It should
be:

	for (i = 0; i < num_ids; i++) {

>  		current_id = ((u32 *)cpt_buf)[i];
>  		result = vmci_ctx_add_notification(context_id, current_id);
> -		if (result != VMCI_SUCCESS)
> +		if (result != VMCI_SUCCESS) {
> +			pr_devel("Failed to set cpt state (type=%d) (error=%d)\n",
> +				 cpt_type, result);
>  			break;

			return result;

Why break when it's just going to return?  Eliminate the need to track
this error.

> +		}
>  	}
> -	if (result != VMCI_SUCCESS)
> -		pr_devel("Failed to set cpt state (type=%d) (error=%d)\n",
> -			 cpt_type, result);
>  
>  	return result;

	return VMCI_SUCCESS;

Then we can remove the initialization for "result" as well to eliminate
another forced look up to the start of the function and down.

regards,
dan carpenter

