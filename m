From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Mon, 17 May 2004 15:11:59 +0000
Subject: Re: [Kernel-janitors] [patch 2.6.6] remove old ifdef'd code from
Message-Id: <20040517081159.4b072adf.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============49916874574881809=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040517124449.GA5034@nd47>
In-Reply-To: <20040517124449.GA5034@nd47>
To: kernel-janitors@vger.kernel.org

--===============49916874574881809==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 17 May 2004 14:44:49 +0200 Domen Puncer wrote:

| Hi.
| 
| I'm not attaching this inline, it's 80k and might make someone unhappy.
| 4 patches are at: http://coderock.org/kernel/janitor/old_ifdefs_scsi-gdth/
| 
| Comments?

They look OK to me.  A couple of small items:

If I were doing these (not saying that this is any kind of
requirement :), I would add:

a.  'diffstat -p1' output
b.  comments like "I built and loaded it.  Don't have hardware
	to test it."

It might be a good idea to check the init and exit sections for
mis-use with something like:
  http://developer.osdl.org/rddunlap/scripts/reference_init26.pl
and report that also.

Or in general just report what you have done in order to have
some confidence in these (any) patches.  (This is meant to be a
general comment, not directed at Domen in particular.)

--
~Randy

--===============49916874574881809==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============49916874574881809==--
