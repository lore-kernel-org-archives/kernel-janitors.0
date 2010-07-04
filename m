From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sun, 04 Jul 2010 08:41:21 +0000
Subject: Re: [PATCH] coccicheck: use $KBUILD_EXTMOD when available
Message-Id: <20100704084118.GA32612@shinshilla>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278170438-8136-1-git-send-email-segooon@gmail.com>
 <201007032149.30704.npalix@diku.dk>
In-Reply-To: <201007032149.30704.npalix@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Palix <npalix@diku.dk>
Cc: Kernel Janitors <kernel-janitors@vger.kernel.org>, Julia Lawall <julia@diku.dk>, Gilles Muller <Gilles.Muller@lip6.fr>, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, Joerg Roedel <joerg.roedel@amd.com>, cocci@diku.dk, linux-kernel@vger.kernel.org

Hi,

On Sat, Jul 03, 2010 at 21:49 +0200, Nicolas Palix wrote:
> Hi,
> 
> On Saturday 03 July 2010 17:20:34 Kulikov Vasiliy wrote:
> > Use $KBUILD_EXTMOD instead of $srctree when the latter is not null
> > to use make M=somedir.
> > 
> > Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
> > ---
> >  scripts/coccicheck |    8 +++++++-
> >  1 files changed, 7 insertions(+), 1 deletions(-)
> > 
> > diff --git a/scripts/coccicheck b/scripts/coccicheck
> > index b8bcf1f..7d66a55 100755
> > --- a/scripts/coccicheck
> > +++ b/scripts/coccicheck
> > @@ -1,5 +1,11 @@
> >  #!/bin/sh
> >  
> > +if [ -n "$KBUILD_EXTMOD" ]; then
> > +	CHECK_DIR="$KBUILD_EXTMOD"
> > +else
> > +	CHECK_DIR="$srctree"
> > +fi
> > +
> >  SPATCH="`which ${SPATCH:=spatch}`"
> >  
> >  if [ "$C" = "1" -o "$C" = "2" ]; then
> > @@ -64,7 +70,7 @@ coccinelle () {
> >  	echo ' http://coccinelle.lip6.fr/'
> >  	echo ''
> >  
> > -	$SPATCH -D $MODE $FLAGS -sp_file $COCCI $OPT -dir $srctree || exit 1
> > +	$SPATCH -D $MODE $FLAGS -sp_file $COCCI $OPT -dir $CHECK_DIR || exit 1
> >      else
> >  	$SPATCH -D $MODE $FLAGS -sp_file $COCCI $OPT $OPTIONS || exit 1
> >      fi
> > 
> 
> In doing so, the output of the patch mode will produce patches relative to $KBUILD_EXTMOD.
> I am not sure of what most of developers want but if the patches must be relative to
> the Linux kernel root, the following patch must be used.
> 
> Any preference ?
> 
> 
> diff --git a/scripts/coccicheck b/scripts/coccicheck
> index b8bcf1f..cda66a3 100755
> --- a/scripts/coccicheck
> +++ b/scripts/coccicheck
> @@ -1,5 +1,12 @@
>  #!/bin/sh
>  
> +if [ -n "$KBUILD_EXTMOD" ]; then
> +       CHECK_DIR="$srctree/$KBUILD_EXTMOD"
> +       FLAGS="-patch $srctree"

$KBUILD_EXTMOD may be fullpath, e.g.:

make -C ../../.. M=$PWD
                 ^^^^^^
So, I've got an error:
ERROR: File /home/vasya/dev/linux-next//home/vasya/linux/drivers/staging/sep does not exist: No such file or directory


With 

CHECK_DIR="$KBUILD_EXTMOD"
FLAGS="-patch $srctree"

I've got such diff lines:
--- /home/vasya/linux/drivers/staging/spectra/flash.c   2010-07-02 17:38:48.764253994 +0400
+++ /tmp/nothing

It is not good too.
