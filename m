From: David Howells <dhowells@redhat.com>
Date: Sun, 12 May 2019 18:10:45 +0000
Subject: Re: [PATCH 2/2] afs: Fix afs_xattr_get_yfs() to not try freeing an error value
Message-Id: <31808.1557684645@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5CD844B0.5060206@bfs.de> <155764714099.24080.1233326575922058381.stgit@warthog.procyon.org.uk> <155764714872.24080.15171754166782593095.stgit@warthog.procyon.org.uk>
In-Reply-To: <5CD844B0.5060206@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wharms@bfs.de
Cc: dhowells@redhat.com, colin.king@canonical.com, joe@perches.com, jaltman@auristor.com, linux-afs@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

walter harms <wharms@bfs.de> wrote:

> > +	ret = dsize;
> > +	if (size > 0) {
> > +		if (dsize > size) {
> > +			ret = -ERANGE;
> > +			goto error_key;
> >  		}
> > +		memcpy(buffer, data, dsize);
> >  	}
> >  
> 
> i am confused: if size is <= 0 then the error is in dsize ?

See this bit, before that hunk:

> +	if (ret < 0)
> +		goto error_key;

David
