From: Dan Carpenter <error27@gmail.com>
Date: Sat, 10 Jul 2010 09:21:52 +0000
Subject: Re: [PATCH] avoid NULL deference in ext2_xattr_get
Message-Id: <20100710092151.GS19184@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTimwrORk9yfJlSMpVdn1V0sg0tssKhxc-3q1xoMX@mail.gmail.com>
In-Reply-To: <AANLkTimwrORk9yfJlSMpVdn1V0sg0tssKhxc-3q1xoMX@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: shenghui <crosslonelyover@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ext4@vger.kernel.org


Another way to fix this would be to say:

   	ea_idebug(inode, "name=%d.%s, buffer=%p, buffer_size=%ld",
-  		  name_index, name, buffer, (long)buffer_size);
+  		  name_index, name ?: "(null)", buffer, (long)buffer_size);

That would help for debugging.

regards,
dan carpenter


