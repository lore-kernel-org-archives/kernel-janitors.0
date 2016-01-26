From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 26 Jan 2016 19:18:35 +0000
Subject: Re: [patch] hfs: fix hfs_readdir()
Message-Id: <20160126191835.GD5273@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160126092611.GD15717@mwanda>
 <1453832336.2633.10.camel@slavad-ubuntu-14.04>
In-Reply-To: <1453832336.2633.10.camel@slavad-ubuntu-14.04>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: Chengyu Song <csong84@gatech.edu>, Andrew Morton <akpm@linux-foundation.org>, David Howells <dhowells@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hm, I completely didn't see that it was a union instead of a struct.  I
still think my fix is actually correct though.  Now that you point out
the union, I see that my change is equivalent to just removing the '&'
char.

-	memcpy(&rd->key, &fd.key, sizeof(struct hfs_cat_key));
+	memcpy(&rd->key, fd.key, sizeof(struct hfs_cat_key));

We don't want to copy sizeof(*fd.key) because that would write past the
end of the destination struct.

On Tue, Jan 26, 2016 at 10:18:56AM -0800, Viacheslav Dubeyko wrote:
> Another worry could be the "search_key" field of the struct
> hfs_find_data.

I don't understand what you mean here.

regards,
dan carpenter
