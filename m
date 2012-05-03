From: Edward Shishkin <edward.shishkin@gmail.com>
Date: Thu, 03 May 2012 14:45:20 +0000
Subject: Re: [PATCH] fs/reiserfs/journal.c: add missing brelse
Message-Id: <4FA29A00.3040303@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1336054373-13293-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1336054373-13293-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: reiserfs-devel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 05/03/2012 04:12 PM, Julia Lawall wrote:
> From: Julia Lawall<Julia.Lawall@lip6.fr>
>
> Brelse is called to put bhjh on every way out of the function except this one.

Yes, thanks.
Acked-by: Edward Shishkin <edward.shishkin@gmail.com>

>
> Signed-off-by: Julia Lawall<Julia.Lawall@lip6.fr>
>
> ---
>   fs/reiserfs/journal.c |    4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
> index b1a0857..1ef9cbc 100644
> --- a/fs/reiserfs/journal.c
> +++ b/fs/reiserfs/journal.c
> @@ -2757,8 +2757,10 @@ int journal_init(struct super_block *sb, const char *j_dev_name,
>   	    le32_to_cpu(jh->jh_journal.jp_journal_max_commit_age);
>   	journal->j_max_trans_age = JOURNAL_MAX_TRANS_AGE;
>
> -	if (check_advise_trans_params(sb, journal) != 0)
> +	if (check_advise_trans_params(sb, journal) != 0) {
> +		brelse(bhjh);
>   	        goto free_and_return;
> +	}
>   	journal->j_default_max_commit_age = journal->j_max_commit_age;
>
>   	if (commit_max_age != 0) {
>
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

