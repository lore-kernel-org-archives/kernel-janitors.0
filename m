From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date: Sat, 07 Mar 2020 10:01:54 +0000
Subject: Re: [PATCH] MAINTAINERS: adjust to filesystem doc ReST conversion
Message-Id: <20200307110154.719572e4@onda.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200304072950.10532-1-lukas.bulwahn@gmail.com>
        <20200304131035.731a3947@lwn.net>
        <alpine.DEB.2.21.2003042145340.2698@felia>
        <e43f0cf0117fbfa8fe8c7e62538fd47a24b4657a.camel@perches.com>
        <alpine.DEB.2.21.2003062214500.5521@felia>
In-Reply-To: <alpine.DEB.2.21.2003062214500.5521@felia>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Em Fri, 6 Mar 2020 22:17:49 +0100 (CET)
Lukas Bulwahn <lukas.bulwahn@gmail.com> escreveu:

> On Wed, 4 Mar 2020, Joe Perches wrote:
> 
> > On Wed, 2020-03-04 at 21:50 +0100, Lukas Bulwahn wrote:  
> > > 
> > > On Wed, 4 Mar 2020, Jonathan Corbet wrote:
> > >   
> > > > On Wed,  4 Mar 2020 08:29:50 +0100
> > > > Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:  
> > > > > Jonathan, pick pick this patch for doc-next.  
> > > > 
> > > > Sigh, I need to work a MAINTAINERS check into my workflow...
> > > >   
> > > 
> > > I getting closer to have zero warnings on the MAINTAINER file matches and 
> > > then, I would set up a bot following the mailing lists to warn when anyone
> > > sends a patch that potentially introduces such warning.  
> > 
> > Hey Lukas.
> > 
> > I wrote a hacky script that sent emails
> > for invalid MAINTAINER F: and X: patterns
> > a couple years back.
> > 
> > I ran it in September 2018 and March 2019.
> > 
> > It's attached if you want to play with it.
> > The email sending bit is commented out.
> > 
> > The script is used like:
> > 
> > $ perl ./scripts/get_maintainer.pl --self-test=patterns | \
> >   cut -f2 -d: | \
> >   while read line ; do \
> >     perl ./dump_section.perl $line \
> >   done
> >   
> 
> Thanks, Joe. That is certainly helpful, I will try to make use of it in 
> the future; fortunately, there really not too many invalid F: patterns 
> left, and I can send the last few patches out myself.

Talking about problems at MAINTAINERS file, while the entries are
supposed to be in alphabetical order, there are some things at the
wrong place there.

This can easily seen with:

	$ cat MAINTAINERS |grep -E '^[A-Z][A-Z]' >a;sort -f a >b;diff -U1 a b|less

See for example the first hunk:

@@ -54,3 +54,2 @@
 ALACRITECH GIGABIT ETHERNET DRIVER
-FORCEDETH GIGABIT ETHERNET DRIVER
 ALCATEL SPEEDTOUCH USB DRIVER

The FORCEDETH entry is completely misplaced.

Same happens here:

@@ -529,4 +529,2 @@
 DIOLAN U2C-12 I2C DRIVER
-FILESYSTEM DIRECT ACCESS (DAX)
-DEVICE DIRECT ACCESS (DAX)
 DIRECTORY NOTIFICATION (DNOTIFY)

With this name, the FILESYSTEM DIRECT ACCESS (DAX) is also misplaced.
Maybe it was called something else starting with DEVICE in the past?

In any case, I wonder if it would make sense to re-order at least those 
completely out order entries. On a quick check,  there are only 16 entries
that seem to be really wrong, if we compare just the first two
characters of the entries names.

I'm using this small perl script to check:

	open IN, "MAINTAINERS";
	my $prev = "00";
	while (<IN>) {
		next if (m/THE REST/);
		if (m/^([A-Z\d][A-Z\d])/) {
			$cur = $1;
			$entry = $_;
			$entry =~ s/\s+$//;
			print "$entry < $full_prev\n" if ($cur lt $prev);
			$prev = $cur;
			$full_prev = $entry;
		}
	}

It got those results:

	ALCATEL SPEEDTOUCH USB DRIVER < FORCEDETH GIGABIT ETHERNET DRIVER
	AMAZON ANNAPURNA LABS FIC DRIVER < ARM PRIMECELL VIC PL190/PL192 DRIVER
	802.11 (including CFG80211/NL80211) < CFAG12864BFB LCD FRAMEBUFFER DRIVER
	DEVICE DIRECT ACCESS (DAX) < FILESYSTEM DIRECT ACCESS (DAX)
	GASKET DRIVER FRAMEWORK < GCC PLUGINS
	NXP FSPI DRIVER < OBJAGG
	OMFS FILESYSTEM < ONION OMEGA2+ BOARD
	FLYSKY FSIA6B RC RECEIVER < PHOENIX RC FLIGHT CONTROLLER ADAPTER
	HANTRO VPU CODEC DRIVER < ROCKCHIP RASTER 2D GRAPHIC ACCELERATION UNIT DRIVER
	REALTEK WIRELESS DRIVER (rtlwifi family) < RTL8187 WIRELESS DRIVER
	EMMC CMDQ HOST CONTROLLER INTERFACE (CQHCI) DRIVER < SECURE DIGITAL HOST CONTROLLER INTERFACE (SDHCI) DRIVER
	SECURE DIGITAL HOST CONTROLLER INTERFACE (SDHCI) MICROCHIP DRIVER < SYNOPSYS SDHCI COMPLIANT DWC MSHC DRIVER
	SERIAL LOW-POWER INTER-CHIP MEDIA BUS (SLIMbus) < SLEEPABLE READ-COPY UPDATE (SRCU)
	EXTRA BOOT CONFIG < STMMAC ETHERNET DRIVER
	TEMPO SEMICONDUCTOR DRIVERS < TRIVIAL PATCHES
	RCMM REMOTE CONTROLS DECODER < WINBOND CIR DRIVER

	
Regards,
Mauro
