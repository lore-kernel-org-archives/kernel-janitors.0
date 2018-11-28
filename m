From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 28 Nov 2018 11:13:26 +0000
Subject: [bug report] x86/resctrl: Bring cbm_validate() into the resource structure
Message-Id: <20181128111326.lwlqngnwmdslnbs2@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Babu Moger,

The patch a36c5ff560fb: "x86/resctrl: Bring cbm_validate() into the
resource structure" from Nov 21, 2018, leads to the following static
checker warning:

	arch/x86/kernel/cpu/resctrl/ctrlmondata.c:227 parse_cbm()
	error: uninitialized symbol 'cbm_val'.

arch/x86/kernel/cpu/resctrl/ctrlmondata.c
   201  int parse_cbm(struct rdt_parse_data *data, struct rdt_resource *r,
   202                struct rdt_domain *d)
   203  {
   204          struct rdtgroup *rdtgrp = data->rdtgrp;
   205          u32 cbm_val;
   206  
   207          if (d->have_new_ctrl) {
   208                  rdt_last_cmd_printf("Duplicate domain %d\n", d->id);
   209                  return -EINVAL;
   210          }
   211  
   212          /*
   213           * Cannot set up more than one pseudo-locked region in a cache
   214           * hierarchy.
   215           */
   216          if (rdtgrp->mode = RDT_MODE_PSEUDO_LOCKSETUP &&
   217              rdtgroup_pseudo_locked_in_hierarchy(d)) {
   218                  rdt_last_cmd_printf("Pseudo-locked region in hierarchy\n");
   219                  return -EINVAL;
   220          }
   221  
   222          if (r->cbm_validate && !r->cbm_validate(data->buf, &cbm_val, r))
                    ^^^^^^^^^^^^^^^
Assume this is NULL

   223                  return -EINVAL;
   224  
   225          if ((rdtgrp->mode = RDT_MODE_EXCLUSIVE ||
   226               rdtgrp->mode = RDT_MODE_SHAREABLE) &&
   227              rdtgroup_cbm_overlaps_pseudo_locked(d, cbm_val)) {
                                                           ^^^^^^^
Then this is where Smatch complains that it's uninitialized.

   228                  rdt_last_cmd_printf("CBM overlaps with pseudo-locked region\n");
   229                  return -EINVAL;
   230          }
   231  


regards,
dan carpenter
