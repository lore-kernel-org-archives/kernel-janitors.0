From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 27 Nov 2020 09:58:39 +0000
Subject: [bug report] octeontx2-af: Add mbox messages to install and delete MCAM rules
Message-Id: <20201127095839.GA10400@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Subbaraya Sundeep,

This is a semi-automatic email about new static checker warnings.

The patch 55307fcb9258: "octeontx2-af: Add mbox messages to install 
and delete MCAM rules" from Nov 15, 2020, leads to the following 
Smatch complaint:

    drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c:1001 npc_install_flow()
    error: we previously assumed 'def_ucast_rule' could be null (see line 975)

drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c
   974	
   975		if (def_ucast_rule)
                    ^^^^^^^^^^^^^^
This can be NULL

   976			missing_features = (def_ucast_rule->features ^ features) &
   977						def_ucast_rule->features;
   978	
   979		if (req->default_rule && req->append) {
   980			/* add to default rule */
   981			if (missing_features)
   982				npc_update_flow(rvu, entry, missing_features,
   983						&def_ucast_rule->packet,
   984						&def_ucast_rule->mask,
   985						&dummy, req->intf);
   986			enable = rvu_npc_write_default_rule(rvu, blkaddr,
   987							    nixlf, target,
   988							    pfvf->nix_rx_intf, entry,
   989							    &entry_index);
   990			installed_features = req->features | missing_features;
   991		} else if (req->default_rule && !req->append) {
   992			/* overwrite default rule */
   993			enable = rvu_npc_write_default_rule(rvu, blkaddr,
   994							    nixlf, target,
   995							    pfvf->nix_rx_intf, entry,
   996							    &entry_index);
   997		} else if (msg_from_vf) {
   998			/* normal rule - include default rule also to it for VF */
   999			npc_update_flow(rvu, entry, missing_features,
  1000					&def_ucast_rule->packet, &def_ucast_rule->mask,
                                        ^^^^^^^^^^^^^^^^^        ^^^^^^^^^^^^^^^
Unchecked dereferences.  The other paths check if "missing_features" is
true.

  1001					&dummy, req->intf);
  1002			installed_features = req->features | missing_features;
  1003		}

regards,
dan carpenter
