From: Jakub Narebski <jnareb@gmail.com>
Date: Fri, 24 Sep 2010 15:32:25 +0000
Subject: Re: [PATCH V3] git-send-email.perl: Add --to-cmd
Message-Id: <m3lj6rgnub.fsf@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTinsM5jdU194FR8L3hTvBXk0Tr_oV2E5752NOUpq@mail.gmail.com>
	<AANLkTikkJNwF4LS9rx5=bHM2R0Pm751Y1u9V8iAt0w1A@mail.gmail.com>
	<1285227413.7286.47.camel@Joe-Laptop>
	<Pine.LNX.4.64.1009231054230.15528@ask.diku.dk>
	<20100923090931.GA29789@albatros> <20100923120024.GA26715@albatros>
	<1285253867.31572.13.camel@Joe-Laptop>
	<Pine.LNX.4.64.1009231757090.11585@ask.diku.dk>
	<1285262237.31572.18.camel@Joe-Laptop>
	<AANLkTin_Y8w4ujNGTqGJPNDNfYz7hcjBVLcOG0emBjYn@mail.gmail.com>
	<1285263993.31572.25.camel@Joe-Laptop>
	<AANLkTinCx=+n6bMZw4tQqrQ7WC1o_aeGG_n_PxywTyb8@mail.gmail.com>
	<1285267520.31572.34.camel@Joe-Laptop>
	<7v62xwqe7i.fsf@alter.siamese.dyndns.org>
	<1285291098.25928.220.camel@Joe-Laptop>
In-Reply-To: <1285291098.25928.220.camel@Joe-Laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Junio C Hamano <gitster@pobox.com>, =?iso-8859-15?q?=C6var_Arnfj=F6r=F0_Bjarmason?= <avarab@gmail.com>, Julia Lawall <julia@diku.dk>, git@vger.kernel.org, Vasiliy Kulikov <segooon@gmail.com>, Matt Mooney <mfmooney@gmail.com>, kernel-janitors@vger.kernel.org, Dan Carpenter <error27@gmail.com>

Joe Perches <joe@perches.com> writes:

> +# Execute a command (ie: $to_cmd) to get a list of email addresses
> +# and return a results array
> +sub recipients_cmd(@) {

Do not use subroutine prototypes: they do not do what you think they
do.  In this case using prototype is unnecessary and can be dangerous.

> +	my ($prefix, $what, $cmd, $file) = @_;
> +
> +	my $sanitized_sender = sanitize_address($sender);
> +	my @addresses = ();
> +	open(F, "$cmd \Q$file\E |")

For the future: use lexical filehandles instead of globals

  +	open(my $fh, "$cmd \Q$file\E |")


> +	    or die "($prefix) Could not execute '$cmd'";

You should use quote_command from gitweb/gitweb.perl (should probably
make it into Git.pm):

  # quote the given arguments for passing them to the shell
  # quote_command("command", "arg 1", "arg with ' and ! characters")
  # => "'command' 'arg 1' 'arg with '\'' and '\!' characters'"
  # Try to avoid using this function wherever possible.
  sub quote_command {
  	return join(' ',
  		map { my $a = $_; $a =~ s/(['!])/'\\$1'/g; "'$a'" } @_ );
  }

Or use String::ShellQuote :-)

But that is for a cleanup patch; you are using what it is already
there.

> +	while(<F>) {
> +		my $address = $_;
> +		$address =~ s/^\s*//g;
> +		$address =~ s/\n$//g;

Hmmm... why does it remove leading, but not trailing whitespace?

> +		$address = sanitize_address($address);
> +		next if ($address eq $sanitized_sender and $suppress_from);
> +		push @addresses, $address;
> +		printf("($prefix) Adding %s: %s from: '%s'\n",
> +		       $what, $address, $cmd) unless $quiet;
> +		}
> +	close F
> +	    or die "($prefix) failed to close pipe to '$cmd'";
> +	return @addresses;
> +}

-- 
Jakub Narebski
Poland
ShadeHawk on #git
