From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 26 Nov 2020 12:33:34 +0000
Subject: [bug report] octeontx2-pf: Add support for ethtool ntuple filters
Message-Id: <20201126123334.GA205581@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Subbaraya Sundeep,

The patch f0a1913f8a6f: "octeontx2-pf: Add support for ethtool ntuple
filters" from Nov 15, 2020, leads to the following static checker
warning:

	drivers/net/ethernet/marvell/octeontx2/nic/otx2_flows.c:51 otx2_alloc_mcam_entries()
	error: 'rsp' dereferencing possible ERR_PTR()

drivers/net/ethernet/marvell/octeontx2/nic/otx2_flows.c
    22  int otx2_alloc_mcam_entries(struct otx2_nic *pfvf)
    23  {
    24          struct otx2_flow_config *flow_cfg = pfvf->flow_cfg;
    25          struct npc_mcam_alloc_entry_req *req;
    26          struct npc_mcam_alloc_entry_rsp *rsp;
    27          int vf_vlan_max_flows;
    28          int i;
    29  
    30          mutex_lock(&pfvf->mbox.lock);
    31  
    32          req = otx2_mbox_alloc_msg_npc_mcam_alloc_entry(&pfvf->mbox);
    33          if (!req) {
    34                  mutex_unlock(&pfvf->mbox.lock);
    35                  return -ENOMEM;
    36          }
    37  
    38          vf_vlan_max_flows = pfvf->total_vfs * OTX2_PER_VF_VLAN_FLOWS;
    39          req->contig = false;
    40          req->count = OTX2_MCAM_COUNT + vf_vlan_max_flows;
    41  
    42          /* Send message to AF */
    43          if (otx2_sync_mbox_msg(&pfvf->mbox)) {
    44                  mutex_unlock(&pfvf->mbox.lock);
    45                  return -EINVAL;
    46          }
    47  
    48          rsp = (struct npc_mcam_alloc_entry_rsp *)otx2_mbox_get_rsp
    49                 (&pfvf->mbox.mbox, 0, &req->hdr);

The otx2_mbox_get_rsp() function can fail, but this code doesn't check
for errors.

    50  
    51          if (rsp->count != req->count) {
    52                  netdev_info(pfvf->netdev,
    53                              "Unable to allocate %d MCAM entries, got %d\n",
    54                              req->count, rsp->count);
    55                  /* support only ntuples here */
    56                  flow_cfg->ntuple_max_flows = rsp->count;
    57                  flow_cfg->ntuple_offset = 0;

regards,
dan carpenter
