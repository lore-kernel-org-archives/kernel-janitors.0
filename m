From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Mon, 24 May 2004 00:47:18 +0000
Subject: Re: [Kernel-janitors] [PATCH] yield() replaced with
Message-Id: <20040523174718.18bcfa7f.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============10284168315010467=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.SOL.4.31.0405201148160.28451-200000@bodega.cs.umass.edu>
In-Reply-To: <Pine.SOL.4.31.0405201148160.28451-200000@bodega.cs.umass.edu>
To: kernel-janitors@vger.kernel.org

--===============10284168315010467==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 23 May 2004 21:14:36 -0300 Gustavo Franco <stratus@acm.org> wrote:

| maximilian attems wrote:
| > hey gustavo,
| > 
| > On Thu, 20 May 2004, Gustavo Franco wrote:
| > 
| > 
| >>I don't think that it's a search and replace issue and i've already 
| >>posted some of these patches
| >>(checked by me and by the list). Just check the archives! Some of them 
| >>were not processed
| >>by Randy, right Randy? But i hope that acme will look into it.
| > 
| > 
| > please when rediffing next time - take into account:
| > 1) patch-level one deeper than all the patches i saw from you
| > 2) do not strip the diff line above the acutal patch.
| 
| Hi,
| 
| I can do that if acme request, but actually i'm just following the
| SubmittingPatches.
| 
| <quote>
| To create a patch for a single file, it is often sufficient to do:
|  
| 
|          SRCTREE= /devel/linux-2.4
|          MYFILE=  drivers/net/mydriver.c
|  
| 
|          cd $SRCTREE
|          cp $MYFILE $MYFILE.orig
|          vi $MYFILE      # make your change
|          diff -up $MYFILE.orig $MYFILE > /tmp/patch
| </quote>
| 
| Let me known if the documentation is wrong and/or obsoleted and if i'm
| missing something.

Gustavo,
What kernel version are you seeing this in?
This (above) has been incorrect for quite some time now and was
recently corrected (on 2004-april-26).
Look in a 2.6.6 source tree.

--
~Randy

--===============10284168315010467==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============10284168315010467==--
