From: Borislav Petkov <bp@alien8.de>
Date: Thu, 30 Oct 2014 11:12:04 +0000
Subject: Re: [PATCH - resend] checkpatch: Remove unnecessary + after {8,8}
Message-Id: <20141030111204.GA11295@pd.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405128087.6751.12.camel@joe-AO725>
	<20140712013927.GA30781@kroah.com>
	<1405129612.6751.24.camel@joe-AO725>
	<20140712020114.GA12301@kroah.com>
	<20140712020520.GA18611@kroah.com>
	<1409590506.2614.4.camel@joe-AO725>
In-Reply-To: <1409590506.2614.4.camel@joe-AO725>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@lists.kernelnewbies.org

Hey Andrew,

can we get this one applied already - I'm seeing this warning at least
since before my summer vacation started! :-P

Thanks.

On Mon, Sep 01, 2014 at 09:55:06AM -0700, Joe Perches wrote:
> There's a useless "+" use that needs to be removed as perl 5.20
> emits a "Useless use of greediness modifier '+'" message each
> time it's hit.
> 
> Reported-by: Greg KH <gregkh@linuxfoundation.org>
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
> 
> Resending, maybe Andrew's all-seeing eye blinked...
> 
> On Fri, 2014-07-11 at 19:05 -0700, Greg KH wrote:
> > Ok, with linux-next I get the same thing:
> 
> Thanks Greg.
> 
>  scripts/checkpatch.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index d5ac001..370a974 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2376,7 +2376,7 @@ sub process {
>  				"please, no space before tabs\n" . $herevet) &&
>  			    $fix) {
>  				while ($fixed[$fixlinenr] =~
> -					   s/(^\+.*) {8,8}+\t/$1\t\t/) {}
> +					   s/(^\+.*) {8,8}\t/$1\t\t/) {}
>  				while ($fixed[$fixlinenr] =~
>  					   s/(^\+.*) +\t/$1\t/) {}
>  			}
> 
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
