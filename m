From: Greentime Hu <green.hu@gmail.com>
Date: Fri, 13 Jul 2018 10:13:04 +0000
Subject: Re: [bug report] nds32: Loadable modules
Message-Id: <CAEbi=3f9tBYZ9sSN9GLAE_m1=w9v67xwfg7EMJrLkhLXnC4tnQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180712124159.h7kqf2hamut2idhd@kili.mountain>
In-Reply-To: <20180712124159.h7kqf2hamut2idhd@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> 於 2018年7月13日 週五 下午2:51寫道：
>
> On Fri, Jul 13, 2018 at 02:03:52PM +0800, Greentime Hu wrote:
> > Hi Dan,
> >
> > You are right. We should use ~loc_mask. Thank you for finding it.
> > Would you like to sent a patch for this or should I just create one
> > patch with your signed-off-by?
>
> Signed-off-by means I sign a legal document saying I didn't steal Darl
> McBride's precious SCO codes...  It's not the right thing for someone
> else to sign.  But could you give me a reported by tag?
>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>

OK. I will add the Reported-by tag.
You know that I have to add my signed-off-by to the patch if I commit
it to my tree.
