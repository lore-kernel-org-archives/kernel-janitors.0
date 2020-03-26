From: Joe Perches <joe@perches.com>
Date: Thu, 26 Mar 2020 16:45:55 +0000
Subject: Re: [PATCH] parse-maintainers: Do not sort section content by default
Message-Id: <00d11cf766237d9c12c2a06458962c4bae84fa78.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200304072950.10532-1-lukas.bulwahn@gmail.com>
         <20200304131035.731a3947@lwn.net>
         <alpine.DEB.2.21.2003042145340.2698@felia>
         <e43f0cf0117fbfa8fe8c7e62538fd47a24b4657a.camel@perches.com>
         <alpine.DEB.2.21.2003062214500.5521@felia>
         <20200307110154.719572e4@onda.lan>
         <0d5503e1d864f2588e756ae590ff8935e11bf9d6.camel@perches.com>
         <4d5291fa3fb4962b1fa55e8fd9ef421ef0c1b1e5.camel@perches.com>
In-Reply-To: <4d5291fa3fb4962b1fa55e8fd9ef421ef0c1b1e5.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 2020-03-07 at 18:59 -0800, Joe Perches wrote:
> Add an --order switch to control section reordering.
> Default for --order is off.

> Change the default ordering to a slightly more sensible:
> 
> M:  Person acting as a maintainer
> R:  Person acting as a patch reviewer
> L:  Mailing list where patches should be sent
> S:  Maintenance status
> W:  URI for general information
> Q:  URI for patchwork tracking
> B:  URI for bug tracking/submission
> C:  URI for chat
> P:  URI or file for subsystem specific coding styles
> T:  SCM tree type and location
> F:  File and directory pattern
> X:  File and directory exclusion pattern
> N:  File glob
> K:  Keyword - patch content regex

Linus? ping?

> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>  scripts/parse-maintainers.pl | 31 +++++++++++++++++++++++++++----
>  1 file changed, 27 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/parse-maintainers.pl b/scripts/parse-maintainers.pl
> index 255cef1..2ca4eb3 100644
> --- a/scripts/parse-maintainers.pl
> +++ b/scripts/parse-maintainers.pl
> @@ -8,13 +8,14 @@ my $input_file = "MAINTAINERS";
>  my $output_file = "MAINTAINERS.new";
>  my $output_section = "SECTION.new";
>  my $help = 0;
> -
> +my $order = 0;
>  my $P = $0;
>  
>  if (!GetOptions(
>  		'input=s' => \$input_file,
>  		'output=s' => \$output_file,
>  		'section=s' => \$output_section,
> +		'order!' => \$order,
>  		'h|help|usage' => \$help,
>  	    )) {
>      die "$P: invalid argument - use --help if necessary\n";
> @@ -32,6 +33,22 @@ usage: $P [options] <pattern matching regexes>
>    --input => MAINTAINERS file to read (default: MAINTAINERS)
>    --output => sorted MAINTAINERS file to write (default: MAINTAINERS.new)
>    --section => new sorted MAINTAINERS file to write to (default: SECTION.new)
> +  --order => Use the preferred section content output ordering (default: 0)
> +    Preferred ordering of section output is:
> +      M:  Person acting as a maintainer
> +      R:  Person acting as a patch reviewer
> +      L:  Mailing list where patches should be sent
> +      S:  Maintenance status
> +      W:  URI for general information
> +      Q:  URI for patchwork tracking
> +      B:  URI for bug tracking/submission
> +      C:  URI for chat
> +      P:  URI or file for subsystem specific coding styles
> +      T:  SCM tree type and location
> +      F:  File and directory pattern
> +      X:  File and directory exclusion pattern
> +      N:  File glob
> +      K:  Keyword - patch content regex
>  
>  If <pattern match regexes> exist, then the sections that match the
>  regexes are not written to the output file but are written to the
> @@ -56,7 +73,7 @@ sub by_category($$) {
>  
>  sub by_pattern($$) {
>      my ($a, $b) = @_;
> -    my $preferred_order = 'MRPLSWTQBCFXNK';
> +    my $preferred_order = 'MRLSWQBCPTFXNK';
>  
>      my $a1 = uc(substr($a, 0, 1));
>      my $b1 = uc(substr($b, 0, 1));
> @@ -105,8 +122,14 @@ sub alpha_output {
>  		print $file $separator;
>  	    }
>  	    print $file $key . "\n";
> -	    foreach my $pattern (sort by_pattern split('\n', %$hashref{$key})) {
> -		print $file ($pattern . "\n");
> +	    if ($order) {
> +		foreach my $pattern (sort by_pattern split('\n', %$hashref{$key})) {
> +		    print $file ($pattern . "\n");
> +		}
> +	    } else {
> +		foreach my $pattern (split('\n', %$hashref{$key})) {
> +		    print $file ($pattern . "\n");
> +		}
>  	    }
>  	}
>      }
> 
