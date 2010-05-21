From: Jean Delvare <khali@linux-fr.org>
Date: Fri, 21 May 2010 07:13:48 +0000
Subject: Re: [PATCH] checkpatch: warn on declaration with storage class not
Message-Id: <20100521091348.19ba1bcb@hyperion.delvare>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1274368733-4386-1-git-send-email-tklauser@distanz.ch>
In-Reply-To: <1274368733-4386-1-git-send-email-tklauser@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 20 May 2010 17:18:53 +0200, Tobias Klauser wrote:
> The C99 specification states in section 6.11.5:
> 
> The placement of a storage-class specifier other than at the beginning
> of the declaration specifiers in a declaration is an obsolescent
> feature.
> 
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> Cc: Jean Delvare <khali@linux-fr.org>

Acked-by: Jean Delvare <khali@linux-fr.org>

> ---
>  scripts/checkpatch.pl |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index f2bbea9..4921473 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2586,6 +2586,11 @@ sub process {
>  			CHK("architecture specific defines should be avoided\n" .  $herecurr);
>  		}
>  
> +# Check that the storage class is at the beginning of a declaration
> +		if ($line =~ /\b$Storage\b/ && $line !~ /^.\s*$Storage\b/) {
> +			WARN("storage class should be at the beginning of the declaration\n" . $herecurr)
> +		}
> +
>  # check the location of the inline attribute, that it is between
>  # storage class and type.
>  		if ($line =~ /\b$Type\s+$Inline\b/ ||


-- 
Jean Delvare
