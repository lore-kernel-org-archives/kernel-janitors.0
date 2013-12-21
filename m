From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 21 Dec 2013 21:37:48 +0000
Subject: Re: GenWQE Character device and DDCB queue
Message-Id: <20131221213748.GY5443@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131220210140.GA32504@elgon.mountain>
In-Reply-To: <20131220210140.GA32504@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Dec 21, 2013 at 08:40:39PM +0100, Frank Haverkamp wrote:
> >  The caller doesn't check the
> > error immediately; is that an information leak bug?
> 
> I think it is ok the way it is.

Yes.  You are right, of course.  I didn't look at this carefully.

regards,
dan carpenter

