From: Christophe Lucas <clucas@rotomalug.org>
Date: Tue, 08 Mar 2005 14:09:42 +0000
Subject: Re: [KJ] [PATCH] drivers/isdn/i4l/isdn_v110.c : fix warning
Message-Id: <20050308140942.GZ9952@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============90349265220029484=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050308115618.GY9952@rhum.iomeda.fr>
In-Reply-To: <20050308115618.GY9952@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============90349265220029484==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Alexey Dobriyan (adobriyan@mail.ru) wrote:
> On Tuesday 08 March 2005 13:56, Christophe Lucas wrote:
> > Fix compile warning on drivers/isdn/i4l/isdn_v110.c
> 
> > drivers/isdn/i4l/isdn_v110.c: In function `isdn_v110_stat_callback': 
> > drivers/isdn/i4l/isdn_v110.c:523: warning: 'ret' might be used uninitialized in this function
> 
> > --- linux-2.6.11-vanilla/drivers/isdn/i4l/isdn_v110.c
> > +++ linux-2.6.11/drivers/isdn/i4l/isdn_v110.c
> > @@ -520,7 +520,7 @@ isdn_v110_stat_callback(int idx, isdn_ct
> >  {
> 
> > -	int ret;
> > +	int ret = 0 ;
> 
> 523		int ret;
> 
> 538		for (i=0; i * v->framelen < c->parm.length; i++) {
> 539			if (v->skbidle > 0) {
> 540				v->skbidle--;
> 541				ret = 1;
> 542			} else {
> 543				if (v->skbuser > 0)
> 544					v->skbuser--;
> 545				ret = 0;
> 546			}
> 547		}
> 
> 567		return ret;
> 
> Then we'd never know if somebody passed isdn_ctrl with parm.length == 0, right?

Yes it is. If parm.length == 0 , we return garbage, right ? 
-- 
	~Christophe


--===============90349265220029484==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============90349265220029484==--
