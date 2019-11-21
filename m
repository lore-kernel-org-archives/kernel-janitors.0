From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 21 Nov 2019 09:44:19 +0000
Subject: [bug report] octeontx2-af: Dump current resource provisioning status
Message-Id: <20191121094419.ktgp5w4r7mhclzet@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Christina Jacob,

The patch 23205e6d06d4: "octeontx2-af: Dump current resource
provisioning status" from Nov 14, 2019, leads to the following static
checker warning:

	drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c:167 rvu_dbg_rsrc_attach_status()
	warn: was precision intended? '(index - 1) * 2'

drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c
   143  static ssize_t rvu_dbg_rsrc_attach_status(struct file *filp,
   144                                            char __user *buffer,
   145                                            size_t count, loff_t *ppos)
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

This is a static checker false positive, because width is clearly
intended but on the first iteration throught the loop the precision
is -2 which is sort of weird.

Each column here would be 2 charaters wider than the last.  That's also
sort of weird.

The other comment that I have here is that the -1 in "buf_size - 1 -
off" is not required.  scnprintf() will always ensure that the string
is NUL terminated.

   168          off += scnprintf(&buf[off], buf_size - 1 - off, "\n");
   169          for (pf = 0; pf < rvu->hw->total_pfs; pf++) {
   170                  for (vf = 0; vf <= rvu->hw->total_vfs; vf++) {
   171                          pcifunc = pf << 10 | vf;
   172                          if (!pcifunc)
   173                                  continue;
   174  

regards,
dan carpenter
