From: Greg KH <greg@kroah.com>
Date: Wed, 04 Jan 2006 05:43:26 +0000
Subject: Re: [KJ] adding missing MODULE_* stuffs
Message-Id: <20060104054325.GB898@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============013477748322027416=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051230000400.GS18040@outflux.net>
In-Reply-To: <20051230000400.GS18040@outflux.net>
To: kernel-janitors@vger.kernel.org

--===============013477748322027416==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 03, 2006 at 09:18:16PM -0800, Kees Cook wrote:
> On Tue, Jan 03, 2006 at 08:27:09PM -0800, Greg KH wrote:
> > I said that?  Hm, looks like Jean did, not I :)
> 
> Oh, whoops.  I scrolled up just enough to find your name.  ;)
> 
> > > Notably, AUTHOR, DESCRIPTION, and VERSION seem to be missing from the 
> > > various examples in Documention/
> > 
> > What examples?
> 
> i2c/porting-clients (instructions, rather than code)
> i2c/writing-clients (same)
> sound/alsa/DocBook/writing-an-alsa-driver.tmpl
> firmware_class/firmware_sample_driver.c
> firmware_class/firmware_sample_firmware_class.c
> connector/cn_test.c
> DocBook/kernel-hacking.tmpl (not really an example, more a description)
> DocBook/videobook.tmpl
> DocBook/procfs_example.c
> kprobes.txt
> 
> What I was really in the mood for was adding those things to the rest of 
> the code tree too.  There are plenty of modules that have authors, 
> versions, and descriptions listed in comments and #define's, but not 
> marked up in MODULE_*() syntax.

Sure, start in a directory and work through them all :)

Good luck,

greg k-h

--===============013477748322027416==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============013477748322027416==--
