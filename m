From: "Brown, Aaron F" <aaron.f.brown@intel.com>
Date: Sat, 11 Jan 2014 22:19:58 +0000
Subject: RE: [E1000-devel] [patch v2] i40e: potential array underflow in i40e_vc_process_vf_msg()
Message-Id: <309B89C4C689E141A5FF6A0C5FB2118B7312AC70@ORSMSX101.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Saturday, January 11, 2014 1:59 AM
> To: Kirsher, Jeffrey T
> Cc: kernel-janitors@vger.kernel.org; e1000-devel@lists.sourceforge.net;
> Allan, Bruce W; Brandeburg, Jesse; Wei Yongjun; Ronciak, John
> Subject: [E1000-devel] [patch v2] i40e: potential array underflow in
> i40e_vc_process_vf_msg()
> 
> If "vf_id" is smaller than hw->func_caps.vf_base_id then it leads to an
> array underflow of the pf->vf[] array.  This is unlikely to happen unless
> the hardware is bad, but it's a small change and it silences a static
> checker warning.
> 
> Fixes: 7efa84b7abc1 ('i40e: support VFs on PFs other than 0')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: rebased.  commit message updated.
> 

Thanks Dan, I have applied it to Jeff's tree.  It still did not apply cleanly but I went ahead and spun a new patch with the change to get it into the queue.  Not sure what was going on, only visible difference I could see is the original tree seemed to contain:
---------------------------------------------------------
			   u32 v_retval, u8 *msg, u16 msglen)
{
---------------------------------------------------------
While the patch was looking for:
------------------------------------------------------------
			   u32 v_retval, u8 *msg, u16 msglen)  {
------------------------------------------------------------

