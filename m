From: Vinod Koul <vinod.koul@intel.com>
Date: Tue, 14 Mar 2017 02:42:40 +0000
Subject: Re: [PATCH] engine: mv_xor: remove redundant null check on cd
Message-Id: <20170314023039.GY2843@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170301140721.22341-1-colin.king@canonical.com>
In-Reply-To: <20170301140721.22341-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Mar 01, 2017 at 02:07:21PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The check to see if cd is null is redundant, pdata->channels is
> never null at this point, and hence &pdata->channels[i] cannot
> be null, so remove the null check.
> 
> Detected by CoverityScan, CID#1357194 ("Logically Dead Code")

Applied after fixing subsystem name

-- 
~Vinod
