From: Dan Carpenter <error27@gmail.com>
Date: Tue, 30 Mar 2010 09:40:16 +0000
Subject: Re: [patch v2] batman: cleanup: change test for end of array
Message-Id: <20100330094016.GG5069@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100328131335.GY5069@bicker>
In-Reply-To: <20100328131335.GY5069@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Mar 30, 2010 at 10:08:15AM +0800, Marek Lindner wrote:
> On Monday 29 March 2010 16:11:34 Dan Carpenter wrote:
> > > I might be mistaken but it looks like the "&" is wrong here. Shouldn't it
> > > be: memset(device_client_hash, 0, sizeof(device_client_hash));
> > 
> > Either way works.
> 
> Ok, I committed it without the "&" - makes me sleep better.  ;-)
> 

Cool.

regars,
dan carpenter

> Thanks for the patch,
> Marek
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
