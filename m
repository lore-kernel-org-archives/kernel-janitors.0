From: John Johansen <john.johansen@canonical.com>
Date: Sun, 07 May 2017 12:31:17 +0000
Subject: Re: [PATCH 2/2] apparmorfs: Use seq_putc() in two functions
Message-Id: <d48192cc-5b4d-8b09-1955-9f100fcf1e23@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b58df574-97f1-dbc5-2198-fe4734f24b8e@users.sourceforge.net>
	<22def82a-4cd8-a673-f35f-012cc36fe797@users.sourceforge.net>
In-Reply-To: <22def82a-4cd8-a673-f35f-012cc36fe797@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org

On 05/07/2017 05:03 AM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 7 May 2017 13:50:28 +0200
> 
> Two single characters (line breaks) should be put into a sequence.
> Thus use the corresponding function "seq_putc".
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: John Johansen <john.johansen@canonical.com>

I'll pull it into my tree for my next push


> ---
>  security/apparmor/apparmorfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
> index b4d83e0bc651..41e427a4f051 100644
> --- a/security/apparmor/apparmorfs.c
> +++ b/security/apparmor/apparmorfs.c
> @@ -494,7 +494,7 @@ static int aa_fs_seq_hash_show(struct seq_file *seq, void *v)
>  	if (profile->hash) {
>  		for (i = 0; i < size; i++)
>  			seq_printf(seq, "%.2x", profile->hash[i]);
> -		seq_puts(seq, "\n");
> +		seq_putc(seq, '\n');
>  	}
>  	aa_put_profile(profile);
>  
> @@ -602,7 +602,7 @@ static int aa_fs_seq_raw_hash_show(struct seq_file *seq, void *v)
>  	if (profile->rawdata->hash) {
>  		for (i = 0; i < size; i++)
>  			seq_printf(seq, "%.2x", profile->rawdata->hash[i]);
> -		seq_puts(seq, "\n");
> +		seq_putc(seq, '\n');
>  	}
>  	aa_put_profile(profile);
>  
> 

