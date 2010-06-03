From: Michal Marek <mmarek@suse.cz>
Date: Thu, 03 Jun 2010 09:50:09 +0000
Subject: Re: [PATCH 1/4] Add targets to use the Coccinelle checker
Message-Id: <4C077AD1.5010204@suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1273508667-5152-1-git-send-email-npalix@diku.dk> <1273508667-5152-2-git-send-email-npalix@diku.dk>
In-Reply-To: <1273508667-5152-2-git-send-email-npalix@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Palix <npalix@diku.dk>
Cc: Randy Dunlap <rdunlap@xenotime.net>, Roland Dreier <rdreier@cisco.com>, Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Sam Ravnborg <sam@ravnborg.org>, Julia Lawall <julia@diku.dk>, Gilles Muller <Gilles.Muller@lip6.fr>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, cocci@diku.dk, Wolfram Sang <w.sang@pengutronix.de>, Kernel Janitors <kernel-janitors@vger.kernel.org>

On 10.5.2010 18:24, Nicolas Palix wrote:
> Four targets are added. Each one generates a different
> output kind: context, patch, org, report.
> Every SmPL file in 'scripts/coccinelle' is given to the spatch frontend
> (located in the 'scripts' directory), and applied to the entire
> source tree.

I think it would be good to repeat the description of the four modes
here (the 0/4 mail won't appear in the changelog).


> +	@if [ "$(COCCI)" = "" ] ; then                         \
> +	find $(srctree)/scripts/coccinelle/                    \
> +		-name '*.cocci' -type f                        \
> +		-exec $(srctree)/scripts/coccinelle.sh $(COCCINELLE) $(@:coccicheck-%=%) \{} $(srctree) \; ; \
> +	else                                                                                                 \
> +		$(srctree)/scripts/coccinelle.sh $(COCCINELLE) $(@:coccicheck-%=%) $(COCCI) $(srctree)     ; \
> +	fi

Please sort the output of 'find' or use a shell glob instead. IMO the
order of tests should be stable (and thus easily diff-able) and not
change when you e.g. switch branches.


> +if [ -x "$SPATCH" ]; then
> +
> +    echo "Processing `basename $COCCI` with option(s) \"$(OPT)\""

/home/mmarek/linux-2.6/scripts/coccinelle.sh: line 13: OPT: command not
found

Please remove the parentheses around OPT.


> +    echo 'Message example to submit a patch:'
> +    sed -e '/\/\/\//!d' -e 's|^///||' $COCCI
> +
> +    echo ' The semantic patch that makes this change is available'
> +    echo " in $FILE."
> +    echo ''
> +    echo ' More information about semantic patching is available at'
> +    echo ' http://coccinelle.lip6.fr/'
> +    echo ''
> +
> +    $SPATCH -D $MODE -very_quiet -sp_file $COCCI $OPT -dir $DIR
> +
> +else
> +    echo 'spatch is part of the Coccinelle project and is available at http://coccinelle.lip6.fr/'
> +fi

If 'spatch' is not available, you should exit with an error.

Thanks,
Michal

PS: Sorry for the delay, I didn't get around to to reviewing the v2 of
your patch early enough and then I was offline for two weeks.
