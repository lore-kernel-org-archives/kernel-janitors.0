From: Junio C Hamano <gitster@pobox.com>
Date: Thu, 23 Sep 2010 22:37:05 +0000
Subject: Re: [PATCH V2] git-send-email.perl: Add --to-cmd
Message-Id: <7v62xwqe7i.fsf@alter.siamese.dyndns.org>
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
In-Reply-To: <1285267520.31572.34.camel@Joe-Laptop> (Joe Perches's message of
 "Thu\, 23 Sep 2010 11\:45\:20 -0700")
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Joe Perches <joe@perches.com>
Cc: =?utf-8?B?w4Z2YXIgQXJuZmrDtnLDsA==?= Bjarmason <avarab@gmail.com>, Julia Lawall <julia@diku.dk>, git <git@vger.kernel.org>, Vasiliy Kulikov <segooon@gmail.com>, matt mooney <mfmooney@gmail.com>, kernel-janitors@vger.kernel.org, Dan Carpenter <error27@gmail.com>

Joe Perches <joe@perches.com> writes:

> +	if (defined $to_cmd) {
> +		open(F, "$to_cmd \Q$t\E |")
> +			or die "(to-cmd) Could not execute '$to_cmd'";
> +		while(<F>) {
> +			my $t =3D $_;

"my $t" masks another $t in the outer scope; technically not a bug, but
questionable as a style.

> +			$t =3D~ s/^\s*//g;
> +			$t =3D~ s/\n$//g;
> +			next if ($t eq $sender and $suppress_from);
> +			push @to, parse_address_line($t)
> +			    if defined $t; # sanitized/validated later

This "if defined $t" makes my head hurt.  Why?

 * The "while (<F>)" loop wouldn't have given you an undef in $t in the
   first place;

 * You would have got "Use of uninitialized value" warning at these two
   s/// statements if $t were undef; and

 * Even if $t were undef, these two s/// statements would have made $t a
   defined, empty string.

> +			printf("(to-cmd) Adding To: %s from: '%s'\n",
> +				$t, $to_cmd) unless $quiet;
> +		}
> +		close F
> +			or die "(to-cmd) failed to close pipe to '$to_cmd'";
> +	}

In any case, this whole codeblock obviously is a copy-and-paste from
corresponding $cc_cmd codepath, and I wonder if you can refactor the
original into a common helper function first and then use it to make the
addition of this feature a smaller patch.

	if (defined $cc_cmd) {
        	push @cc, recipients_cmd($cc_cmd, 'cc');
	}
        if (defined $to_cmd) {
	        push @to, recipients_cmd($to_cmd, 'to');
	}

If you did so, the first patch that refactors to create a helper function
can address issues =C3=86var raised in the review to clean things up, no?

I notice that you use parse_address_line() while $cc_cmd codepath doesn't.
I haven't studied other codepaths deeply, but my gut feeling is that the
reason why the $cc_cmd codepath does not call parse_address_line() before
pushing the result to @cc is _not_ because strings on @cc shouldn't be
sanitized (the codepath to parse "Cc: " calls parse_address_line and
pushes the result to @cc), but because the code is simply sloppy.  So I
suspect that it would be Ok for recipients_cmd to call parse_address_line
unconditionally.

Hmm?


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
