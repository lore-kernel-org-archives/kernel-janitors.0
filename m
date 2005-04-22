From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 22 Apr 2005 08:29:58 +0000
Subject: Re: [KJ] One question
Message-Id: <20050422082958.GB31439@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============74703103213209476=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050422081037.GA31439@rhum.iomeda.fr>
In-Reply-To: <20050422081037.GA31439@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============74703103213209476==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Christophe Lucas (clucas@rotomalug.org) wrote:
> Hi KJ folks,
> 
> I ask me one question and I don't have any correct answer:
> Could it be made one tool to follow progress about long series of patch
> about one entry in KJ TODO ?
> 
> Such as :
> .*set_dma_mask patch series
> 
> Some person have made lot of great job on this, but we don't know what
> is pending, what is rejected.
> 
> I know, I can read all archive of KJ ML, thanks :-)
> 
> I have tough about one solution, but it is not efficient and correct:
> 
> ./linux-x.y.z-suffix/
> ./linux-x.y.z-suffix/patch-serie/
> ./linux-x.y.z-suffix/patch-serie/merged/
> ./linux-x.y.z-suffix/patch-serie/pending/ (commited here)
> ./linux-x.y.z-suffix/patch-serie/merged/

- ./linux-x.y.z-suffix/patch-serie/merged/
+ ./linux-x.y.z-suffix/patch-serie/rejected/

	~Christophe


--===============74703103213209476==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============74703103213209476==--
