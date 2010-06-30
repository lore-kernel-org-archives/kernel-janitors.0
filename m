From: Kulikov Vasiliy <segooon@gmail.com>
Date: Wed, 30 Jun 2010 18:58:54 +0000
Subject: Re: [PATCH 1/7] Add a target to use the Coccinelle checker
Message-Id: <20100630185851.GA17502@shinshilla>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1275837307-4283-1-git-send-email-npalix@diku.dk>
 <1275837307-4283-2-git-send-email-npalix@diku.dk>
In-Reply-To: <1275837307-4283-2-git-send-email-npalix@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Palix <npalix@diku.dk>
Cc: Randy Dunlap <rdunlap@xenotime.net>, Roland Dreier <rdreier@cisco.com>, Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, Julia Lawall <julia@diku.dk>, Gilles Muller <Gilles.Muller@lip6.fr>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, cocci@diku.dk, Wolfram Sang <w.sang@pengutronix.de>, Kernel Janitors <kernel-janitors@vger.kernel.org>, =?iso-8859-1?Q?Am=E9rico?= Wang <xiyou.wangcong@gmail.com>, Andy Isaacson <adi@hexapodia.org>, Linus Torvalds <torvalds@linux-foundation.org>, Pekka Enberg <penberg@cs.helsinki.fi>, walter harms <wharms@bfs.de>, Joerg Roedel <joro@8bytes.org>, Jan Engelhardt <jengelh@medozas.de>

Hi,

On Sun, Jun 06, 2010 at 17:15 +0200, Nicolas Palix wrote:
> +    echo ' The semantic patch that makes this change is available'
> +    echo " in $FILE."
> +    echo ''
> +    echo ' More information about semantic patching is available at'
> +    echo ' http://coccinelle.lip6.fr/'
> +    echo ''
> +
> +    $SPATCH -D $MODE -very_quiet -sp_file $COCCI $OPT -dir $DIR

Here I've got output:

/usr/lib/coccinelle/spatch: unknown option `-very_quiet'.
Usage: spatch -sp_file <SP> <infile> [-o <outfile>] [-iso_file <iso>] [options]
Options are:
[...]


I use ubuntu Lucid 10.04 as said in Documentation/coccinelle.txt.

$ LANG=C apt-cache policy coccinelle
[...]
  Installed: 0.2.0.deb-1ubuntu2
[...]


If I delete -very_quiet then It runs OK, but output is not ommited:

init_defs_builtins: /usr/share/coccinelle/standard.h
HANDLING: /home/vasya/dev/linux-next/security/min_addr.c
HANDLING: /home/vasya/dev/linux-next/security/keys/proc.c
HANDLING: /home/vasya/dev/linux-next/security/keys/keyring.c
HANDLING: /home/vasya/dev/linux-next/security/keys/gc.c
HANDLING: /home/vasya/dev/linux-next/security/keys/process_keys.c
HANDLING: /home/vasya/dev/linux-next/security/keys/request_key_auth.c
[...]


> +if [ "$COCCI" = "" ] ; then
> +    for f in `find $srctree/scripts/coccinelle/ -name '*.cocci' -type f | sort`; do
> +	coccinelle $f $srctree;
> +    done
> +else
> +    coccinelle $COCCI $srctree
> +fi

I think it is more usefull to use $M instead of $srctree to run simple
'make coccicheck'.
