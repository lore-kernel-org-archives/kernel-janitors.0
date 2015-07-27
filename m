From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 27 Jul 2015 15:45:05 +0000
Subject: re: Orangefs: kernel client part 2
Message-Id: <20150727154505.GA16624@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Mike Marshall,

The patch ac6163f8a3f3: "Orangefs: kernel client part 2" from Jul 17,
2015, leads to the following static checker warning:

	fs/orangefs/dir.c:256 pvfs2_readdir()
	warn: bool is not less than zero.

fs/orangefs/dir.c
   249          if (pos = 0) {
   250                  ino = get_ino_from_khandle(dentry->d_inode);
   251                  gossip_debug(GOSSIP_DIR_DEBUG,
   252                               "%s: calling dir_emit of \".\" with pos = %llu\n",
   253                               __func__,
   254                               llu(pos));
   255                  ret = dir_emit(ctx, ".", 1, ino, DT_DIR);
   256                  if (ret < 0)
                            ^^^^^^^
Most callers don't check for negative here.  I have no idea about fs/
though so I'm not sure what was intended.

   257                          goto out_destroy_handle;
   258                  ctx->pos++;
   259                  gossip_ldebug(GOSSIP_DIR_DEBUG,
   260                                "%s: ctx->pos:%lld\n",
   261                                __func__,
   262                                lld(ctx->pos));
   263                  pos++;
   264          }


regards,
dan carpenter
