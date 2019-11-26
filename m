From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 26 Nov 2019 12:22:52 +0000
Subject: [bug report] octeontx2-af: Dump current resource provisioning status
Message-Id: <20191126122252.bayz6jfencfm4yby@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191121094419.ktgp5w4r7mhclzet@kili.mountain>
In-Reply-To: <20191121094419.ktgp5w4r7mhclzet@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Christina Jacob,

The patch 23205e6d06d4: "octeontx2-af: Dump current resource
provisioning status" from Nov 14, 2019, leads to the following static
checker warning:

	drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c:215 rvu_dbg_rsrc_attach_status()
	warn: userbuf overflow? is 'off' <= 'count'

drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c
   143  static ssize_t rvu_dbg_rsrc_attach_status(struct file *filp,
   144                                            char __user *buffer,
   145                                            size_t count, loff_t *ppos)
                                                  ^^^^^^^^^^^^
The user has a buffer "count" bytes large.

   146  {
   147          int index, off = 0, flag = 0, go_back = 0, off_prev;
   148          struct rvu *rvu = filp->private_data;
   149          int lf, pf, vf, pcifunc;
   150          struct rvu_block block;
   151          int bytes_not_copied;
   152          int buf_size = 2048;
   153          char *buf;
   154  
   155          /* don't allow partial reads */
   156          if (*ppos != 0)
   157                  return 0;
   158  
   159          buf = kzalloc(buf_size, GFP_KERNEL);
   160          if (!buf)
   161                  return -ENOSPC;
   162          off +=  scnprintf(&buf[off], buf_size - 1 - off, "\npcifunc\t\t");
   163          for (index = 0; index < BLK_COUNT; index++)
   164                  if (strlen(rvu->hw->block[index].name))
   165                          off +=  scnprintf(&buf[off], buf_size - 1 - off,
   166                                            "%*s\t", (index - 1) * 2,
   167                                            rvu->hw->block[index].name);
   168          off += scnprintf(&buf[off], buf_size - 1 - off, "\n");
   169          for (pf = 0; pf < rvu->hw->total_pfs; pf++) {
   170                  for (vf = 0; vf <= rvu->hw->total_vfs; vf++) {
   171                          pcifunc = pf << 10 | vf;
   172                          if (!pcifunc)
   173                                  continue;
   174  
   175                          if (vf) {
   176                                  go_back = scnprintf(&buf[off],
   177                                                      buf_size - 1 - off,
   178                                                      "PF%d:VF%d\t\t", pf,
   179                                                      vf - 1);
   180                          } else {
   181                                  go_back = scnprintf(&buf[off],
   182                                                      buf_size - 1 - off,
   183                                                      "PF%d\t\t", pf);
   184                          }
   185  
   186                          off += go_back;
   187                          for (index = 0; index < BLKTYPE_MAX; index++) {
   188                                  block = rvu->hw->block[index];
   189                                  if (!strlen(block.name))
   190                                          continue;
   191                                  off_prev = off;
   192                                  for (lf = 0; lf < block.lf.max; lf++) {
   193                                          if (block.fn_map[lf] != pcifunc)
   194                                                  continue;
   195                                          flag = 1;
   196                                          off += scnprintf(&buf[off], buf_size - 1
   197                                                          - off, "%3d,", lf);
   198                                  }
   199                                  if (flag && off_prev != off)
   200                                          off--;
   201                                  else
   202                                          go_back++;
   203                                  off += scnprintf(&buf[off], buf_size - 1 - off,
   204                                                  "\t");
   205                          }
   206                          if (!flag)
   207                                  off -= go_back;
   208                          else
   209                                  flag = 0;
   210                          off--;
   211                          off +=  scnprintf(&buf[off], buf_size - 1 - off, "\n");
   212                  }
   213          }
   214  
   215          bytes_not_copied = copy_to_user(buffer, buf, off);
                                                             ^^^
So we need to ensure that we don't copy more than "count" bytes into it.

   216          kfree(buf);
   217  
   218          if (bytes_not_copied)
   219                  return -EFAULT;
   220  
   221          *ppos = off;
   222          return off;

regards,
dan carpenter
