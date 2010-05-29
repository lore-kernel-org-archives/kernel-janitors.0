From: Jean Delvare <khali@linux-fr.org>
Date: Sat, 29 May 2010 07:06:52 +0000
Subject: Re: [patch] video/saa7134: potential null dereferences in debug
Message-Id: <20100529090652.2e8f5e43@hyperion.delvare>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100522201535.GI22515@bicker>
	<20100522225921.585b2d72@hyperion.delvare>
	<20100529012954.25490c3a@pedra>
In-Reply-To: <20100529012954.25490c3a@pedra>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: Dan Carpenter <error27@gmail.com>, "Beholder Intl. Ltd. Dmitry Belimov" <d.belimov@gmail.com>, hermann pitton <hermann-pitton@arcor.de>, Douglas Schilling Landgraf <dougsland@redhat.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 29 May 2010 01:29:54 -0300, Mauro Carvalho Chehab wrote:
> Em Sat, 22 May 2010 22:59:21 +0200
> Jean Delvare <khali@linux-fr.org> escreveu:
> > I would have used "(null)" instead of "<null>" for consistency with
> > lib/vsprintf.c:string().
> > 
> > But more importantly, I suspect that a better fix would be to not call
> > these macros when dev or ir, respectively, is NULL. The faulty dprintk
> > calls in get_key_msi_tvanywhere_plus() and get_key_flydvb_trio() could
> > be replaced with i2cdprintk (which is misnamed IMHO, BTW.)
> 
> Agreed.
> 
> Dan, could you please rework your patch according with Jean's feedback?

He did already.

-- 
Jean Delvare
