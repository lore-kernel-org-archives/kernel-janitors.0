From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 24 Apr 2015 12:23:23 +0000
Subject: Re: [PATCH] fs/compat: remove redundant 'less than zero' check
Message-Id: <alpine.DEB.2.10.1504241423060.2949@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1429870070-30310-1-git-send-email-firogm@gmail.com> <20150424120453.GO14154@mwanda>
In-Reply-To: <20150424120453.GO14154@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Firo Yang <firogm@gmail.com>, viro@zeniv.linux.org.uk, kernel-janitors@vger.kernel.org, linux-fsdevel@vger.kernel.org

On Fri, 24 Apr 2015, Dan Carpenter wrote:

> On Fri, Apr 24, 2015 at 06:07:50PM +0800, Firo Yang wrote:
>
> > -	if (nr_segs > UIO_MAXIOV || nr_segs < 0)
> > +	if (nr_segs > UIO_MAXIOV)
>
> Linus said at kernel summit that he thinks this kind of checks are ok.
>
> Smatch already ignores checks like:
>
> 	if (nr_segs < 0 || nr_segs > UIO_MAXIOV)
>
> So making it ignore this one as well shouldn't be hard...  I'll change
> Smatch to ignore this one as well.

It is unsigned.  What is the point of cluttering the code?

julia

>
> regards,
> dan carpenter
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
