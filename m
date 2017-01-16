From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 16 Jan 2017 14:22:11 +0000
Subject: Re: [patch] hfs: fix hfs_readdir()
Message-Id: <20170116142211.GF4104@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160126092611.GD15717@mwanda>
 <1453832336.2633.10.camel@slavad-ubuntu-14.04>
 <20160126191835.GD5273@mwanda>
 <1453845246.2633.17.camel@slavad-ubuntu-14.04>
In-Reply-To: <1453845246.2633.17.camel@slavad-ubuntu-14.04>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: Chengyu Song <csong84@gatech.edu>, Andrew Morton <akpm@linux-foundation.org>, David Howells <dhowells@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

I was reviewing old warnings and I stumbled across this one again.
Although I wrote that &fd.key->cat and "fd.key" are equivalent, I feel
that actually we should be doing the former.  fd.key is a union but we
want the ->cat member of the union.

On Tue, Jan 26, 2016 at 01:54:06PM -0800, Viacheslav Dubeyko wrote:
> On Tue, 2016-01-26 at 22:18 +0300, Dan Carpenter wrote:
> > Hm, I completely didn't see that it was a union instead of a struct.  I
> > still think my fix is actually correct though.  Now that you point out
> > the union, I see that my change is equivalent to just removing the '&'
> > char.
> > 
> > -	memcpy(&rd->key, &fd.key, sizeof(struct hfs_cat_key));
> > +	memcpy(&rd->key, fd.key, sizeof(struct hfs_cat_key));
> > 
> 
> Yeahh, it looks correct right now. The rd is the pointer that includes
> struct hfs_cat_key object. So, we need to use &rd->key. But on another
> side we have struct hfs_find_data object on the stack. And this object
> includes the pointer on union btree_key. We want to copy struct
> hfs_cat_key object and we should use sizeof(struct hfs_cat_key).

I've read this paragraph several times now and I think you are saying
that the patch is correct.

> 
> > We don't want to copy sizeof(*fd.key) because that would write past the
> > end of the destination struct.
> > 
> > On Tue, Jan 26, 2016 at 10:18:56AM -0800, Viacheslav Dubeyko wrote:
> > > Another worry could be the "search_key" field of the struct
> > > hfs_find_data.
> > 
> > I don't understand what you mean here.
> > 
> 
> I mean here that we could have another incorrect copy operations for
> "search_key" field. That's all.

I don't see the bugs you are saying might exist...  ;)

regards,
dan carpenter
