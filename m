From: Joe Perches <joe@perches.com>
Date: Wed, 05 Feb 2020 18:46:32 +0000
Subject: Re: [PATCH] get_maintainer: Prefer MAINTAINER address over S-o-b
Message-Id: <76267eda365d7c5c0adc7dd16681973c5378df8e.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200205152429.ejgx2on2z4hoycus@kili.mountain>
In-Reply-To: <20200205152429.ejgx2on2z4hoycus@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Douglas Anderson <dianders@chromium.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 2020-02-05 at 18:24 +0300, Dan Carpenter wrote:
> The get_maintainer.pl script looks at git history to create the CC list,
> but unfortunately sometimes those email addresses are out of date.  The
> script also looks at the MAINTAINERS file, of course, but if it already
> found an email address for a maintainer in the git history then the
> deduplicate_email() function will remove the second address.
> 
> It should save the MAINTAINERS address first, before loading the commit
> signer addresses.

Yeah, thanks.  This has been submitted already.
https://lore.kernel.org/patchwork/patch/1186249/

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> We will have to add a special case if the Dan Williamses ever decide
> to work on the same subsystem.
> 
>  scripts/get_maintainer.pl | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
> index 34085d146fa2..e5bdd3143a49 100755
> --- a/scripts/get_maintainer.pl
> +++ b/scripts/get_maintainer.pl
> @@ -932,14 +932,14 @@ sub get_maintainers {
>  	}
>      }
>  
> -    foreach my $fix (@fixes) {
> -	vcs_add_commit_signers($fix, "blamed_fixes");
> -    }
> -
>      foreach my $email (@email_to, @list_to) {
>  	$email->[0] = deduplicate_email($email->[0]);
>      }
>  
> +    foreach my $fix (@fixes) {
> +	vcs_add_commit_signers($fix, "blamed_fixes");
> +    }
> +
>      foreach my $file (@files) {
>  	if ($email &&
>  	    ($email_git || ($email_git_fallback &&
