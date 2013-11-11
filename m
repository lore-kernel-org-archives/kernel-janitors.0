From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 11 Nov 2013 15:42:25 +0000
Subject: re: Squashfs: Refactor decompressor interface and code
Message-Id: <20131111154225.GA4779@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Phillip Lougher,

The patch ac379b0dec4b: "Squashfs: Refactor decompressor interface
and code" from Oct 7, 2013, leads to the following
static checker warning: "fs/squashfs/decompressor.c:138
squashfs_decompressor_setup()
	 warn: 'comp_opts' was already freed."

fs/squashfs/decompressor.c
   128  void *squashfs_decompressor_setup(struct super_block *sb, unsigned short flags)
   129  {
   130          struct squashfs_sb_info *msblk = sb->s_fs_info;
   131          void *stream, *comp_opts = get_comp_opts(sb, flags);
   132  
   133          if (IS_ERR(comp_opts))
   134                  return comp_opts;
   135  
   136          stream = squashfs_decompressor_create(msblk, comp_opts);
   137          if (IS_ERR(stream))
   138                  kfree(comp_opts);

The _single version of squashfs_decompressor_create() frees comp_opts
but the _multi version doesn't.  I'm not sure what the right thing to do
is here.

   139  
   140          return stream;
   141  }

regards,
dan carpenter

