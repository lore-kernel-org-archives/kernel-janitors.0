From: Gustavo Franco <stratus@acm.org>
Date: Mon, 24 May 2004 01:10:48 +0000
Subject: Re: [Kernel-janitors] [PATCH] yield() replaced with
Message-Id: <40B14B98.7040801@acm.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============14103388198845268=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.SOL.4.31.0405201148160.28451-200000@bodega.cs.umass.edu>
In-Reply-To: <Pine.SOL.4.31.0405201148160.28451-200000@bodega.cs.umass.edu>
To: kernel-janitors@vger.kernel.org

--===============14103388198845268==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Randy.Dunlap wrote:
> On Sun, 23 May 2004 21:14:36 -0300 Gustavo Franco <stratus@acm.org> wrote:
> 
> | maximilian attems wrote:
> | > hey gustavo,
> | > 
> | > On Thu, 20 May 2004, Gustavo Franco wrote:
> | > 
> | > 
> | >>I don't think that it's a search and replace issue and i've already 
> | >>posted some of these patches
> | >>(checked by me and by the list). Just check the archives! Some of them 
> | >>were not processed
> | >>by Randy, right Randy? But i hope that acme will look into it.
> | > 
> | > 
> | > please when rediffing next time - take into account:
> | > 1) patch-level one deeper than all the patches i saw from you
> | > 2) do not strip the diff line above the acutal patch.
> | 
> | Hi,
> | 
> | I can do that if acme request, but actually i'm just following the
> | SubmittingPatches.
> | 
> | <quote>
> | To create a patch for a single file, it is often sufficient to do:
> |  
> | 
> |          SRCTREE= /devel/linux-2.4
> |          MYFILE=  drivers/net/mydriver.c
> |  
> | 
> |          cd $SRCTREE
> |          cp $MYFILE $MYFILE.orig
> |          vi $MYFILE      # make your change
> |          diff -up $MYFILE.orig $MYFILE > /tmp/patch
> | </quote>
> | 
> | Let me known if the documentation is wrong and/or obsoleted and if i'm
> | missing something.
> 
> Gustavo,
> What kernel version are you seeing this in?
> This (above) has been incorrect for quite some time now and was
> recently corrected (on 2004-april-26).
> Look in a 2.6.6 source tree.

Hi list,

I've checked the 'new' SubmittingPatches now, the current instructions 
are obviously there but i was just following the previous, since i'm not
reading the rules for each patch.My failure here.


Sorry and thank you Randy and Maximiliam.

--
Gustavo Franco



--===============14103388198845268==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============14103388198845268==--
