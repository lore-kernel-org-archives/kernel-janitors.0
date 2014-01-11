From: "Brown, Aaron F" <aaron.f.brown@intel.com>
Date: Sat, 11 Jan 2014 01:44:55 +0000
Subject: RE: [patch] i40e: potential array underflow in i40e_vc_process_vf_msg()
Message-Id: <309B89C4C689E141A5FF6A0C5FB2118B731295D7@ORSMSX101.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140109053103.GD1265@elgon.mountain>
In-Reply-To: <20140109053103.GD1265@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



> -----Original Message-----
> From: Williams, Mitch A
> Sent: Friday, January 10, 2014 10:50 AM
> To: Dan Carpenter; Kirsher, Jeffrey T; Brown, Aaron F
> Cc: Brandeburg, Jesse; Allan, Bruce W; Wyborny, Carolyn; Skidmore, Donald
> C; Rose, Gregory V; Duyck, Alexander H; Ronciak, John; Nelson, Shannon;
> Wei Yongjun; e1000-devel@lists.sourceforge.net; kernel-
> janitors@vger.kernel.org
> Subject: RE: [patch] i40e: potential array underflow in
> i40e_vc_process_vf_msg()
> 
> > -----Original Message-----
> > From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> > Sent: Wednesday, January 08, 2014 9:31 PM
> > To: Kirsher, Jeffrey T
> > Cc: Brandeburg, Jesse; Allan, Bruce W; Wyborny, Carolyn; Skidmore,
> > Donald C; Rose, Gregory V; Duyck, Alexander H; Ronciak, John;
> > Williams, Mitch A; Nelson, Shannon; Wei Yongjun;
> > e1000-devel@lists.sourceforge.net; kernel- janitors@vger.kernel.org
> > Subject: [patch] i40e: potential array underflow in
> > i40e_vc_process_vf_msg()
> >
> > If "vf_id" is smaller than hw->func_caps.vf_base_id then we leads to
> > an array underflow of the pf->vf[] array.
> >
> > Fixes: 7efa84b7abc1 ('i40e: support VFs on PFs other than 0')
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > diff --git a/drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c
> > b/drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c
> > index 55ec2db71fa1..89482a078e9d 100644
> > --- a/drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c
> > +++ b/drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c
> > @@ -1698,7 +1698,7 @@ int i40e_vc_process_vf_msg(struct i40e_pf *pf,
> > u16 vf_id, u32 v_opcode,
> >  			   u32 v_retval, u8 *msg, u16 msglen)  {
> >  	struct i40e_hw *hw = &pf->hw;
> > -	int local_vf_id = vf_id - hw->func_caps.vf_base_id;
> > +	unsigned int local_vf_id = vf_id - hw->func_caps.vf_base_id;
> >  	struct i40e_vf *vf;
> >  	int ret;
> >
> 
> Thanks, Dan. Aaron (covering for Jeff, who's on sabbatical) has pulled
> this into our internal queue for validation, and it will get pushed out
> with a regular update.

Actually, can I get you to re spin the patch based off a fresh pull from net-next?  There has been a whole lot of movement in the i40e code the last couple of days and this patch no longer applies cleanly.  It is straight forward enough that I could fix it up to make it apply to our internal tree, but would rather be able to send it on in as pure a form from you as possible.

Thanks,
Aaron

> 
> The patch is obviously valid, though I should point out that if this
> number ever turns out to be negative, there is something very, very wrong
> with the hardware, and we should probably all just run for cover.
> 
> -Mitch
