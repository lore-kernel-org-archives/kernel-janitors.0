From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Date: Mon, 08 Aug 2011 21:07:35 +0000
Subject: Re: [patch] iscsi-target: forever loop in iscsit_attach_ooo_cmdsn()
Message-Id: <1312837655.12502.87.camel@haakon2.linux-iscsi.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110806143206.GF10373@mwanda>
In-Reply-To: <20110806143206.GF10373@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Andy Grover <agrover@redhat.com>, Roland Dreier <roland@kernel.org>, Christoph Hellwig <hch@lst.de>, "open list:TARGET SUBSYSTEM" <linux-scsi@vger.kernel.org>, "open list:TARGET SUBSYSTEM" <target-devel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, 2011-08-06 at 07:32 -0700, Dan Carpenter wrote:
> I was looking through the code for something unrelated and noticed
> what looks like a forever loop here.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> I am not familiar with the subsystem and haven't tested this, so
> please review carefully.
> 
> diff --git a/drivers/target/iscsi/iscsi_target_erl1.c b/drivers/target/iscsi/iscsi_target_erl1.c
> index 9806507..c4c68da 100644
> --- a/drivers/target/iscsi/iscsi_target_erl1.c
> +++ b/drivers/target/iscsi/iscsi_target_erl1.c
> @@ -834,7 +834,7 @@ static int iscsit_attach_ooo_cmdsn(
>  			 */
>  			list_for_each_entry(ooo_tmp, &sess->sess_ooo_cmdsn_list,
>  						ooo_list) {
> -				while (ooo_tmp->cmdsn < ooo_cmdsn->cmdsn)
> +				if (ooo_tmp->cmdsn < ooo_cmdsn->cmdsn)
>  					continue;
>  
>  				list_add(&ooo_cmdsn->ooo_list,
> --

Mmmm, good catch.  I think this bogus while loop usage is left over from
the pre sess->sess_ooo_cmd_list conversion, and it's definately not what
the original logic is doing.

Committed as e7851a0e73de into lio-core-2.6.git.

Thanks Dan!

--nab



