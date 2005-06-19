From: Domen Puncer <domen@coderock.org>
Date: Sun, 19 Jun 2005 19:50:59 +0000
Subject: Re: [KJ] init_module / cleanup_module cleanup
Message-Id: <20050619195059.GB6455@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============9637277151091912=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42984D00.8070003@reiner-h.de>
In-Reply-To: <42984D00.8070003@reiner-h.de>
To: kernel-janitors@vger.kernel.org

--===============9637277151091912==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Sorry it took so long for me to reply.

On 29/05/05 15:42 +0200, Reiner Herrmann wrote:
> Domen Puncer wrote:
> > Missing "Signed-off-by:";
> > Patch should probably be split per dir (diffsplit -d) and if some patch
> > touches >1 file of a driver, per driver.
> In my opinion in this case it is OK, if there is only one patch,
> because I did only a single logical change to these files.

Still it makes some sense to put wireless, tokenring etc. in
different patches. But i'm just nitpicking.

> 
> > Also, diffstat -p1 when patching multiple files is great.
> > (http://www.zip.com.au/~akpm/linux/patches/stuff/tpp.txt is a nice
> >  read).
> Thank you for the hint. I'll use this tool from now on.
> 
> >>diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/wireless/wavelan.c linux-2.6.12-rc5-kj/drivers/net/wireless/wavelan.c
> >>--- vanilla-2.6.12-rc5-kj/drivers/net/wireless/wavelan.c	2005-03-02 08:38:26.000000000 +0100
> >>+++ linux-2.6.12-rc5-kj/drivers/net/wireless/wavelan.c	2005-05-28 01:10:59.000000000 +0200
> > 
> > 
> > This one (and probably some others) won't compile on !MODULE, because
> > it includes wavelan.p.h with variables only defined on MODULE.
> > 
> > An ugly hack i used to quickly compile test it:
> > 	egrep "^--- " ~/netdrivers_module_cleanup.diff | cut -f2 -d' '| cut -f1 | cut -f2- -d'/' | sed 's/.c$/.o/g' | xargs -n1 make 2>&1
> 
> The appended patch should now be correct.

Doesn't look like, on at least !MODULE:
	domen@nd47:~/kernel/a$ wc -l netdrivers_*
	  399 netdrivers_not_patched
	  429 netdrivers_patched
	  828 total
	domen@nd47:~/kernel/a$ grep error -c netdrivers_*
	netdrivers_not_patched:113
	netdrivers_patched:128

A nice example is tms380tr which compiled cleanly before, but fails
now.

--===============9637277151091912==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============9637277151091912==--
