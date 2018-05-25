From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 25 May 2018 13:21:57 +0000
Subject: Re: [PATCH v2] media: davinci vpbe: array underflow in vpbe_enum_outputs()
Message-Id: <20180525132157.rx3fuvzytpsuysft@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180525131239.45exrwgxr2f3kb57@kili.mountain>
 <a322043a-5b45-b695-4302-173c5111896b@xs4all.nl>
In-Reply-To: <a322043a-5b45-b695-4302-173c5111896b@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Manjunath Hadli <manjunath.hadli@ti.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, May 25, 2018 at 03:16:21PM +0200, Hans Verkuil wrote:
> On 25/05/18 15:12, Dan Carpenter wrote:
> > In vpbe_enum_outputs() we check if (temp_index >= cfg->num_outputs) but
> > the problem is that temp_index can be negative.  I've made
> > cgf->num_outputs unsigned to fix this issue.
> 
> Shouldn't temp_index also be made unsigned? It certainly would make a lot of
> sense to do that.

Yeah, sure.  It doesn't make any difference in terms of runtime but it's
probably cleaner.

regards,
dan carpenter

