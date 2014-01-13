From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 13 Jan 2014 07:54:22 +0000
Subject: Re: [E1000-devel] [patch v2] i40e: potential array underflow in i40e_vc_process_vf_msg()
Message-Id: <20140113075422.GA7444@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <309B89C4C689E141A5FF6A0C5FB2118B7312AC70@ORSMSX101.amr.corp.intel.com>
In-Reply-To: <309B89C4C689E141A5FF6A0C5FB2118B7312AC70@ORSMSX101.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Jan 11, 2014 at 10:19:58PM +0000, Brown, Aaron F wrote:
> Thanks Dan, I have applied it to Jeff's tree.  It still did not apply
> cleanly but I went ahead and spun a new patch with the change to get
> it into the queue.  Not sure what was going on, only visible
> difference I could see is the original tree seemed to contain:
> ---------------------------------------------------------
> 			   u32 v_retval, u8 *msg, u16 msglen)
> {
> ---------------------------------------------------------
> While the patch was looking for:
> ------------------------------------------------------------
> 			   u32 v_retval, u8 *msg, u16 msglen)  {
> ------------------------------------------------------------
> 

Sorry about that, but I think the problem is in one of your mail servers
somewhere.  The email in the marc.info archive has the curly braces in
the right place.

http://marc.info/?l=kernel-janitors&m8943435730292&w=2

regards,
dan carpenter
