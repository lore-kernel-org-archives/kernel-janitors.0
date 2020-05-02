From: Joe Perches <joe@perches.com>
Date: Sat, 02 May 2020 19:07:18 +0000
Subject: Re: [PATCH] checkpatch: fix can't check for too long invalid commit id
Message-Id: <ed8ade7265429ab6fdeb2c4d05c02c67bcc57737.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200502185041.GA9082@udknight>
In-Reply-To: <20200502185041.GA9082@udknight>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wang YanQing <udknight@gmail.com>
Cc: Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Matteo Croce <mcroce@redhat.com>, Markus.Elfring@web.de, kernel-janitors@vger.kernel.org

On Sun, 2020-05-03 at 02:50 +0800, Wang YanQing wrote:
> The current UNKNOWN_COMMIT_ID doesn't check for 41+ length commit id,
> and although GIT_COMMIT_ID will check for 41+ length commit id, but
> it willn't warn anything about it due to 41+ length commit will never
> be defined.
> 
> This patch moves the unknown commit id check for normal commit description
> to GIT_COMMIT_ID, and uses ERROR instead of WARN, because unknown commit
> id is total useless to track change history in changelog, it deserves the
> ERROR.
> 
> Signed-off-by: Wang YanQing <udknight@gmail.com>

Hi again.  Trivial notes:

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -2865,8 +2865,18 @@ sub process {
>  			($id, $description) = git_commit_info($orig_commit,
>  							      $id, $orig_desc);
>  
> +			if (!defined($id)) {
> +			    if ($long) {
> +				ERROR("GIT_COMMIT_ID",
> +				      "Unknown commit id '$orig_commit' is too long, maybe misspelled?\n" . $herecurr);

checkpatch always uses tab indentation.
Please convert from 4 spaces to 1
tab and reindent the rest.

"misspelled" word choice may not be the best here as a
SHA-1 isn't really something that is spelled.

Perhaps something like:
	"Invalid commit id '$orig_commit' length '" . length($orig_commit) . "' exceeds allowed maximum of 40\n",

Though maybe a recommended maximum of some constant should be used.

	my $recommended_sha_length = 12;


> @@ -2969,7 +2979,7 @@ sub process {
>  		}
>  
>  # check for invalid commit id
> -		if ($in_commit_log && $line =~ /(^fixes:|\bcommit)\s+([0-9a-f]{6,40})\b/i) {
> +		if ($in_commit_log && $line =~ /(^fixes:)\s+([0-9a-f]{6,40})\b/i) {

Likely this capture group around Fixes: isn't necessary any more.

>  			my $id;
>  			my $description;
>  			($id, $description) = git_commit_info($2, undef, undef);

$1 ?
