From: Ryan Anderson <ryan@autoweb.net>
Date: Wed, 10 Aug 2005 23:31:32 +0000
Subject: Re: [KJ] Re: Kernel Development and Cogito
Message-Id: <20050810233132.GD24400@ryan2>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============475731653142907=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050810202417.GA5387@arthur.home>
In-Reply-To: <20050810202417.GA5387@arthur.home>
To: kernel-janitors@vger.kernel.org

--===============475731653142907==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Aug 10, 2005 at 04:58:57PM -0400, Gabriel Devenyi wrote:
> On August 10, 2005 16:24, Erik Mouw wrote:
> > This one is from Cogito itself:
> >
> >   http://www.kernel.org/pub/software/scm/cogito/README
> 
> Thanks I've read this, I was hoping for a full set of documentation lurking 
> around. I've fooled around a bit more and determined how to do some more 
> things. Does cogito/git output patches in the prefered LKML format 
> automatically? (-p1 etc)

Try: man git-format-patch-script

Specifically:
	git format-patch origin

This will output one file per commit, with the comment, diffstat and
patch in it.

-- 

Ryan Anderson
AutoWeb Communications, Inc.
email: ryan@autoweb.net



--===============475731653142907==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============475731653142907==--
