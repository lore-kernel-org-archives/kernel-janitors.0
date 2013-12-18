From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 18 Dec 2013 14:25:39 +0000
Subject: re: bnx2x: add afex support
Message-Id: <20131218142539.GA25830@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Barak Witkowski,

The patch a334872224a6: "bnx2x: add afex support" from Apr 23, 2012,
leads to the following static checker warning:
	drivers/net/ethernet/broadcom/bnx2x/bnx2x_sp.c:5913 bnx2x_func_send_afex_update()
	error: memset() 'rdata' too small (8 vs 24)

drivers/net/ethernet/broadcom/bnx2x/bnx2x_sp.c
  5903  static inline int bnx2x_func_send_afex_update(struct bnx2x *bp,
  5904                                           struct bnx2x_func_state_params *params)
  5905  {
  5906          struct bnx2x_func_sp_obj *o = params->f_obj;
  5907          struct function_update_data *rdata = (void *)o->afex_rdata;
  5908          dma_addr_t data_mapping = o->afex_rdata_mapping;
  5909          struct bnx2x_func_afex_update_params *afex_update_params   5910                  &params->params.afex_update;
  5911  
  5912          memset(rdata, 0, sizeof(*rdata));


->afex_rdata is a void pointer but actually it always points to a
struct afex_vif_list_ramrod_data.  You can verify this by looking at
bnx2x__init_func_obj() and following the code through the call to
bnx2x_init_func_obj().

The bnx2x_func_sp_obj struct is 24 bytes and afex_vif_list_ramrod_data
is 8 bytes so the static checker (pending changes to Smatch) seems
correct that we are corrupting memory here.  I don't know what the fix
is.

  5913  
  5914          /* Fill the ramrod data with provided parameters */
  5915          rdata->vif_id_change_flg = 1;
  5916          rdata->vif_id = cpu_to_le16(afex_update_params->vif_id);
  5917          rdata->afex_default_vlan_change_flg = 1;
  5918          rdata->afex_default_vlan   5919                  cpu_to_le16(afex_update_params->afex_default_vlan);

regards,
dan carpenter

