From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Jul 2018 12:35:48 +0000
Subject: [bug report] fat: add FITRIM ioctl for FAT file system
Message-Id: <20180712123543.uuaxqborpnegtn4g@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Wentao Wang,

The patch 5ff9a8687feb: "fat: add FITRIM ioctl for FAT file system"
from Jul 11, 2018, leads to the following static checker warning:

	fs/fat/fatent.c:791 fat_trim_fs()
	warn: should 'trimmed << sbi->cluster_bits' be a 64 bit type?

fs/fat/fatent.c
   702  int fat_trim_fs(struct inode *inode, struct fstrim_range *range)
   703  {
   704          struct super_block *sb = inode->i_sb;
   705          struct msdos_sb_info *sbi = MSDOS_SB(sb);
   706          const struct fatent_operations *ops = sbi->fatent_ops;
   707          struct fat_entry fatent;
   708          u64 ent_start, ent_end, minlen;
   709          u32 free = 0, trimmed = 0;
                ^^^           ^^^^^^^^^^^
   710          unsigned long reada_blocks, reada_mask, cur_block = 0;
   711          int err = 0;
   712  
   713          /*
   714           * FAT data is organized as clusters, trim at the granulary of cluster.
   715           *
   716           * fstrim_range is in byte, convert vaules to cluster index.
   717           * Treat sectors before data region as all used, not to trim them.
   718           */
   719          ent_start = max_t(u64, range->start>>sbi->cluster_bits, FAT_START_ENT);
   720          ent_end = ent_start + (range->len >> sbi->cluster_bits) - 1;
   721          minlen = range->minlen >> sbi->cluster_bits;
   722  
   723          if (ent_start >= sbi->max_cluster || range->len < sbi->cluster_size)
   724                  return -EINVAL;
   725          if (ent_end >= sbi->max_cluster)
   726                  ent_end = sbi->max_cluster - 1;
   727  
   728          reada_blocks = FAT_READA_SIZE >> sb->s_blocksize_bits;
   729          reada_mask = reada_blocks - 1;
   730  
   731          fatent_init(&fatent);
   732          lock_fat(sbi);
   733          fatent_set_entry(&fatent, ent_start);
   734          while (fatent.entry <= ent_end) {
   735                  /* readahead of fat blocks */
   736                  if ((cur_block & reada_mask) = 0) {
   737                          unsigned long rest = sbi->fat_length - cur_block;
   738                          fat_ent_reada(sb, &fatent, min(reada_blocks, rest));
   739                  }
   740                  cur_block++;
   741  
   742                  err = fat_ent_read_block(sb, &fatent);
   743                  if (err)
   744                          goto error;
   745                  do {
   746                          if (ops->ent_get(&fatent) = FAT_ENT_FREE) {
   747                                  free++;
   748                          } else if (free) {
   749                                  if (free >= minlen) {
   750                                          u32 clus = fatent.entry - free;
   751  
   752                                          err = fat_trim_clusters(sb, clus, free);
   753                                          if (err && err != -EOPNOTSUPP)
   754                                                  goto error;
   755                                          if (!err)
   756                                                  trimmed += free;
   757                                          err = 0;
   758                                  }
   759                                  free = 0;
   760                          }
   761                  } while (fat_ent_next(sbi, &fatent) && fatent.entry <= ent_end);
   762  
   763                  if (fatal_signal_pending(current)) {
   764                          err = -ERESTARTSYS;
   765                          goto error;
   766                  }
   767  
   768                  if (need_resched()) {
   769                          fatent_brelse(&fatent);
   770                          unlock_fat(sbi);
   771                          cond_resched();
   772                          lock_fat(sbi);
   773                  }
   774          }
   775          /* handle scenario when tail entries are all free */
   776          if (free && free >= minlen) {
   777                  u32 clus = fatent.entry - free;
   778  
   779                  err = fat_trim_clusters(sb, clus, free);
   780                  if (err && err != -EOPNOTSUPP)
   781                          goto error;
   782                  if (!err)
   783                          trimmed += free;
   784                  err = 0;
   785          }
   786  
   787  error:
   788          fatent_brelse(&fatent);
   789          unlock_fat(sbi);
   790  
   791          range->len = trimmed << sbi->cluster_bits;
                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Potential shift wrap?  "range->len" is a u64 but we only use the bottom
32 bits.

   792  
   793          return err;
   794  }

regards,
dan carpenter
