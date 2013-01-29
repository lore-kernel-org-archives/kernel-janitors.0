From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Date: Tue, 29 Jan 2013 18:56:16 +0000
Subject: Re: [patch] iscsi-target: make some temporary buffers larger
Message-Id: <1359485776.23290.1394.camel@haakon2.linux-iscsi.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130124070637.GE5611@elgon.mountain>
In-Reply-To: <20130124070637.GE5611@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

On Thu, 2013-01-24 at 10:06 +0300, Dan Carpenter wrote:
> My static checker complains because we use sprintf() to print some
> unsigned ints into 10 byte buffers.  In theory unsigned ints can take 10
> characters and we need another for the terminator.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 

Applied to target-pending/for-next, and apologies for the delay.

Thank you,

--nab

> diff --git a/drivers/target/iscsi/iscsi_target_parameters.c b/drivers/target/iscsi/iscsi_target_parameters.c
> index d891642..ca2be40 100644
> --- a/drivers/target/iscsi/iscsi_target_parameters.c
> +++ b/drivers/target/iscsi/iscsi_target_parameters.c
> @@ -1095,11 +1095,11 @@ static int iscsi_check_acceptor_state(struct iscsi_param *param, char *value,
>  				SET_PSTATE_REPLY_OPTIONAL(param);
>  		}
>  	} else if (IS_TYPE_NUMBER(param)) {
> -		char *tmpptr, buf[10];
> +		char *tmpptr, buf[11];
>  		u32 acceptor_value = simple_strtoul(param->value, &tmpptr, 0);
>  		u32 proposer_value = simple_strtoul(value, &tmpptr, 0);
>  
> -		memset(buf, 0, 10);
> +		memset(buf, 0, sizeof(buf));
>  
>  		if (!strcmp(param->name, MAXCONNECTIONS) ||
>  		    !strcmp(param->name, MAXBURSTLENGTH) ||
> @@ -1503,8 +1503,8 @@ static int iscsi_enforce_integrity_rules(
>  			FirstBurstLength = simple_strtoul(param->value,
>  					&tmpptr, 0);
>  			if (FirstBurstLength > MaxBurstLength) {
> -				char tmpbuf[10];
> -				memset(tmpbuf, 0, 10);
> +				char tmpbuf[11];
> +				memset(tmpbuf, 0, sizeof(tmpbuf));
>  				sprintf(tmpbuf, "%u", MaxBurstLength);
>  				if (iscsi_update_param_value(param, tmpbuf))
>  					return -1;
> --
> To unsubscribe from this list: send the line "unsubscribe target-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


