From: Darren Hart <dvhart@infradead.org>
Date: Sat, 30 Jan 2016 17:42:39 +0000
Subject: Re: [patch] intel_scu_ipcutil: underflow in scu_reg_access()
Message-Id: <20160130174239.GC9269@malice.jf.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160126092425.GA15717@mwanda>
In-Reply-To: <20160126092425.GA15717@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sreedhara DS <sreedhara.ds@intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jan 26, 2016 at 12:24:25PM +0300, Dan Carpenter wrote:
> "count" is controlled by the user and it can be negative.  Let's prevent
> that by making it unsigned.  You have to have CAP_SYS_RAWIO to call this
> function so the bug is not as serious as it could be.
> 
> Fixes: 5369c02d951a ('intel_scu_ipc: Utility driver for intel scu ipc')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Queued to fixes for 4.5-rc1 as well as stable.

Thanks Dan,


-- 
Darren Hart
Intel Open Source Technology Center
