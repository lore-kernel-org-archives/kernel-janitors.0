From: shenghui <crosslonelyover@gmail.com>
Date: Tue, 13 Jul 2010 23:47:36 +0000
Subject: Re: [PATCH] ext2: return -ENODATA for NULL i_file_acl in
Message-Id: <AANLkTinbNujdr6qM7kMyOLFMqjRibwvLZIfMB6J3MzX3@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4C3C7E59.8040905@gmail.com>
	<7D4617C2-565E-4F34-94B4-3F308EB75D18@dilger.ca>
In-Reply-To: <7D4617C2-565E-4F34-94B4-3F308EB75D18@dilger.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Andreas Dilger <adilger@dilger.ca>
Cc: kernel-janitors <kernel-janitors@vger.kernel.org>, linux-ext4 <linux-ext4@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

2010/7/14 Andreas Dilger <adilger@dilger.ca>:
> The "error" value gets overwritten almost immediately with -EIO, and then at the end of the function if there is an xattr block but it doesn't contain any attributes (I'm not sure if this could happen, but it seems possible) it will return "error = buffer_size - rest;  /* total size */", so 0 if "rest" was not changed from its initial value of buffer_size.
>
> The question is why this return value should be changed to -ENODATA in the first place?  This isn't true for ext3_xattr_list() or ext4_xattr_list().  I tend to think it is not an error to get back an empty list, and applications shouldn't treat it as such.  Most applications will check "if (rc < 0)" and treat it as an error.  This is different than e.g. requesting a specific value by name (which does return -ENODATA) because it would otherwise be ambiguous whether the xattr existed but had zero size or didn't exist at all.
>

Thanks for your explanation!

-- 


Thanks and Best Regards,
shenghui
