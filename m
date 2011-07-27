From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Date: Wed, 27 Jul 2011 19:36:15 +0000
Subject: Re: [patch] target: strlen() doesn't count the terminator
Message-Id: <1311795375.6931.8.camel@haakon2.linux-iscsi.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110727111143.GN3824@shale.localdomain>
In-Reply-To: <20110727111143.GN3824@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Andy Grover <agrover@redhat.com>, Roland Dreier <roland@kernel.org>, Christoph Hellwig <hch@lst.de>, "open list:TARGET SUBSYSTEM" <linux-scsi@vger.kernel.org>, kernel-janitors@vger.kernel.org, target-devel <target-devel@vger.kernel.org>

On Wed, 2011-07-27 at 14:11 +0300, Dan Carpenter wrote:
> This test is off by one because the NUL terminator isn't taken into
> consideration.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/target/iscsi/iscsi_target.c b/drivers/target/iscsi/iscsi_target.c
> index 494bfa4..4793875 100644
> --- a/drivers/target/iscsi/iscsi_target.c
> +++ b/drivers/target/iscsi/iscsi_target.c
> @@ -120,7 +120,7 @@ struct iscsi_tiqn *iscsit_add_tiqn(unsigned char *buf)
>  	struct iscsi_tiqn *tiqn = NULL;
>  	int ret;
>  
> -	if (strlen(buf) > ISCSI_IQN_LEN) {
> +	if (strlen(buf) >= ISCSI_IQN_LEN) {
>  		pr_err("Target IQN exceeds %d bytes\n",
>  				ISCSI_IQN_LEN);
>  		return ERR_PTR(-EINVAL);

Committed as e8f4d726c69 into lio-core-2.6.git/master

Thanks!

--nab

