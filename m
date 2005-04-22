From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 22 Apr 2005 14:32:38 +0000
Subject: Re: [KJ] One question
Message-Id: <20050422143238.GI31439@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============2840846145576596=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050422081037.GA31439@rhum.iomeda.fr>
In-Reply-To: <20050422081037.GA31439@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============2840846145576596==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Domen Puncer (domen@coderock.org) wrote:
> On 22/04/05 10:10 +0200, Christophe Lucas wrote:
> > Hi KJ folks,
> > 
> > I ask me one question and I don't have any correct answer:
> > Could it be made one tool to follow progress about long series of patch
> > about one entry in KJ TODO ?
> > 
> > Such as :
> > .*set_dma_mask patch series
> 
> Something like this?

Yes.

> domen@nd47:~/kernel$ grep ^dma_mask kj-*/{merged,dropped}
> kj-2.6.12-rc1/merged:dma_mask-drivers_atm_lanai
> [snip] 
> kj-2.6.12-rc2/dropped:dma_mask-drivers_block_cciss
> 
> However, dma_mask was a nice example, I don't think I'm so consistent
> with naming for other TODO entries.

Yes, I agreed with you, dma-mask is a cute example :) some of others are not.

> > Some person have made lot of great job on this, but we don't know what
> > is pending, what is rejected.
> > 
> > I know, I can read all archive of KJ ML, thanks :-)
> 
> Well, just the -kj announcements should tell you what was dropped/merged
> since last -kj. It doesn't cover patches, that don't come into -kj, and
> neither the ones that get merged before -kj (it really happens sometimes).

Yes.
Patches which have been merged without the -kj tree could not be
find again. So there is no question about submitted or not.

> > I have tough about one solution, but it is not efficient and correct:
> > 
> > ./linux-x.y.z-suffix/
> > ./linux-x.y.z-suffix/patch-serie/
> > ./linux-x.y.z-suffix/patch-serie/merged/
> > ./linux-x.y.z-suffix/patch-serie/pending/ (commited here)
> > ./linux-x.y.z-suffix/patch-serie/merged/
> 
> Seems similar to merged/series/dropped files.
> 
> > 
> > The problem is : ./linux-x.y.z-suffix/
> 
> Just `cat` all dropped and merged together?

It can be done :)

	~Christophe


--===============2840846145576596==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============2840846145576596==--
