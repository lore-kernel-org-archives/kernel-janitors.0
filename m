From: John Johansen <john.johansen@canonical.com>
Date: Sun, 07 May 2017 12:31:00 +0000
Subject: Re: [PATCH 1/2] apparmorfs: Combine two function calls into one in aa_fs_seq_raw_abi_show()
Message-Id: <af3aac53-972d-ec04-4bfb-297718300ef2@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b58df574-97f1-dbc5-2198-fe4734f24b8e@users.sourceforge.net>
	<b0ee52a7-06d7-2bbb-75dc-b4a17e3dccd3@users.sourceforge.net>
In-Reply-To: <b0ee52a7-06d7-2bbb-75dc-b4a17e3dccd3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org

On 05/07/2017 05:02 AM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 7 May 2017 13:43:50 +0200
> 
> A bit of data was put into a sequence by two separate function calls.
> Print the same data by a single function call instead.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: John Johansen <john.johansen@canonical.com>

I'll pull it into my tree for my next push

> ---
>  security/apparmor/apparmorfs.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
> index 4f6ac9dbc65d..b4d83e0bc651 100644
> --- a/security/apparmor/apparmorfs.c
> +++ b/security/apparmor/apparmorfs.c
> @@ -572,10 +572,9 @@ static int aa_fs_seq_raw_abi_show(struct seq_file *seq, void *v)
>  	struct aa_proxy *proxy = seq->private;
>  	struct aa_profile *profile = aa_get_profile_rcu(&proxy->profile);
>  
> -	if (profile->rawdata->abi) {
> -		seq_printf(seq, "v%d", profile->rawdata->abi);
> -		seq_puts(seq, "\n");
> -	}
> +	if (profile->rawdata->abi)
> +		seq_printf(seq, "v%d\n", profile->rawdata->abi);
> +
>  	aa_put_profile(profile);
>  
>  	return 0;
> 

