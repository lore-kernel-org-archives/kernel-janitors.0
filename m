From: Christophe Lucas <clucas@rotomalug.org>
Date: Sun, 24 Apr 2005 09:36:21 +0000
Subject: Re: [KJ] One question
Message-Id: <20050424093621.GA18734@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============63617567996665758=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050422081037.GA31439@rhum.iomeda.fr>
In-Reply-To: <20050422081037.GA31439@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============63617567996665758==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Tobias Klauser (tklauser@nuerscht.ch) wrote:
> On Fri, Apr 22, 2005 at 10:10:38AM +0200, Christophe Lucas wrote:
> > I ask me one question and I don't have any correct answer:
> > Could it be made one tool to follow progress about long series of patch
> > about one entry in KJ TODO ?
> 
> Generally this is a good idea. Otherwise this puts a lot of work onto
> the KJ maintainer and I'm not sure if he is willing to accept that
> additional work.

Yes, I am aware of this :-(

> 
> > Such as :
> > .*set_dma_mask patch series
> > 
> > Some person have made lot of great job on this, but we don't know what
> > is pending, what is rejected.
> 
> Yup, some maintainers are very good at letting you know about
> accepting/rejecting patches, others are not.

Yes, I know too about this fact.

> > I know, I can read all archive of KJ ML, thanks :-)
> 
> That's what they are for. ;-)
> 
> > I have tough about one solution, but it is not efficient and correct:
> > 
> > ./linux-x.y.z-suffix/
> > ./linux-x.y.z-suffix/patch-serie/
> > ./linux-x.y.z-suffix/patch-serie/merged/
> > ./linux-x.y.z-suffix/patch-serie/pending/ (commited here)
> > ./linux-x.y.z-suffix/patch-serie/merged/
> > 
> > The problem is : ./linux-x.y.z-suffix/
> 
> Exactly. I don't think such a approach will help anyone, kernel versions
> just change too often. And, as mentioned above it puts a lot of work
> onto the maintainer.
> 
> > We do the job again and again...
> 
> Hmmm, most of the time we do not need to start again, we just have to
> adjust the patches. KJ patches are often not very intrusive and do not
> change many lines of code, so this is generally easy.

Yes, but with this kind of approach I think about patches like
printk(KERN*); where the level is high in number of files touched, not
in difficulty.
And read ML archive about one or two years to know exactly what have been
done, is borry to someone which begin to help with janitors things.

> > So perhaps this mail is a waste of your time, so sorry.
> 
> No, it isn't. Ideas/discussion on how to improve work on an issue is
> always good.

Ok, thanks. It was quick ideas I have though, and I want to share with
you. But for now, I think it is only ideas , and can not be applied.

	~Christophe


--===============63617567996665758==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============63617567996665758==--
