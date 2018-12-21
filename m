From: Casey Schaufler <casey@schaufler-ca.com>
Date: Fri, 21 Dec 2018 17:41:28 +0000
Subject: Re: [PATCH] smack: Fix a memory leak in smack_add_opt()
Message-Id: <bd05d276-91a2-c849-065c-18aa17a0ff82@schaufler-ca.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181221090958.GE2735@kadam>
 <20181221163654.GY2217@ZenIV.linux.org.uk>
 <20181221164219.GZ2217@ZenIV.linux.org.uk>
In-Reply-To: <20181221164219.GZ2217@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 12/21/2018 8:42 AM, Al Viro wrote:
> On Fri, Dec 21, 2018 at 04:36:54PM +0000, Al Viro wrote:
>> On Fri, Dec 21, 2018 at 12:09:58PM +0300, Dan Carpenter wrote:
>>> The function is leaking "opts" on the error paths.
>>>
>>> Fixes: 90e3b564ab93 ("smack: take the guts of smack_parse_opts_str() into a new helper")
>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> D'oh...  Applied, thanks for spotting that braino.
> On the other hand, it's easier to do it this way - the caller will free the damn thing
> on error, anyway:

What tree/branch is the happening in?

>
> diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
> index 11da1e2531c8..cf0c0380e5dd 100644
> --- a/security/smack/smack_lsm.c
> +++ b/security/smack/smack_lsm.c
> @@ -608,6 +608,7 @@ static int smack_add_opt(int token, const char *s, void **mnt_opts)
>  		opts = kzalloc(sizeof(struct smack_mnt_opts), GFP_KERNEL);
>  		if (!opts)
>  			return -ENOMEM;
> +		*mnt_opts = opts;
>  	}
>  	if (!s)
>  		return -ENOMEM;
> @@ -639,7 +640,6 @@ static int smack_add_opt(int token, const char *s, void **mnt_opts)
>  		opts->fstransmute = s;
>  		break;
>  	}
> -	*mnt_opts = opts;
>  	return 0;
>  
>  out_opt_err:
>
